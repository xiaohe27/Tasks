ID=$1
javamop "EnforceTest$ID.mop"
rv-monitor "EnforceTest$ID.rvm"
ajc -1.6 -d kk2 Main.java EnforceTest"$ID"RuntimeMonitor.java EnforceTest"$ID"MonitorAspect.aj	

cd kk2 
java Main

