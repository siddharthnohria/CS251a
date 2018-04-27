with open('average.txt') as fp:
	lines = fp.readlines()
lines = [x.strip() for x in lines]
a = [x.split(" ") for x in lines]
arr = [map(float,x) for x in a]


with open('variance.txt') as fp:
	lines = fp.readlines()
lines = [x.strip() for x in lines]
a2 = [x.split(" ") for x in lines]
v = [map(float,x) for x in a2]

print "#Threads 1 2 4 8 16"

print "1000", arr[0][2]/arr[0][2], arr[0][2]/arr[4][2], arr[0][2]/arr[8][2], arr[0][2]/arr[12][2], arr[0][2]/arr[16][2],   
print v[0][2]*arr[0][2]*arr[0][2], v[4][2]*arr[0][2]*arr[0][2], v[8][2]*arr[0][2]*arr[0][2], v[12][2]*arr[0][2]*arr[0][2], v[16][2]*arr[0][2]*arr[0][2]   

print "10000", arr[1][2]/arr[1][2], arr[1][2]/arr[5][2], arr[1][2]/arr[9][2], arr[1][2]/arr[13][2], arr[1][2]/arr[17][2],  
print v[1][2]*arr[1][2]*arr[1][2], v[5][2]*arr[1][2]*arr[1][2], v[9][2]*arr[1][2]*arr[1][2], v[13][2]*arr[1][2]*arr[1][2], v[17][2]*arr[1][2]*arr[1][2]   
 
print "100000", arr[2][2]/arr[2][2], arr[2][2]/arr[6][2], arr[2][2]/arr[10][2], arr[2][2]/arr[14][2], arr[2][2]/arr[18][2],   
print v[2][2]*arr[2][2]*arr[2][2], v[6][2]*arr[2][2]*arr[2][2], v[10][2]*arr[2][2]*arr[2][2], v[14][2]*arr[2][2]*arr[2][2], v[18][2]*arr[2][2]*arr[2][2]   

print "1000000", arr[3][2]/arr[3][2], arr[3][2]/arr[7][2], arr[3][2]/arr[11][2], arr[3][2]/arr[15][2], arr[3][2]/arr[19][2],   
print v[3][2]*arr[3][2]*arr[3][2], v[7][2]*arr[3][2]*arr[3][2], v[11][2]*arr[3][2]*arr[3][2], v[15][2]*arr[3][2]*arr[3][2], v[19][2]*arr[3][2]*arr[3][2]   

