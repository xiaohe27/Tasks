Out=myOut.txt

Start=$(date +"%s")
echo "Start time : $Start" > $Out

java rvm.LogReader $1

End=$(date +"%s")
echo "\nFinish time : $End" >> $Out
Diff=$(( $End - $Start ))
echo "\nIt took RV-Log $Diff seconds to monitor insert2 property in the 9M log ldcc4Monpoly at siebel" >> $Out
