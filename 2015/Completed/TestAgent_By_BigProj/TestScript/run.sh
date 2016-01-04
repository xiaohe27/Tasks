#!/bin/bash

BASE_DIR=`pwd`
POM_CHANGER=${BASE_DIR}"/pom-modify/modify-project.sh"
SUBJECT_DIR=${BASE_DIR}"/subjects"
MOP_DATA_DIR="results/mop"
PREDICT_DATA_DIR="results/predict"
HISTORY_DATA_DIR="results/history"

JMOP_DIR="javamop/"
JMOP_BIN=$JMOP_DIR"bin/javamop" 
AGENT_NAME="JavaMOPAgent"
BASE_ASPECT_FILE="BaseAspect.aj"

LIST_OF_PROJECTS="projects_list.txt"

is_agent_installed=0

# It may be necessary at some point to add these to the downloaded
# JavaMOP in order to filter properties
#
# CONFIG_FILE="mop.conf"
# OMIT_FILE="omit.txt"

# check whether agent is installed
function check_agent ()
{
    is_agent_installed=`find $HOME/.m2 -name "javamop-agent-1.0.jar" | wc -l`
}

# clone JavaMOP
function download_javamop ()
{
    if [ ! -d "$JMOP_DIR" ]; then
	git clone  https://github.com/runtimeverification/javamop
    fi

    cd $JMOP_DIR
    git checkout b46893a3bed1e9731a5bb039244a919cf4d7266d # version as at: 09/28/2014
    mvn package
    cd -
}

function run_javamop ()
{
    $JMOP_BIN -agent -n $AGENT_NAME -usedb -baseaspect BaseAspect.aj
}

function install_agent ()
{
   mvn install:install-file -Dfile=$AGENT_NAME".jar" -DgroupId="javamop-agent" -DartifactId="javamop-agent" -Dversion="1.0" -Dpackaging="jar"
}

function copy_from_backup()
{
    # TODO: make backup and project local and pass parameters to them
    echo "D: Copying ${backup} to ${project_name} ..."        
    cp -R $backup $project_name
}

function get_project(){
    local project_name=$1
    local project_url=$2
    local sha=$3

    local backup=$project_name"-bak"

    # check if a backup of that project existed before
    if [ -d $backup ]; then
        rm -rf $project_name
        copy_from_backup
        if [[ ! -z ${sha} ]] && [[ ${project_url} == *github* ]]; then
            cd $project_name
            git checkout ${sha}
            cd -
        fi
    else
        echo "D: Cloning ${project_name} from ${project_url} ..."
        if [[ ${project_url} == *github* ]]; then
            git clone ${project_url} ${backup}
            copy_from_backup
            if [[ ! -z ${sha} ]]; then
                cd ${project_name}
                echo "D: checking out SHA ${sha}"
                git checkout ${sha}
                cd -
            fi
        fi
        
        if [[ ${project_url} == *svn.* ]]; then
            echo "D: Checking out ${project_name} from ${project_url} ... "
            svn checkout -r ${sha} ${project_url} ${backup}
            copy_from_backup
        fi
    fi
}

function record_status ()
{
    local name2=$1
    echo "NAME2: "$1
    local base=$2
    local mop=$3
    local b_idx=0
    local m_idx=0

    echo "NAME: "$name


    if [[ $base == "[INFO] BUILD SUCCESS" ]]; then
        b_idx=1
    fi
    
    if [[ $mop == "[INFO] BUILD SUCCESS" ]]; then
        m_idx=1
    fi
   
    echo $name2": "$b_idx"-"$m_idx
    echo $name2": "$b_idx"-"$m_idx >> $status_tracker
    
}

function make_status_files()
{
    for i in "$@"; do
        if [[ ! -e $i ]]; then
            touch $i
        else
            printf "" > $i
        fi
    done
}

function mvn_test() 
{
    local out_file=$1
    local list_of_tests=$2
    if [[ -z $list_of_tests ]]; then
        optional=""
    else
        concat=( `cat ${list_of_tests} | paste -sd,` )
        optional="-Dtest=$concat"
    fi

    { time mvn test ${optional} -fn | tee ${out_file} ; } 2>> ${out_file}
}

function run_multiple_projects ()
{
    local REPO_LIST=$1
    local tool=$2

    while read project_url sha project_name size run_status
    do
	#delete once on each iteration
	if [ ${tool} == "predict" ]; then
	    rm -rf /tmp/rv-predict* /tmp/*.tmp
	fi
	    
        echo "D: Project name is "$project_name

        echo "D: Entering $SUBJECT_DIR ..."

        cd ${SUBJECT_DIR}
        get_project $project_name $project_url $sha    

        echo "D: computing project size ..."
        sloc=$(sloccount $project_name | grep "java:" | cut -d: -f 2 | cut -d'(' -f 1 | tr -d ' ')

        echo "D: computing number of tests and base time ..."

        cd ${project_name}
        local base_out="base_out.txt"
        mvn_test ${base_out}
        cd -

        echo "D: running tests with ${tool} turned on"

        cd ${project_name}

	${POM_CHANGER} `pwd` ${tool}

        raw_out="raw"
	mvn_test $raw_out

        ## Used while sourcing for projects from scrapped
        # base_status=`grep "\[INFO\] BUILD SUCCESS" ${base_out}`
	# tool_status=`grep "\[INFO\] BUILD SUCCESS" ${raw_out}`
    
	# local status_tracker=$BASE_DIR"/tracker.txt"
	# local good_projects=$BASE_DIR"/good.txt"
	
	# make_status_files $status_tracker $good_projects
        #record the status to file
        # local b_idx=0
        # local m_idx=0

        # if [[ $base_status == "[INFO] BUILD SUCCESS" ]]; then
        #     b_idx=1
        # fi
        
        # if [[ $tool_status == "[INFO] BUILD SUCCESS" ]]; then
        #     m_idx=1
        # fi
        
        # echo $project_name": "$b_idx"-"$m_idx >> $status_tracker
        # if [[ $m_idx == 1 ]] && [[ $b_idx == 1 ]]; then
        #     echo $project_url" "$sha" "$project_name" "$sloc" "0 >> $good_projects 
        # fi

	if [ ${tool} == "predict" ]; then
	    size=$(du -sh /tmp/ | cut -f1 -s | tr -d ' ')
	    printf "\n<tmpSize>\n" >> $raw_out
	    echo $size >> $raw_out
	    printf "</tmpSize>\n">> $raw_out
	fi

	process_output $project_name $base_out $raw_out $sloc $run_status $tool
        cd ${BASE_DIR}

    done < $REPO_LIST
}

function process_output ()
{
    local project_name=$1
    local base_out=$2
    local raw_out=$3
    local project_size=$4
    local monitoring_status=$5
    # local tool=$6

    local temp_out="temp"
    local test_output=$project_name"-test-output.txt"

    printf "\n<Raw>\n" > $test_output
    cat $raw_out >> $test_output
    printf "\n</Raw>\n" >> $test_output
    
    if [ ${tool} == "javamop" ]; then
	echo "D: Counting Unique Violation Messages and Descriptions ..."
	
        # each violation comes with a message, get a count for each unique
        # description (useful for ??)
	printf "\n<UniqueCountViolationMessage>\n" >> $test_output
	cat $raw_out | grep ^Spec | grep -v -- -- | sort | uniq -c >> $test_output
	printf "</UniqueCountViolationMessage>\n" >> $test_output
	
        # each violation comes with a description, get a count for each
        # unique description (useful for manual inspection)
	printf "\n<UniqueCountViolationDescription>\n" >> $test_output
	cat $raw_out | grep -A 1 ^Spec | grep -v ^Spec | grep -v -- -- | sort | uniq -c >> $test_output
	printf "</UniqueCountViolationDescription>\n" >> $test_output
    
	echo "D: Counting Unique Violations by severity level and package..."

	cat $raw_out | grep ^Spec | cut -d' ' -f 2 | sort | uniq -c > $temp_out

        # for each property violated, how many times was it violated in
        # this run?
	printf "\n<UniquePropertyViolatedCount>\n" >> $test_output
	cat $temp_out >> $test_output
	printf "</UniquePropertyViolatedCount>\n" >> $test_output
	
	errors=0
	warnings=0
	suggestions=0
	
	net=0
	lang=0
	util=0
	io=0
	
	while read count property
	do
            severity=(`cat ../../map_of_properties.txt | grep ^$property | cut -d' ' -f 2`)
            if [ $severity == "error" ]; then
		errors=$((errors + $count))
            elif [ $severity == "warning" ]; then
		warnings=$((warnings + $count))
            elif [ $severity == "suggestion" ]; then
		suggestions=$((suggestions + $count))
            fi
            
            package=(`cat ../../map_of_properties.txt | grep ^$property | cut -d' ' -f 3`)
            if [ $package == "net" ]; then
		net=$((net + $count))
            elif [ $package == "lang" ]; then
		lang=$((lang + $count))
            elif [ $package == "util" ]; then
		util=$((util + $count))
            elif [ $package == "io" ]; then
		io=$((io + $count))
            fi
	done < $temp_out
	
        # total number of times a property in from each severity level was
        # violated
	printf "\n<SeverityCountTotal>\n" >> $test_output
	echo "errors: "$errors >> $test_output
	echo "warnings: "$warnings  >> $test_output
	echo "suggestions: "$suggestions  >> $test_output
	printf "</SeverityCountTotal>\n" >> $test_output
	
        # total number of times violation a property from each package was
        # violated
	printf "\n<UniquePackage>\n" >> $test_output
	echo "net: "$net >> $test_output
	echo "lang: "$lang >> $test_output
	echo "util: "$util >> $test_output
	echo "io: "$io >> $test_output
	printf "</UniquePackage>\n" >> $test_output
    fi

    base_time=$(cat ${base_out} | grep ^real | cut -f2 -s)
    monitoring_time=$(cat ${raw_out} | grep ^real | cut -f2 -s)

    # times with and without overhead
    printf "\n<Times>\n" >> $test_output
    echo "base: "$base_time >> $test_output
    echo "monitoring: "$monitoring_time >> $test_output
    printf "</Times>\n" >> $test_output

    # number of tests in the project
    tests_count=$(cat ${base_out} | grep -A 2 "Results :" | grep ^Tests | cut -d, -f 1 | cut -d: -f 2 | tr -d ' ' | paste -sd+ | bc)
    printf "\n<TestCount>\n" >> $test_output
    echo $tests_count >> $test_output
    printf "</TestCount>\n" >> $test_output

    # the size of the project
    printf "\n<SizeLOC>\n" >> $test_output
    echo $project_size >> $test_output
    printf "</SizeLOC>\n" >> $test_output

    # did the project run fine with monitoring?  
    # (0=[yes], 1=[yes, but there were test failures])
    printf "\n<MonitoringStatus>\n" >> $test_output
    echo $monitoring_status >> $test_output
    printf "</MonitoringStatus>\n" >> $test_output

    rm $raw_out
    rm $temp_out

    # copy the output file to data directory
    if [ $tool == "javamop" ]; then
	cp $test_output ../../../$MOP_DATA_DIR
    fi

    if [ $tool == "predict" ]; then
        cp $test_output ../../../$PREDICT_DATA_DIR
    fi
}

function checkout_poms()
{
    find -name pom.xml | xargs git checkout
}

function run_single_sha()
{
    local mode=$1
    local idx=$2
    local new_sha=$3
    local count_file=$4
    local tool=""
    local output_file="" 
    local list_file="tests.txt"
    local temp="temp.txt"

    checkout_poms
    git checkout $new_sha

    if [ $mode == raw ]; then
        output_file="raw-"${idx}".txt"
        mvn_test ${temp}
        ( cat ${temp} | grep 'Running' | sed 's/.*Running \(.*\)/\1/g' | grep -v 'FAILED' ) > ${list_file}
    elif [ $mode == rts ]; then
        output_file="rts-"${idx}".txt"
        tool="ekstazi"
        ${POM_CHANGER} `pwd` $tool
        mvn_test ${temp}
        ( cat ${temp} | grep 'Running' | sed 's/.*Running \(.*\)/\1/g' | grep -v 'FAILED' ) > ${list_file}
        checkout_poms
    fi

    ${POM_CHANGER} `pwd` javamop
    
    if [ $mode == raw ]; then
        mvn_test ${output_file}
    elif [ $mode == rts ]; then
        mvn_test ${output_file} ${list_file}
    fi

    tool_status=`grep "\[INFO\] BUILD SUCCESS" ${output_file}`
    spec_count=$(cat ${output_file} | grep ^Spec | wc -l)
    time=$(cat ${output_file} | grep "^real" | cut -s -f 2)
    tests_run=$(cat ${list_file} | wc -l)
    output="${new_sha} - ${spec_count} - ${time}"
    if [[ $tool_status == "[INFO] BUILD SUCCESS" ]]; then
        echo "${output} - success - ${tests_run}" >> $count_file
    else
        echo "${output} - fail - ${tests_run}" >> $count_file
    fi
}

function compute_diffs()
{
    local idx=$1
    local sha=$2
    local diff_count_file=$3
    local rts_diff_count_file=$4
    local prior=$((idx + 1))
    #TODO: extract this to a function
    cat raw-$idx.txt | grep ^Spec | grep -v -- -- | sort > current
    cat raw-$prior.txt | grep ^Spec | grep -v -- -- | sort > prior
    diffCount=$(diff current prior | grep "<" | wc -l)

    echo "$sha - $diffCount" >> $diff_count_file

    cat rts-$idx.txt | grep ^Spec | grep -v -- -- | sort > current
    cat rts-$prior.txt | grep ^Spec | grep -v -- -- | sort > prior
    diffCount=$(diff current prior | grep "<" | wc -l)

    echo "$sha - $diffCount" >> $rts_diff_count_file
}

function run_evolution()
{
    local list=$1
    local raw_count_file="raw_count.txt"
    local diff_count_file="diff_count.txt"
    local rts_diff_count_file="rts_diff_count.txt"
    local rts_count_file="rts_count.txt"
    local sha_file="sha-file.txt"
    while read project_url sha project_name run_status
    do
        cd ${SUBJECT_DIR}
        get_project $project_name $project_url
        cd ${project_name}
        store=../../../$HISTORY_DATA_DIR/$project_name
        if [ ! -d $store ]; then
            mkdir $store
        fi
        git log --pretty="oneline" | head -60 | cat | cut -d' ' -f1 | tr -d ' ' > temp
        tac temp > $sha_file
        idx=$(cat $sha_file | wc -l)
        total=$idx
        printf "" > $raw_count_file
        while read new_sha
        do
            echo "SHA: $idx => $new_sha"
            run_single_sha rts $idx $new_sha $rts_count_file
            run_single_sha raw $idx $new_sha $raw_count_file
            if [ $idx == $total ]; then
                echo "$new_sha - 0" > $diff_count_file
            else
                compute_diffs $idx $new_sha $diff_count_file $rts_diff_count_file
            fi

            idx=$((idx - 1))
        done < $sha_file
        cp $raw_count_file $store
        cp $diff_count_file $store
        cp $rts_count_file $store
        cp $rts_diff_count_file $store
        rm temp
        cd -
        cd ${BASE_DIR}
    done < $list
}

# create a mapping from properties to severity levels and package
function make_severity_map()
{
    property_dir="properties/annotated-java-api/java/"
    map_file="map_of_properties.txt"
    rm -rf $map_file
    for dir in `find $property_dir -mindepth 1 -type d`; do
        for property_file in `find $dir -name "*.mop"`; do
            property_name=(`echo $(basename $property_file) | cut -d. -f 1`)
            severity=(`cat $property_file | grep @severity | cut -d' ' -f 4`)
            printf $property_name" "$severity" "$(basename $dir)"\n" >> $map_file
        done
    done
}

# "main"
# clean out artifacts from previous run
if [[ "$#" -gt 0 ]] && [[ "$1" == "clean" ]]; then
    rm -rf $JMOP_DIR $AGENT_NAME".jar" properties properties-copy
    find $HOME/.m2 -name "javamop-agent-1.0.jar" -exec rm {} \;
    echo "Cleaning Complete"
    exit
fi

if [ ! -d ../$MOP_DATA_DIR ]; then
    mkdir ../$MOP_DATA_DIR
fi

if [ ! -d ../$PREDICT_DATA_DIR ]; then
    mkdir ../$PREDICT_DATA_DIR
fi

if [ ! -d ../$HISTORY_DATA_DIR ]; then
    mkdir ../$HISTORY_DATA_DIR
fi

if [ ! -d ${SUBJECT_DIR} ]; then
    mkdir ${SUBJECT_DIR}
fi

check_agent

if [ $is_agent_installed -eq 0 ]; then
    download_javamop
    run_javamop
    install_agent
fi

# make a table mapping each property to severity level
if [[ "$#" -gt 0 ]] && [[ "$1" == "map" ]]; then
  make_severity_map
  exit
fi

# this function takes a file with a list of projects to be run (one
# per line) -- see project_list.txt in the same directory as this
# script
if [ $# -gt 0 ]; then
    if [[ $1 == "predict" ]]; then
        run_multiple_projects $LIST_OF_PROJECTS predict
    fi

    if [[ $1 == "history" ]]; then
        run_evolution $LIST_OF_PROJECTS
    fi
else
    run_multiple_projects $LIST_OF_PROJECTS javamop
fi

# python create_latex.py
