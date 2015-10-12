Start=$(date +"%s")
echo "Start time : $Start" > time.txt

/home/xiaohe/SW/offline-log-analysis/existingApp/rv13-experiments/monpoly/monpoly -sig delete.sig -formula $1 -log $2 -negate 

End=$(date +"%s")
echo "Finish time : $End" >> time.txt
Diff=$(( $End - $Start ))
echo "\nIt took $Diff seconds to analyze insert2 property in the log $2" >> time.txt
