#!/bin/bash


# The below incantation sets SRC_ROOT to be the canonicalized directory of this script
SRC_ROOT=$(
cd -P -- "$(dirname -- "$0")" &&
printf '%s\n' "$(pwd -P)/$(basename -- "$0")"
) || exit 1
SRC_ROOT=`dirname "$SRC_ROOT"`

RELEASE="$SRC_ROOT/rvmLib"
export CLASSPATH="$RELEASE/rv-monitor.jar:$RELEASE/rv-monitor-rt.jar:$CLASSPATH"

#The first argument is the path (relative to the location of this script) to the trace file.
#The second argument is the relative path to the specification file. 
#The options -events, -witness and -trace can be given afterwards in any order.

TraceFile=$1
SpecFile=$2
shift;
shift;

#The '-t' option is provided to both rv-log and rv-monitor for specification 'T3B2.rvm'
TimeProp=""
Raw=""
Other=""
Format=""

if [[ $SpecFile == *"T3B2.rvm"* ]]
then TimeProp="-t"
fi

if [[ $SpecFile == *"Insert2.rvm"* ]]
then TimeProp="-t"
fi

if [[ $SpecFile == *"T7B1.rvm"* ]]
then Raw="--raw"
fi

if [[ $SpecFile == *"T3B4.rvm"* ]]
then Other="--other"
fi



TraceFile="$SRC_ROOT/$TraceFile"
SpecFile="$SRC_ROOT/$SpecFile"

Format="--format=monpoly"

$SRC_ROOT/rv-log $TimeProp $Raw $Other $Format $SpecFile  # >/dev/null

$SRC_ROOT/rv-monitor -d CustomizedLogReader/rvm/ --indexByVal $TimeProp $@ $SpecFile # >/dev/null

javac CustomizedLogReader/rvm/*.java  # 2>/dev/null
cd CustomizedLogReader/



Start=$(date +"%s")
echo "Start time : $Start" > time.txt


java -d64 -Xms512m -Xmx4g rvm.LogReader $TraceFile


End=$(date +"%s")
echo "Finish time : $End" >> time.txt
Diff=$(( $End - $Start ))
echo "\nIt took my app $Diff seconds to analyze insert2 property in the 9M log ldcc4Monpoly" >> time.txt
