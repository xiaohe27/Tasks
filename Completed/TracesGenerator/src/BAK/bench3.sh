javac benchmark3/code/*.java
cd benchmark3/mop
mkdir -p classes/mop

rv-monitor -d classes/mop -s HasNext.rvm
javac classes/mop/*.java
rm classes/mop/*.java

javamopagent HasNextMonitorAspect.aj classes

mv agent.jar ../
cd ../

java -javaagent:agent.jar -d64 -Xms512m -Xmx4g common.TraceGen $1 $2 1> trace3.csv 2> Num3_err
