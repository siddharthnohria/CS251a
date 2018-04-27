#!/bin/bash
#  read b
#  echo $a $b

#  read a b < infile
#  echo "a=$a b=$b"
#  echo "a=$a b=$b" > outfile
#  echo "a=$a b=$b" >> outfile

 a=ls
 echo $a
 a="ls"
 echo $a
 a='ls'
 echo $a
 a=$(ls)
 echo $a
 a=`ls`
 echo $a
#
# ls ~/workspace/linux-4.12.3/Documentation/*.txt | grep hw  

