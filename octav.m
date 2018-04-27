a = csvread('train.csv');
X = a([2:end],[1:1]);
X_train = [ones(size(a,1)-1,1) X];
Y_train = a([2:end],[2:2]);

w = rand(2,1);

figure(1)
hold on;
scatter(X,Y_train,'r'); 

X2 = transpose(X_train);
w2 = transpose(w);
k  = w2*X2;
plot(X,transpose(k));
hold off;

w_direct = inv(X2*X_train);
w_direct = (w_direct*X2)*Y_train;
w2 = transpose(w_direct);

figure(2)
hold on;
scatter(X,Y_train,'r'); 
plot(X,transpose(w2*X2), 'g');
hold off;
eta=0.00000001;

figure(3)
hold on;
for i=0:1
  for j=1:size(X,1)
    x = X(j);
    y = Y_train(j);
    x2 = ones(2,1);
    x2(2) = x;
    
    val = eta*((transpose(w))*x2-y);
    x2 = val*x2;
    w = w - x2;
    
    if (rem(j,100)==1)
    	plot(X,transpose((transpose(w))*X2)); 
    end
  end
end
plot(X,Y_train,'r'); 
plot(X,transpose((transpose(w))*X2));
hold off;

a = csvread('test.csv');
X_test = a([2:end],[1:1]);
X_test = [ones(size(a,1)-1,1) X_test];
Y_test = a([2:end],[2:2]);

Y_pred1 = X_test*w;
err1 = 0;
for i=1:size(Y_test,1)
  err1 = err1 + (Y_test(i)-Y_pred1(i))*(Y_test(i)-Y_pred1(i));
end

err1 = sqrt(err1/size(Y_test,1))

Y_pred2 = X_test*w_direct;
err2 = 0;
for i=1:size(Y_test,1)
  err2 = err2 + (Y_test(i)-Y_pred2(i))*(Y_test(i)-Y_pred2(i));
end

err2 = sqrt(err2/size(Y_test,1))

