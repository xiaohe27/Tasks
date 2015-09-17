Start=$(date +"%s")
echo "Start time : $Start" > time.txt

/home/xiaohe/SW/offline-log-analysis/existingApp/rv13-experiments/monpoly/monpoly -sig sig -formula $1 -log /home/xiaohe/SW/offline-log-analysis/ldcc4Monpoly -negate > insert2-violation.txt

End=$(date +"%s")
echo "Finish time : $End" >> time.txt
Diff=$(( $End - $Start ))
echo "\nIt took $Diff seconds to analyze insert2 property in the 9M log ldcc4Monpoly" >> time.txt
