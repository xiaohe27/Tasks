1. cd spec
2. javamop SafeWrite.mop
3. mkdir -p classes/mop
4. rv-monitor -d classes/mop SafeWrite.rvm
5. javac -cp ../src:$CLASSPATH classes/mop/*.java
6. javac -d classes ../src/test/FilePath.java
7. javamopagent SafeWriteMonitorAspect.aj classes

8. The agent.jar should be generated and you can use it like this:
//suppose you have test.Main compiled in current directory.

java -javaagent:agent.jar test.Main

The above commands are suitable for unix-like system.
on windows os, replace / with \

and for step 3, you may manually create the folders classes\mop.

for step 5, use
javac -cp ..\src;%CLASSPATH% classes\mop\*.java

