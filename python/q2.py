#!/usr/bin/python
import math
import numpy as np
from numpy.linalg import pinv
import matplotlib.pyplot as plt

X=np.genfromtxt('train.csv',delimiter=',')
X = np.delete(X, 0, axis=0)
Y_train = np.delete(X, 0, axis=1)
X = np.delete(X, 1, axis=1)
one=np.ones((X.shape[0],1))
X_train=np.concatenate((one, X), axis=1)
w=np.random.rand(2,1)

plt.plot(X, Y_train, 'ro')

X2=X_train.T
w2=w.T
k=w2.dot(X2)
plt.plot(X, k.T, 'b')
plt.show()

w_direct=pinv(X2.dot(X_train))    
w_direct=(w_direct.dot(X2)).dot(Y_train)
w2=w_direct.T

plt.plot(X, Y_train, 'ro')
plt.plot(X,(w2.dot(X2)).T, color='g')
plt.show()

#print w
eta=0.00000001
for i in range(0,2) :
    for j in range(0,X.shape[0]) :
        x=X[j]
        y=Y_train[j]
        x2=np.array([[1,x]])
        x2=x2.T

        val=float(eta*((w.T).dot(x2)-y))
        x2=val*x2
        w=w-x2

        if (j%100==0) :
            plt.plot(X,((w.T).dot(X2)).T, color='g')

#print w
plt.plot(X,((w.T).dot(X2)).T, color='r')

X_test=np.genfromtxt('test.csv',delimiter=',')
X_test=np.delete(X_test, 0, axis=0)
Y_test = np.delete(X_test, 0, axis=1)
X_test = np.delete(X_test, 1, axis=1)
one=np.ones((X_test.shape[0],1))
X_test=np.concatenate((one, X_test), axis=1)

Y_pred1=X_test.dot(w)
err1=0.0
for i in range(0,Y_test.shape[0]) :
    err1=err1+float((Y_test[i]-Y_pred1[i])*(Y_test[i]-Y_pred1[i]))

err1=math.sqrt(err1/Y_test.shape[0])
print "err1 = %f"%err1

Y_pred2=X_test.dot(w_direct)
err2=0.0
for i in range(0,Y_test.shape[0]) :
    err2=err2+float((Y_test[i]-Y_pred2[i])*(Y_test[i]-Y_pred2[i]))

err2=math.sqrt(err2/Y_test.shape[0])
print "err2 = %f"%err2

plt.show()
