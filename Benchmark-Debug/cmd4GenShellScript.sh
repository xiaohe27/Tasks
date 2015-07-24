sed "s/\([[:digit:]]*\)/sed \'s\/next, \1, \\\\r\/\/g\' |/g" < rm_me.txt > rm_me.sh 
