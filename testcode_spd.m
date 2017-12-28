p = 10;
n = 300;
theta = 0.5*p^(-2/3);

a0 = randn(p,1);
a0 = a0/norm(a0);
x0 = randn(n,1).*(rand(n,1) < theta);
y = cconv(x0,a0,n);




a = randn(p,1);
a = a/norm(a);
lambda = 0.7/sqrt(p);

a = riem_grad(y,a,lambda);
a = [zeros(p-1,1); a; zeros(p-1,1)];
lambda = lambda/2;
a = riem_grad(y,a,lambda);
lambda = lambda/20;
a = riem_grad(y,a,lambda);



err = inf;
a0zp = [zeros(p-1,1); a0; zeros(p-1,1)];
for i  =  -p+1:1:p-1
    err_sip = norm(circshift(a,i)-a0zp);
    if  err_sip < err;
        best_shift = i;
        best_sign = 1;
        err = err_sip;
    end
    err_sin = norm(-circshift(a,i)-a0zp);
    if err_sin < err;
        best_shift = i;
        best_sign = -1;
        err = err_sin;
    end
end
figure; subplot(121); stem(circshift(best_sign*a, best_shift)); 
        subplot(122); stem(a0zp);

