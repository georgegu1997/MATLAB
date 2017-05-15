% Fourier Series, from:
% http://www3.nd.edu/~nancy/Math40750/Demos/Matlab/Fourier_Series/fourier_series2.html

syms x k L n
evalin(symengine,'assume(k,Type::Integer)');
a = @(f,x,k,L) int(f*cos(k*sym('pi')*x/L)/L,x,-L,L);
b = @(f,x,k,L) int(f*sin(k*sym('pi')*x/L)/L,x,-L,L);
fs = @(f,x,n,L) a(f,x,0,L)/2 + ...
    symsum(a(f,x,k,L)*cos(k*pi*x/L) + b(f,x,k,L)*sin(k*pi*x/L),k,1,n);
pfs = @(f,x,n,L) pretty(simplify(fs(f,x,n,L)));