%Solve the equation after linearization

%syms Mp Mc Mb L g;
syms X Q F;
syms s;
Mp = 0.07;
Mc = 1.42;
Mb = 0.05;
g = 9.8;
L = 0.335;
eqn1 = '(Mp+Mc+Mb)*s^2*X-(Mp/2+Mb)*L*s^2*Q=F';
eqn2 = '(Mp/3+Mb)*L*s^2*Q-(Mp/2+Mb)*s^2*X-(Mp/2+Mb)*g*Q-0';
[X, Q] = solve(eqn1,eqn2,'X','Q');

% X2 =(12*g*x3*Mb^2 + 12*g*x3*Mb*Mp + 12*f*Mb + 3*g*x3*Mp^2 + 4*f*Mp)...
%     /(Mp^2 + 12*Mb*Mc + 4*Mb*Mp + 4*Mc*Mp);
% Q2 =(6*(2*Mb + Mp)*(f + Mb*g*x3 + Mc*g*x3 + Mp*g*x3))...
%     /(L*(Mp^2 + 12*Mb*Mc + 4*Mb*Mp + 4*Mc*Mp));

X = (2*F*(6*Mb*g + 3*Mp*g - 6*L*Mb*s^2 - 2*L*Mp*s^2))/(s^2*(12*g*Mb^2 - 4*L*Mb*Mp*s^2 + 18*g*Mb*Mp - 12*L*Mc*Mb*s^2 + 12*Mc*g*Mb - L*Mp^2*s^2 + 6*g*Mp^2 - 4*L*Mc*Mp*s^2 + 6*Mc*g*Mp));
X = vpa(X,4)
Q =-(6*F*(2*Mb + Mp))/(12*g*Mb^2 - 4*L*Mb*Mp*s^2 + 18*g*Mb*Mp - 12*L*Mc*Mb*s^2 + 12*Mc*g*Mb - L*Mp^2*s^2 + 6*g*Mp^2 - 4*L*Mc*Mp*s^2 + 6*Mc*g*Mp);
Q = vpa(Q,4)
 