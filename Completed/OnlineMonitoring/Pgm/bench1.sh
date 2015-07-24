rm benchmark1/mop/classes/mop/*.class
rm agent.jar
rm benchmark1/mop/agent.jar

javac benchmark1/*.java
cd benchmark1/mop
mkdir -p classes/mop
rv-monitor -d classes/mop -s SafeMapIterator.rvm
javac classes/mop/*.java
rm classes/mop/*.java

javamopagent SafeMapIteratorMonitorAspect.aj classes

mv agent.jar ../..
cd ../..

java -javaagent:agent.jar -d64 -Xms512m -Xmx4g benchmark1.Main $1 $2 2> Num1_err
