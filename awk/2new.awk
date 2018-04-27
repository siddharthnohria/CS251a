#!/usr/bin/awk
BEGIN{
FS=" "  
packets[""]=0
data[""]=0
bytes[""]=0
re[""]=0
arr1[""]=0
arr2[""]=0
arr3[""]=0
lm=0
}
{
lm++
ip1=$3
ip2=substr($5,1,length($5)-1)
time=$1
hour=substr(time,1,2)
min=substr(time,4,2)
sec=substr(time,7,length(time)-6)
total=hour*3600+60*min+sec 
if(!(ip1"'"ip2 in re)){
re[ip1"'"ip2]=total
arr1[ip1"'"ip2]=total
re[ip2"'"ip1]=total
arr1[ip2"'"ip1]=total
}
else{
arr1[ip2"'"ip1]=total
arr1[ip1"'"ip2]=total
}
str1=$8
if( str1 == "ack" ){
ip1=$3
ip2=substr($5,1,length($5)-1)
if(!(ip1"'"ip2 in packets))
packets[ip1"'"ip2]=1
else
packets[ip1"'"ip2]=packets[ip1"'"ip2]+1
}
else{
ip1=$3
ip2=substr($5,1,length($5)-1)
bits=$9
lk=index(bits,":")
hj=0
	if(!(ip1"'"ip2 in arr2)){
	arr2[ip1"'"ip2]=1
	arr3[ip1"'"ip2]=0
	}
if( lk!=0){
	bit1=substr(bits,1,lk-1)
	bit2=substr(bits,lk+1,length(bits)-(lk)-1)
	hj=bit2-bit1
		if(arr2[ip1"'"ip2]==1){
		arr3[ip1"'"ip2"'"1]=bit1"'"bit2
}
		else{
		flag=0
		for(k=1;k<arr2[ip1"'"ip2];k++){
		l1=index(arr3[ip1"'"ip2"'"k],"'")
		b1=substr(arr3[ip1"'"ip2"'"k],1,l1-1)
		b2=substr(arr3[ip1"'"ip2"'"k],l1+1,length(arr3[ip1"'"ip2"'"k])-(l1))
		if(b1<=bit1&&b2>=bit2){
		arr3[ip1"'"ip2]+=bit2-bit1
if(bit1==bit2)
arr3[ip1"'"ip2]+=1
		flag=1
		break
		}
else if(b1<=bit1 && bit2>b2 && bit1<=b2){
arr3[ip1"'"ip2]+=b2-bit1
if(b1==b2)
arr3[ip1"'"ip2]+=1
bit1=b2+1
}
else if(b2>=bit2 && b1>bit1 && bit2>=b1){
arr3[ip1"'"ip2]+=bit2-b1
if(b1==b2)
arr3[ip1"'"ip2]+=1
bit2=b1-1
}
		}
if(flag!=1){
arr3[ip1"'"ip2"'"arr2[ip1"'"ip2]]=bit1"'"bit2
}
else
arr2[ip1"'"ip2]--
	}
arr2[ip1"'"ip2]++
}
if(!(ip1"'"ip2 in packets)){
packets[ip1"'"ip2]=1
data[ip1"'"ip2]=hj

if(hj==0)
bytes[ip1"'"ip2]=0
else
bytes[ip1"'"ip2]=1
}
else{
packets[ip1"'"ip2]=pacets[ip1"'"ip2]+1
dataa[ip1"'"ip2]+=hj
arr1[ip1"'"ip2]=total
if(hj!=0)
bytes[ip1"'"ip2]++
}
}
}
END{
for(i in packets )
if(i!="" && packets[i]!=""){
qwe=index(i,"'")
IP1=substr(i,1,qwe-1)
IP2=substr(i,qwe+1,length(i)-qwe)
print "Connection (A="IP1,"B="IP2")"
if(arr3[IP2"'"IP1]<0)
arr3[IP2"'"IP1]=0
if(arr3[IP1"'"IP2]<0)
arr3[IP1"'"IP2]=0
print "A-->B","#packets="packets[IP1"'"IP2]",","#datapackets="bytes[IP1"'"IP2]",","#bytes="data[IP1"'"IP2]",","#retrans="arr3[IP1"'"IP2]",","xput="int((data[IP1"'"IP2]-arr3[IP1"'"IP2])/(arr1[IP1"'"IP2]-re[IP1"'"IP2])),"bytes/sec"
print "B-->A","#packets="packets[IP2"'"IP1]",","#datapackets="bytes[IP2"'"IP1]",","#bytes="data[IP2"'"IP1]",","#retrans="arr3[IP2"'"IP1]",","xput="int((data[IP2"'"IP1]-arr3[IP2"'"IP1])/(arr1[IP2"'"IP1]-re[IP2"'"IP1])),"bytes/sec"
delete packets[IP1"'"IP2]
delete packets[IP2"'"IP1]
}
}
