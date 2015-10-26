Out=myTime.txt

Start=$(date +"%s")
echo "Start time : $Start" > $Out

#108000 is 30h
#/home/xiaohe/SW/offline-log-analysis/ldcc4Monpoly
#/home/xiaohe/workspace/DATA/ldccComplete_MonpolyStyle
java rvm.LogReader /home/xiaohe/workspace/DATA/ldccComplete_MonpolyStyle 2> violation.txt

End=$(date +"%s")
echo "\nFinish time : $End" >> $Out
Diff=$(( $End - $Start ))
echo "\nIt took RV-Log $Diff seconds to monitor del12 property in the 7.6G complete Nokia log at siebel" >> $Out
