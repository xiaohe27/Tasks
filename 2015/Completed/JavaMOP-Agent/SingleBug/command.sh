mkdir aj
javamop -keepRVFiles -merge -d aj UnsafeIterator.mop 
mkdir classes
mv aj/*.java classes

javac classes/*.java
rm classes/*.java

javamopagent aj/*.aj classes

java -javaagent:agent.jar HasNext_1 2> debug.txt
