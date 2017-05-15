%For LLEC 3200 LAB3 prelab
y0 = 0.03;
L0 = 0.272;
%R = 13.2;
%The real value for R
R = 14.23;
%M = 0.1;
%the real value for M
M = 0.0911;
rL1 = 2.66e-3;
g = 9.8;
L = L0 + rL1/y0;
A = [-R/L 0 (2*rL1*M*g)^(1/2)/(y0*L);
    0 0 1;
    -(1/y0)*((2*rL1*g)/M)^(1/2) 2*g/y0 0];
b = [1/L;0;0];
c = [0 1 0];
d = 0;
F = ss(A,b,c,d);
F_tf = tf(F)
[num,den] = tfdata(F);
num = cell2mat(num);
den = cell2mat(den);
poles = [-120+120i -120-120i -45+45i -45-45i -40];
[C_num, C_den] = poleplace(num,den,poles,false)

u0 = R*y0*(2*M*g/rL1)^(1/2)
x10 = y0*(2*M*g/rL1)^(1/2)
x20 = y0
x30 = 0