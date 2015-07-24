OUT="$1.pkast"
krun $1 --directory "../src/prep" --parser "kj-parse-aggreg.sh" --output kast > $OUT

TMP="tmp1.txt"

sed "s/'KListWrap/'ListWrap/g" < $OUT > $TMP

tr -d ' ' <$TMP >$OUT
tr -d '\t' <$OUT >$TMP
tr -d '\n' <$TMP >$OUT
tr -d '\r' <$OUT >$TMP

sed -r 's/.*<program>//g' < $TMP > $OUT
sed -r 's/</program>.*//g' < $OUT > $TMP

mv $TMP $OUT

ClsName=$(echo $1 | tr -d ".java")
krun $OUT --directory "../src/exec" -cMainClass="ListItem(\"$ClsName\")" -cDissolveAllExceptOut="true" --parser "cat" --output none
