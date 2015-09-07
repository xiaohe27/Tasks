rm *.dll
rm *.mdb

Start=$(date +"%s")
echo "Start time : $Start" 

Dafny.exe $1

End=$(date +"%s")
echo "Finish time : $End"
Diff=$(( $End - $Start ))
echo "It took Dafny $Diff seconds to verify the program!"

