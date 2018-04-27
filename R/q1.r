#Step1
num_samples <- 50000
data <- rexp(num_samples, 0.2)
x <- data.frame(X = seq(1, num_samples , 1), Y = sort(data))
plot(x, main="Scatter plot")

#tab <- table(round(data))
#plot(tab, "h", xlab="Value", ylab="Frequency")


#Step2    (A vector in each column)
y <- split(data, as.integer((seq_along(data)-1)/100))

y[[1]]
y[[2]]
y[[3]]
y[[4]]
y[[5]]

v1 <- rep(0, 100);
v2 <- rep(0, 100);
v3 <- rep(0, 100);
v4 <- rep(0, 100);
v5 <- rep(0, 100);


for(i in 1:100){
    val1=round(y[[1]][i], 0);
    val2=round(y[[2]][i], 0);
    val3=round(y[[3]][i], 0);
    val4=round(y[[4]][i], 0);
    val5=round(y[[5]][i], 0);	
    if(val1 <= 100){
       v1[val1+1] = v1[val1+1] + 1/ 100; 
    }
    if(val2 <= 100){
       v2[val2+1] = v2[val2+1] + 1/ 100; 
    }
    if(val3 <= 100){
       v3[val3+1] = v3[val3+1] + 1/ 100; 
    }
    if(val4 <= 100){
       v4[val4+1] = v4[val4+1] + 1/ 100; 
    }
    if(val5 <= 100){
       v5[val5+1] = v5[val5+1] + 1/ 100; 
    }
}

xcols <- c(0:99)

cdata1 <- rep(0, 100)
cdata2 <- rep(0, 100)
cdata3 <- rep(0, 100)
cdata4 <- rep(0, 100)
cdata5 <- rep(0, 100)

cdata1[1] <- v1[1]
cdata2[1] <- v2[1]
cdata3[1] <- v3[1]
cdata4[1] <- v4[1]
cdata5[1] <- v5[1]

for(i in 2:100){
    cdata1[i] = cdata1[i-1] + v1[i]
    cdata2[i] = cdata2[i-1] + v2[i]
    cdata3[i] = cdata3[i-1] + v3[i]
    cdata4[i] = cdata4[i-1] + v4[i]
    cdata5[i] = cdata5[i-1] + v5[i]
}

plot(xcols, v1, "l", xlab="X", ylab="f(X)", main="PDF of first vector")
plot(xcols, cdata1, "l", col="blue", xlab="X", ylab="F(X)", main="CDF of first vector");

plot(xcols, v2, "l", xlab="X", ylab="f(X)", main="PDF of second vector")
plot(xcols, cdata2, "l", col="blue", xlab="X", ylab="F(X)", main="CDF of second vector");

plot(xcols, v3, "l", xlab="X", ylab="f(X)", main="PDF of third vector")
plot(xcols, cdata3, "l", col="blue", xlab="X", ylab="F(X)", main="CDF of third vector");

plot(xcols, v4, "l", xlab="X", ylab="f(X)", main="PDF of forth vector")
plot(xcols, cdata4, "l", col="blue", xlab="X", ylab="F(X)", main="CDF of forth vector");

plot(xcols, v5, "l", xlab="X", ylab="f(X)", main="PDF of fifth vector")
plot(xcols, cdata5, "l", col="blue", xlab="X", ylab="F(X)", main="CDF of fifth vector");


# Mean and Std. Deviation vectors
Avg <- seq(1,500)
Dev <- seq(1,500)
i <- 1
while(i<=500) {
  Avg[i]=mean(y[[i]])
  Dev[i]=sd(y[[i]])
  i <- i+1
}

sprintf("Means")
print (Avg[1])
print (Avg[2])
print (Avg[3])
print (Avg[4])
print (Avg[5])
sprintf("Standard Deviations")
print (Dev[1])
print (Dev[2])
print (Dev[3])
print (Dev[4])
print (Dev[5])

#Step4

tab <- table(round(Avg/0.1)*0.1)
plot(tab, "h", xlab="Value", ylab="Frequency", main="Frequency of means")

vm <- rep(0, 100);

for(i in 1:500){
    valm=round(Avg[i]);
    if(valm <= 100){
       vm[valm] = vm[valm] + 1/ 500; 
    }
}

xcols <- c(0:99)
cdatam <- rep(0, 100)
cdatam[1] <- vm[1]

for(i in 2:100){
    cdatam[i] = cdatam[i-1] + vm[i]
}

plot(xcols, vm, "l", xlab="X", ylab="f(X)", main="PDF of Means")
plot(xcols, cdatam, "l", col="blue", xlab="X", ylab="F(X)", main="CDF of Means");


#Step5
sprintf("Mean of Distribution of Means")
print (mean(Avg))
sprintf("Std. Deviation of Distribution of Means")
print (sd(Avg))
sprintf("Expected Mean of Distribution of Means")
print (5)
sprintf("Expected Std. Deviation of Distribution of Means")
print (0.5)


