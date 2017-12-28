function a = riem_grad(y,a_init,lambda)

p = length(a_init);
n = length(y);
a = a_init;

t = 10;
while true
    Ca = cconvmtx(a,n);   
    x = lasso_ista(y,Ca,lambda);
    Cx = cconvmtx(x,n);
    L = norm(x,1)^2;
    
    a_last = a;
    dfa = Cx'*(Cx*[a;zeros(n-p,1)] - y);
    a = a - (t/L)*dfa(1:p);
    a = a/norm(a);
    if norm(a-a_last) < 1e-3; break; end
end   


