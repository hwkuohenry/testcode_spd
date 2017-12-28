function x = lasso_ista(y,A,lambda)

[~,n] = size(A);
t = 1;
L = norm(A,2)^2;
AtA = A'*A;
Aty = A'*y; 

x = zeros(n,1);
while true
    df = AtA*x - Aty;
    x_last = x;
    x = x - t/L*df;
    x = sign(x).*max(abs(x) - (t/L)*lambda,0);
    if norm(x-x_last) < 1e-3/n;  break;  end
end

