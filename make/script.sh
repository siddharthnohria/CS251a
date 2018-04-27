#!/bin/bash

prm=$(<params.txt)
thr=$(<threads.txt)

for numt in $thr;
do

    for nump in $prm;
    do 
        for i in `seq 1 100`;
        do
	    echo -n $nump $numt "" >> runtest 
            ./App $nump $numt >> runtest
        done
    done
done
