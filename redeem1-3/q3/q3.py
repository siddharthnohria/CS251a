#!/usr/bin/python

def div(arr,n,factor,count):
    if (count>=n): return
    cnt=0
    i=int(n/factor)
    t=1
    prev=0
    while(i<n) :
	if (arr[i]>-100000000) :
	    cnt=cnt+1
	    for j in range(i-prev) :
		print " ",
	    print arr[i],
	    arr[i]=-100000000
	    prev=i+1
	i=int((t+1)*n/factor)
	t=t+1
    print
    div(arr,n,factor*2,count+cnt)
    return

n = int(input())
arr = raw_input()
arr = list(map(int,arr.split(' ')))

arr.sort()

div(arr,n,2,0)
