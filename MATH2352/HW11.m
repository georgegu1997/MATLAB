% 10.2-25
% syms n x;
% y=(1/8)*x^2*cos(pi*n*x/2);
% pretty(int(y,x,-2,2))

syms x k L n
evalin(symengine,'assume(k,Type::Integer)');
a = @(f,x,k,L) int(f*cos(k*sym('pi')*x/L)/L,x,-L,L);
b = @(f,x,k,L) int(f*sin(k*sym('pi')*x/L)/L,x,-L,L);
fs = @(f,x,n,L) a(f,x,0,L)/2 + ...
    symsum(a(f,x,k,L)*cos(k*pi*x/L) + b(f,x,k,L)*sin(k*pi*x/L),k,1,n);
pfs = @(f,x,n,L) pretty(simplify(fs(f,x,n,L)));

% (a)

f = @(x) heaviside(x+1)-heaviside(x-1);
ezplot(f(x),-2,2)
hold on;
ezplot(fs(f,x,1,2),-2,2)
ezplot(fs(f,x,4,2),-2,2)
ezplot(fs(f,x,12,2),-2,2)
ezplot(fs(f,x,36,2),-2,2)
legend('f(x)','n=1','n=4','n=12','n=36');
hold off;
title('Fourier parial sum for f(x) on (-2,2)')
axis('tight')

% (b)

% for i = 1:20
%     i
%     error_max = vpa(subs(fs(f,x,i,2)-f(2),x,2))
% end