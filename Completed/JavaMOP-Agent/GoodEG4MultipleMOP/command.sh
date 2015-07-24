sh clean.sh

mkdir aj
javamop -keepRVFiles -merge -d aj *.mop 
mkdir classes
rv-monitor *.rvm -d classes

javac classes/*.java
rm classes/*.java

javamopagent aj/*.aj classes


java -javaagent:agent.jar SafeEnum_1 >> debug.txt
java -javaagent:agent.jar HasNext_1 2>> debug.txt
java -javaagent:agent.jar SafeFile_1 >> debug.txt
