Out=timeFor9MLog-Mon-Siebel.txt
Start=$(date +"%s")
echo "Start time : $Start" > $Out

#/home/xiaohe/SW/offline-log-analysis/30MB-Log/0.5M.log
#/home/xiaohe/SW/offline-log-analysis/30MB-Log/oneM.log
#/home/xiaohe/SW/offline-log-analysis/ldcc4Monpoly
#/home/xiaohe/SW/offline-log-analysis/30MB-Log/oneM-fault-end.log
#/home/xiaohe/SW/offline-log-analysis/30MB-Log/oneM-fault-begin.log

/home/xiaohe/SW/offline-log-analysis/existingApp/monpoly-1.1.2/monpoly -sig delete.sig -formula delete12.mfotl -negate -log /home/xiaohe/SW/offline-log-analysis/ldcc4Monpoly > violations.txt

End=$(date +"%s")
echo "Finish time : $End" >> $Out
Diff=$(( $End - $Start ))
echo "\nIt took Monpoly (opt) $Diff seconds to output all violations of delete-1-2 Property in the 33.5MB log file!" >> $Out
