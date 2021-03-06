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
if [[ $SpecFile == *"T3B2.rvm"* ]]
then TimeProp="-t"
fi

TraceFile="$SRC_ROOT/$TraceFile"
SpecFile="$SRC_ROOT/$SpecFile"


$SRC_ROOT/rv-log $TimeProp $SpecFile >/dev/null

$SRC_ROOT/rv-monitor -d CustomizedLogReader/rvm/ --indexByVal $TimeProp $@ $SpecFile >/dev/null

javac CustomizedLogReader/rvm/*.java 2>/dev/null
cd CustomizedLogReader/

java -d32 -Xms512m -Xmx2g rvm.LogReader $TraceFile
