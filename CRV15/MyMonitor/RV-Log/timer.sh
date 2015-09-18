Start=$(date +"%s")
echo "Start time : $Start" > time.txt

sh run.sh /home/xiaohe/SW/offline-log-analysis/ldcc4Monpoly Insert2.rvm

End=$(date +"%s")
echo "Finish time : $End" >> time.txt
Diff=$(( $End - $Start ))
echo "\nIt took my app $Diff seconds to analyze insert2 property in the 9M log ldcc4Monpoly" >> time.txt
