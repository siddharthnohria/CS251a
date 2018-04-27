#!/usr/bin/gawk

BEGIN{
arr[""]=0
pid[""]=0
thread[""]=0
time[""]=0
memory[""]=0
check[""]=0
cnt=0
}
{
    cnt++
    if(cnt==1)
    {
        ind=1
	while(ind<=8)
	{
	    if($ind=="USER") arr[0]=ind	
	    else if($ind=="PID") arr[1]=ind
	    else if($ind=="LWP") arr[2]=ind
	    else if($ind=="TIME") arr[3]=ind
	    else if($ind=="SZ") arr[4]=ind		
	    ind++	
	}		  	
    }
    else
    {
	if($arr[0] in pid)
	{
	    if(!($arr[0]"'"$arr[1] in check))
	    {   
	        check[$arr[0]"'"$arr[1]]=1
		pid[$arr[0]]++
		memory[$arr[0]]+=$arr[4]
	    }
	    thread[$arr[0]]++
	    hrs=substr($arr[3],1,2)
    	    mins=substr($arr[3],4,2)
    	    secs=substr($arr[3],7,2)
	    time[$arr[0]]+=3600*hrs+60*mins+secs		
	}
	else
	{
	    check[$arr[0]"'"$arr[1]]=1
	    pid[$arr[0]]=1
	    memory[$arr[0]]=$arr[4]
	    thread[$arr[0]]=1
	    hrs=substr($arr[3],1,2)
    	    mins=substr($arr[3],4,2)
    	    secs=substr($arr[3],7,2)
	    time[$arr[0]]=3600*hrs+60*mins+secs
	}	
    }  
}
END{
    count=0
    for(i in pid)
    {	if(i=="")
            continue
        count++
    }
    printf "#users = %s\n",count
    for(i in pid)
    {	if(i=="")
            continue
	
	hrs=int(time[i]/3600)
	time[i]-=3600*hrs
	mins=int(time[i]/60)
	time[i]-=mins*60
	secs=time[i]	
	if(secs<10)
	    secs="0"secs
	if(mins<10)
	    mins="0"mins
	if(hrs<10)
	    hrs="0"hrs
	printf "%s --> #processes=%s, #threads=%s, cpu=%s:%s:%s, memory=%s\n",i,pid[i],thread[i],hrs,mins,secs,memory[i] 
    }
}

