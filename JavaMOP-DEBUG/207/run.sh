javamop -merge -keepRVFiles problemSet
mkdir -p classes/mop
rv-monitor -merge -d classes/mop/ `find -name "*.rvm"`
javac classes/mop/*.java
rm classes/mop/*.java
javamopagent MultiSpec_1MonitorAspect.aj classes -n JavaMOPAgent -v
