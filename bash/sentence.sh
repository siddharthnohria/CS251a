#!/bin/bash
print_space()
{
	j=0
	for (( ; j<$counter; j++ )); do
		echo -ne "\t"
	done
}


lines()
{
	#echo "$1" 
	t1=$(tr '\n' '  ' < "$1" |sed 's/ /  /g' $1 | egrep -oE ' [-]?[0-9]+$| [-]?[0-9]+[.?!]$|' | wc -l)  #for ending 
	t2=$(tr '\r\n' '  ' <"$1"|sed 's/ /  /g' $1 | egrep -o '^[-]?[0-9]+$|^[-]?[0-9]+[?!.]$' | wc -l) #for starting and ending 
	t3=$(tr '\r\n' '  ' <"$1"|sed 's/ /  /g' $1 | egrep -o '^[-]?[0-9]+ ' | wc -l) #for starting 
	t4=$(tr '\r\n' '  ' <"$1"|sed 's/ /  /g' $1 | egrep -o ' [-]?[0-9]+ | [-]?[0-9]+[?!.] '| wc -l) #for middle
	l=$(( $t1 + $t2 + $t3 + $t4 ))
}

sentences()
 {
	s=$(grep -oE ".[?!][^a-z]|[?!.]$|[0-9]\.[^0-9a-z]|[^0-9]\.[^a-z]" $1 | wc -l)
 }


func()
{
  
  local count_l=0
  local count_s=0
  

  if [[ -d "$1" ]] ; then
  			
  	counter=$(( $counter +1))
  	
  	for i in $(ls "$1") ; do

   		f="$1/$i"
		func $f
		count_l=$(($count_l + l))
		count_s=$(($count_s + s))
	done
	
	counter=$(( $counter -1))
	print_space
  	l=$count_l
  	s=$count_s
  	echo -ne "(D) $(basename $1)-$s-$l"
  	echo " "


  elif [[ -f "$1" ]] ;
  	then
  		
  	print_space
  	lines $1
  	sentences $1
	echo -ne "(F) $(basename $1)-$s-$l"
	echo " "
	count_l=$(( $count_l + $l ))
	count_s=$(( $count_s + $s ))

	else [ ]

  	fi


}


#grep -oE ".[?!][^a-z]|[?!.]$|[0-9]\.[^0-9a-z]|[^0-9]\.[^a-z]" myfile.txt
counter=0
func $1
l=0
s=0

#echo $(ls $1)
#for i in $(ls $1) ; 
#do
#	echo "$i"
#done
