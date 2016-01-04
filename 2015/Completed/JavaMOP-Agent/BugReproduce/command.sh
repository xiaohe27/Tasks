mkdir aj
javamop -keepRVFiles -merge -d aj UnsafeIterator.mop UnsafeMapIterator.mop 
mkdir classes
mv aj/*.java classes

javac classes/*.java
rm classes/*.java

javamopagent aj/*.aj classes

java -javaagent:agent.jar SafeMapIterator_1 2> debug.txt
