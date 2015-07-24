rm *.jar
CP="benchmark1:benchmark2:benchmark3:benchmark4:benchmark5:share:."
javac -cp $CP share/common/*.java

Benchmark="benchmark$3"
Code="code$3"
javac -cp $CP $Benchmark/$Code/*.java
cd $Benchmark/mop
mkdir -p classes/mop
rv-monitor -d classes/mop -s *.rvm
javac classes/mop/*.java
rm classes/mop/*.java

javamopagent *.aj classes

mv agent.jar ../..
cd ../..

java -javaagent:agent.jar -d64 -Xms512m -Xmx4g -cp $CP common.RunTest $1 $2 $3 1> trace.csv 2> "Num$3_err"
