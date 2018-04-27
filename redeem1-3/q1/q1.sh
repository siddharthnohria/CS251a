#!/bin/bash

IFS=$'\n'

d=0
nm=0
sed "s/^[ \t]*//" -i a.txt    # Removes leading White spaces 
while IFS='' read -r line || [[ -n "$line" ]]; do
   a5=$(echo $line | cut -c1-5)        #Extract first 5 characters
   a6=$(echo $line | cut -c1-6)        #Extract first 6 characters
	   
   if [ "$a6" == "</dir>" ]; then
	cd ..
   elif [ "$a5" == "<dir>" ]; then
        d=0
   elif [ "$a6" == "<file>" ]; then
        d=1
   elif [ "$a6" == "<name>" ] && [ $d == 0 ]; then
	nm=$( echo $line | sed -e 's/^[<name>]*//' | sed -e 's/[</name>]*$//' )  #remove starting <name> and </name> from line
	nm="$(echo -e "${nm}" | sed -e 's/^[[:space:]]*//')"                     #remove leading whitespaces
	nm="$(echo -e "${nm}" | sed -e 's/[[:space:]]*$//')"	                 #remove trailing whitespaces
	mkdir $nm
	cd $nm
   elif [ "$a6" == "<name>" ] && [ $d == 1 ]; then	
	nm=$( echo $line | sed -e 's/^[<name>]*//' | sed -e 's/[</name>]*$//' ) 
	nm="$(echo -e "${nm}" | sed -e 's/^[[:space:]]*//')"
	nm="$(echo -e "${nm}" | sed -e 's/[[:space:]]*$//')"
   elif [ "$a6" == "<size>" ] && [ $d == 1 ]; then
	sz=$( echo $line | sed -e 's/^[<size>]*//' | sed -e 's/[</size>]*$//' ) 
	sz="$(echo -e "${sz}" | sed -e 's/^[[:space:]]*//')"
	sz="$(echo -e "${sz}" | sed -e 's/[[:space:]]*$//')"
	touch $nm
	fallocate -l $(($sz)) $nm
	d=0
   fi
done < "$1"


