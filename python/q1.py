#!/usr/bin/python
import sys
def power(a,b) :
    if (b==0) :
        return 1
    else :
        temp=power(a,b/2)
        temp=temp*temp
        if (b%2==1) :
            temp=temp*a
        return temp

s=sys.argv[1]
s2=sys.argv[2]

dict = {}
dict['0']=0
dict['1']=1
dict['2']=2
dict['3']=3
dict['4']=4
dict['5']=5
dict['6']=6
dict['7']=7
dict['8']=8
dict['9']=9
dict['A']=10
dict['B']=11
dict['C']=12
dict['D']=13
dict['E']=14
dict['F']=15
dict['G']=16
dict['H']=17
dict['I']=18
dict['J']=19
dict['K']=20
dict['L']=21
dict['M']=22
dict['N']=23
dict['O']=24
dict['P']=25
dict['Q']=26
dict['R']=27
dict['S']=28
dict['T']=29
dict['U']=30
dict['V']=31
dict['W']=32
dict['X']=33
dict['Y']=34
dict['Z']=35
dict['.']=100
dict['-']=101

b=0
exit=0
for i in range(0,len(s2)) :
    if (s2[i]>='0' and s2[i]<='9') :
        b=b*10
        b=b+dict[s2[i]]
    else :
        exit=1
        break

if (b<2 or b>36) :
    exit=1

cntd=0
for i in range(0,len(s)) :
    if ((s[i]>='0' and s[i]<='9') or (s[i]>='A' and s[i]<='Z') or (i==0 and s[i]=='-')) or (s[i]=='.' and cntd==0) :
        if (s[i]=='.') :
            cntd=cntd+1
        elif (s[i]!='-' and dict[s[i]]>b-1) :
            exit=1
            break
    else :
        exit=1
        break

if (exit==1) :
    print "Invalid Input"

else :
    ans=0
    dec=0
    while (dec<len(s) and s[dec]!='.') :
        dec=dec+1
    for i in range(dec+1,len(s)) :
        ans=ans+(1.0)*dict[s[i]]/power(b,i-dec)
    j=dec-1
    while (j>=0) :
        if (s[j]=='-') :
            ans=-1*ans
        else:
            ans=ans+dict[s[j]]*power(b,(dec-1)-j)
        j=j-1
    #print "%.16f"%ans
    print ans
