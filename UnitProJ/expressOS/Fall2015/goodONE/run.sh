rm *.dll
rm *.mdb

Start=$(date +"%s")
echo "Start time : $Start" 

Dafny.exe $1

End=$(date +"%s")
echo "\nFinish time : $End"
Diff=$(( $End - $Start ))
echo "\nIt took Dafny $Diff seconds to verify the program!"

