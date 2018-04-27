#!/bin/bash

#set -x

regex='^([0-9]){1,4}[0-9]{2}[0-9]{2}[0-9]{3}$|^[0-9]{1,2}[0-9]{2}[0-9]{3}$|^[0-9]{1,2}[0-9]{3}$|^[0-9]{1,3}$'
#echo $regex
if [[ $1 =~ ${regex} ]];
then
		number=$1
		var=${number:0:1}
		echo $var
		
		if [ $var = 1 ]; then
			echo Yes
		fi
		number=$(( $1 - 0 ))
		echo "$number"
		
		counter=`echo $number| wc -m`
		store=$number
		flag=0
		counter=$(( $counter - 1))

		#set -x
		while [ $counter -gt 0 ]
		do

		length=$counter
		counter=$(( $counter -1))
		power=$((10 ** $counter))
		remainder=$(( $number / $power))
		#echo "$remainder"

		temp=$(( $power * $remainder))
		number=$(( $number - $temp))



		if [ $flag == 0 ];
		then

			case $length in
			[2579])
				#set -x
				case $remainder in
				2)      echo -n "twenty ";;
				3)      echo -n "thirty ";;
				4)      echo -n "forty ";;
				5)      echo -n "fifty ";;
				6)      echo -n "sixty ";;
				7)      echo -n "seventy ";;
				8)      echo -n "eighty ";;
				9)      echo -n "ninety ";;
				1)
					echo "number = $number"
					case $number in
					0*)    echo -n "ten ";;
					1*)    echo -n "eleven ";;
					2*)    echo -n "twelve ";;
					3*)    echo -n "thirteen ";;
					4*)    echo -n "fourteen ";;
					5*)    echo -n "fifteen ";;
					6*)    echo -n "sixteen ";;
					7*)    echo -n "seventeen ";;
					8*)    echo -n "eighteen ";;
					9*)    echo -n "nineteen ";;
					esac

					if [ $length == "5" ];
					then
						echo -n "thousand "
						flag=1
					
			
					elif [ $length == "7" ];
					then
						echo -n "lakh "
						flag=1	
			
					elif [ $length == "9" ];
					then
						echo -n "crore "
						flag=1
					else
						flag=1

					fi
					continue
					;;

				*)      ;;

				esac;;


			*)
				case $remainder in
				1)      echo -n "one ";;
				2)      echo -n "two ";;
				3)      echo -n "three ";;
				4)      echo -n "four ";;
				5)      echo -n "five ";;
				6)      echo -n "six ";;
				7)      echo -n "seven ";;
				8)      echo -n "eight ";;
				9)      echo -n "nine ";;
				*)      ;;

				esac

				if [ $length == "3" ];
				then
					echo -n "hundred "

				elif [ $length == "4" ];
				then
					echo -n "thousand "

				elif [ $length == "6" ];
				then
					echo -n "lakh "

				elif [ $length == "8" ];
				then
					echo -n "crore "

				elif [ $length == "10" ];
				then 
					echo -n "hundred "

				elif [ $length == "11" ];
				then
					echo -n "thousand "

				else [ ];
				fi
				
				;;

				

			esac


		fi

		if [ $length == 1 ];
			then echo ""
		fi
		flag=0
		done

else
	echo "Invalid Input"
fi
