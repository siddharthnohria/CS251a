#!/usr/bin/gawk

BEGIN{
    com=0
    lines=0
    flag1=0
    flag2=0
}
{
n=length($0)
if(flag1==1)
    com++
for(i=1;i<=n;i++)
{
    if(flag1==0 && flag2==0)
    {	    
	c=substr($0,i,1)
        if(c=="/")
    	{
	    i++
	    if(i>n)
	    	break
	    c=substr($0,i,1)
	    if(c=="/")
	    {
	    	com++
	    	break
	    }
	    if(c=="*")
	    {
	    	flag1=1
	    	com++
	    	i++
	    	if(i>n)
		    break
	    	c=substr($0,i,1)
	    	while(i<n && c!="*")
	    	{
		    i++
		    c=substr($0,i,1)
	    	}
		
		if(c=="*" && substr($0,i+1,1)=="/")
		{
		    flag1=0
		}
		    
	    }
    	}
	else if(c=="\"")
	{
	    if(flag2==0)
	    {
		lines++
		flag2=1
	    }
	    else
	    {
		flag2=0
	    }		
	}		
    }
    else if(flag1==1)
    {	
	c=substr($0,i,1)
	while(i<n && c!="*")
	{
	    i++
	    c=substr($0,i,1)
	}
	if(c=="*" && substr($0,i+1,1)=="/")
	{
	    flag1=0
	}
    }
    else if(flag2==1)
    {
	c=substr($0,i,1)
	if(c=="\"")
	    flag2=0
    }	
							
}
}
END{
    printf "%s : %s",com,lines
}		
