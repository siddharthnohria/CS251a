#!/bin/bash

IFS=$'\n'
func()
{
  
  
  if [[ -d "$1" ]] ; then
  			
  	
  	for i in $(ls "$1") ; do

   		f="$1/$i"
		func $f
	done
	
	
  elif [[ -f "$1" ]] ; 	then
  		
  	str=$(awk -f 1.awk $f)
  	temp=$(echo $str | cut -d ":" -f 1)
	temp2=$(echo $str | cut -d ":" -f 2)
	comments=$(( $temp + $comments))
	strings=$(($temp2+ $strings))
	
  fi

}


strings=0
comments=0
f=$1
func $1
  	
echo "Comments = $comments"
echo "Strings = $strings"
