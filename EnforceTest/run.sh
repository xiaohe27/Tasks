javamop EnforceTest.mop
rv-monitor EnforceTest.rvm 
ajc -1.6 -d kk2 Main.java EnforceTestRuntimeMonitor.java EnforceTestMonitorAspect.aj	

cd kk2 
java Main

