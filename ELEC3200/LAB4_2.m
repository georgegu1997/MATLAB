%Solve the nonlinear equation
%x1 = x
%x2 = dx/dt
%x3 = q
%x4 = dq/dt
%y1 = x
%y2 = q
syms x1 x2 x3 x4;
syms Mp Mc Mb L f g cosq sinq;
syms X2 Q2;
syms A B C X Y Z;
A = (Mp+Mc+Mb);
B = ((Mp/2+Mb)*L*cos(x3));
C = ((Mp/2+Mb)*L*x4^2*sin(x3));
X = ((Mp/3+Mb)*L);
Y = ((Mp/2+Mb)*cos(x3));
Z = ((Mp/2+Mb)*g*sin(x3));

eqn1='(Mp+Mc+Mb)*X2-((Mp/2+Mb)*L*cos(x3))*Q2+((Mp/2+Mb)*L*x4^2*sin(x3))=f';
eqn2='((Mp/3+Mb)*L)*Q2-((Mp/2+Mb)*cos(x3))*X2-((Mp/2+Mb)*g*sin(x3))=0';

[X2,Q2] = solve(eqn1, eqn2, 'X2','Q2')

%X2 = (X*f - C*X + B*Z)/(A*X - B*Y)
%Q2 = (Y*f + A*Z - C*Y)/(A*X - B*Y)

% X2 = (- 12*L*sin(x3)*Mb^2*x4^2 + 12*g*cos(x3)*sin(x3)*Mb^2 - 10*L*sin(x3)*Mb*Mp*x4^2 + 12*g*cos(x3)*sin(x3)*Mb*Mp + 12*f*Mb - 2*L*sin(x3)*Mp^2*x4^2 + 3*g*cos(x3)*sin(x3)*Mp^2 + 4*f*Mp)...
%     /(12*Mb^2 - 3*Mp^2*cos(x3)^2 - 12*Mb^2*cos(x3)^2 + 4*Mp^2 + 12*Mb*Mc + 16*Mb*Mp + 4*Mc*Mp - 12*Mb*Mp*cos(x3)^2);
% Q2 = (3*(2*Mb + Mp)*(2*f*cos(x3) + 2*Mb*g*sin(x3) + 2*Mc*g*sin(x3) + 2*Mp*g*sin(x3) - 2*L*Mb*x4^2*cos(x3)*sin(x3) - L*Mp*x4^2*cos(x3)*sin(x3)))...
%     /(L*(12*Mb^2 - 3*Mp^2*cos(x3)^2 - 12*Mb^2*cos(x3)^2 + 4*Mp^2 + 12*Mb*Mc + 16*Mb*Mp + 4*Mc*Mp - 12*Mb*Mp*cos(x3)^2));
 