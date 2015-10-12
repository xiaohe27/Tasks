Out=timeFor9MLog-Mon-Siebel.txt
Start=$(date +"%s")
echo "Start time : $Start" > $Out

#/home/xiaohe/SW/offline-log-analysis/30MB-Log/0.5M.log
#/home/xiaohe/SW/offline-log-analysis/30MB-Log/oneM.log
#/home/xiaohe/SW/offline-log-analysis/ldcc4Monpoly
#/home/xiaohe/SW/offline-log-analysis/30MB-Log/oneM-fault-end.log
#/home/xiaohe/SW/offline-log-analysis/30MB-Log/oneM-fault-begin.log

FORMULA=delete12-simplified.mfotl

/home/xiaohe/SW/offline-log-analysis/existingApp/monpoly-1.1.2/monpoly -sig delete.sig -formula $FORMULA -negate -log /home/xiaohe/SW/offline-log-analysis/ldcc4Monpoly 

End=$(date +"%s")
echo "Finish time : $End" >> $Out
Diff=$(( $End - $Start ))
echo "\nIt took Monpoly (opt) $Diff seconds to output all violations of delete-1-2 Property in the 308MB log file!" >> $Out
