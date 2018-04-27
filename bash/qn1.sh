#!/bin/bash

echo N=?
read N

n=$N
let count=${#n}
let temp=$count
let arr=(0,0,0)
let qw=0
let f=0
let val=0
let sub=0
while [ $temp != 0 ]
do 
	qw=$(( $count - $temp ))
	val=${n:qw:1}
	if [ $f == 0 ] && [ $val == 0 ] 
	then
		sub=$(( $sub + 1 ))
		temp=$(( $temp - 1 ))
		continue
	fi
	arr[`expr $temp - 1`]=$val
	temp=$(( $temp -1 ))
	f=1
done
count=$(( $count - $sub ))
if [ $count == 0 ]
then
	echo zero
fi

let flag=0
for ((i=$count-1;i>=0;i-=1))
do
	if [ $i -ge 11 ]
	then
		echo invalid input
		break
	fi	
	if [ $flag == 0 ] && [ ${arr[i]} == 0 ]
	then
		continue
	else
		flag=1
	fi	
	
	if [ $i == 0 ]	|| [ $i == 2 ] || [ $i == 3 ] || [ $i == 5 ] || [ $i == 7 ] || [ $i == 9 ] || [ $i == 10 ]
	then
		if [ ${arr[i]} == 1 ]
		then
			echo -n "one "
		elif [ ${arr[i]} == 2 ]
		then
			echo -n "two "
		elif [ ${arr[i]} == 3 ]
		then
			echo -n "three "
		elif [ ${arr[i]} == 4 ]
		then
			echo -n "four "
		elif [ ${arr[i]} == 5 ]
		then
			echo -n "five "
		elif [ ${arr[i]} == 6 ]
		then
			echo -n "six "
		elif [ ${arr[i]} == 7 ]
		then
			echo -n "seven "
		elif [ ${arr[i]} == 8 ]
		then
			echo -n "eight "
		elif [ ${arr[i]} == 9 ]
		then
			echo -n "nine "
		fi
		if [ ${arr[i]} != 0 ]
		then	
			if [ $i == 2 ] || [ $i == 9 ]
			then
				echo -n "hundred "
			elif [ $i == 3 ] || [ $i == 10 ]
			then
				echo -n "thousand "
			elif [ $i == 5 ]
			then
				echo -n "lakhs "
			fi
		fi
		if [ $i == 7 ]
		then
			echo -n "crores "
		fi
		
	else
			
		if [ ${arr[i]} == 1 ]
		then
			i=$(( $i - 1 ))
			
			if [ ${arr[i]} == 1 ]
			then
				echo -n "eleven "
			elif [ ${arr[i]} == 2 ]
			then
				echo -n "twelve "
			elif [ ${arr[i]} == 3 ]
			then
				echo -n "thirteen "
			elif [ ${arr[i]} == 4 ]
			then
				echo -n "fourteen "
			elif [ ${arr[i]} == 5 ]
			then
				echo -n "fifteen "
			elif [ ${arr[i]} == 6 ]
			then
				echo -n "sixteen "
			elif [ ${arr[i]} == 7 ]
			then
				echo -n "seventeen "
			elif [ ${arr[i]} == 8 ]
			then
				echo -n "eighteen "
			elif [ ${arr[i]} == 9 ]
			then
				echo -n "nineteen "
			elif [ ${arr[i]} == 0 ]
			then
				echo -n "ten "
			fi
			
			if [ $i == 3 ] || [ $i == 10 ]
			then
				echo -n "thousand "
			elif [ $i == 5 ]
			then
				echo -n "lakhs "
			elif [ $i == 7 ]
			then
				echo -n "crores "
			fi
		
		elif [ ${arr[i]} == 2 ]
		then
			echo -n "twenty "
		elif [ ${arr[i]} == 3 ]
		then
			echo -n "thirty "
		elif [ ${arr[i]} == 4 ]
		then
			echo -n "forty "
		elif [ ${arr[i]} == 5 ]
		then
			echo -n "fifty "
		elif [ ${arr[i]} == 6 ]
		then
			echo -n "sixty "
		elif [ ${arr[i]} == 7 ]
		then
			echo -n "seventy "
		elif [ ${arr[i]} == 8 ]
		then
			echo -n "eighty "
		elif [ ${arr[i]} == 9 ]
		then
			echo -n  "ninety "
		fi
	fi		
	#echo ${arr[i]}
done
