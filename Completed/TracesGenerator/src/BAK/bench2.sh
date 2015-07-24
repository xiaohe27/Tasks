javac benchmark2/*.java
cd benchmark2/mop
mkdir -p classes/mop

rv-monitor -d classes/mop -s SafeFileWriter.rvm
javac classes/mop/*.java
rm classes/mop/*.java

javamopagent SafeFileWriterMonitorAspect.aj classes

mv agent.jar ../
cd ../

java -javaagent:agent.jar -d64 -Xms512m -Xmx4g TraceGen $1 $2 1> trace.csv 2> Num2_err
