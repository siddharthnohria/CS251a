#!/bin/bash

IFS=$'\n'

d=0
nm=0
sed "s/^[ \t]*//" -i a.txt    # Removes leading White spaces 
while IFS='' read -r line || [[ -n "$line" ]]; do
   a=$(echo $line | grep -Eo '^[^ ]+') 
   
   if [ "$a" == "</dir>" ]; then
	cd ..
   elif [ "$a" == "<dir>" ]; then
        d=0
   elif [ "$a" == "<file>" ]; then
        d=1
   elif [ "$a" == "<name>" ] && [ $d == 0 ]; then
	cnt=$( echo $line | wc -w )
	cnt=$(( $cnt - 1 ))
   	nm=$( echo $line | cut -d " " -f 2-$cnt )   
	mkdir $nm
	cd $nm
   elif [ "$a" == "<name>" ] && [ $d == 1 ]; then	
	cnt=$( echo $line | wc -w )
	cnt=$(( $cnt - 1 ))
   	nm=$( echo $line | cut -d " " -f 2-$cnt )
   elif [ "$a" == "<size>" ] && [ $d == 1 ]; then
	cnt=$( echo $line | wc -w )
	cnt=$(( $cnt - 1 ))
   	sz=$( echo $line | cut -d " " -f 2-$cnt )
	touch $nm
	fallocate -l $(($sz)) $nm
	d=0
   fi
done < "$1"


