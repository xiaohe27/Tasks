Out=myOut.txt

Start=$(date +"%s")
echo "Start time : $Start" > $Out

#108000 is 30h
#/home/xiaohe/SW/offline-log-analysis/ldcc4Monpoly
java rvm.LogReader $1 

End=$(date +"%s")
echo "\nFinish time : $End" >> $Out
Diff=$(( $End - $Start ))
echo "\nIt took RV-Log $Diff seconds to monitor del12 property in the 9M log ldcc4Monpoly at siebel" >> $Out
