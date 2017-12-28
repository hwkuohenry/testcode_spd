function Ca = cconvmtx(varargin)
if nargin == 1
    a = varargin{1};
    n = length(a);
elseif nargin == 2
    a = varargin{1};
    n = varargin{2};
end

k = length(a);
a = [a;zeros(n-k,1)];
Ca = zeros(n,n);
for I = 1:n
    Ca(:,I) = a;
    am = a(n);
    a(2:end) = a(1:n-1);
    a(1) = am;
end
    