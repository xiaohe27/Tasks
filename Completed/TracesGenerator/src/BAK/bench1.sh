rm benchmark1/mop/classes/mop/*.class
rm agent.jar
rm benchmark1/mop/agent.jar

CP="benchmark1:share:."
javac -cp $CP share/common/*.java
javac -cp $CP benchmark1/code1/*.java
cd benchmark1/mop
mkdir -p classes/mop
rv-monitor -d classes/mop -s SafeMapIterator.rvm
javac classes/mop/*.java
rm classes/mop/*.java

javamopagent SafeMapIteratorMonitorAspect.aj classes

mv agent.jar ../..
cd ../..

java -javaagent:agent.jar -d64 -Xms512m -Xmx4g -cp $CP common.RunTest $1 $2 1 1> trace.csv 2> Num1_err
