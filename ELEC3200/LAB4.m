Mp = 0.07;
Mc = 1.42;
Mb = 0.05;
g = 9.8;
L = 0.335;
poles = [-10.27+11.15i -10.27-11.15i -3.09+0.93i -3.09-0.93i];

cpoly = [1];
for pole = poles
    cpoly = conv(cpoly, [1 -pole]);
end

% A = (Mp+Mc+Mb);
% B = Mp/2+Mb;
% C = Mp/3+Mb;
% 
% AA = [0 1 0 0;
%     0 0 B^2*g/(A*C-B^2) 0;
%     0 0 0 1;
%     0 0 A*B*g/((A*C-B^2)*C) 0];
% BB = [0; C/(A*C-B^2); 0; B/(A*C-B^2)];
% CC = [1 0 0 0;
%     0 0 1 0];
% DD = 0;
% system = ss(AA,BB,CC,DD);
% G = tf(system)
% [P_num, P_den] = tfdata(G);
% 
% ax = cell2mat(P_den(1));
% aq = [cell2mat(P_den(2)) 0 0];
% bx = cell2mat(P_num(1));
% bq = [cell2mat(P_num(2)) 0 0];
syms s;
TFX = (2*(6*Mb*g + 3*Mp*g - 6*L*Mb*s^2 - 2*L*Mp*s^2))/(s^2*(12*g*Mb^2 - 4*L*Mb*Mp*s^2 + 18*g*Mb*Mp - 12*L*Mc*Mb*s^2 + 12*Mc*g*Mb - L*Mp^2*s^2 + 6*g*Mp^2 - 4*L*Mc*Mp*s^2 + 6*Mc*g*Mp));
%TFx = vpa(X,4)
TFQ =-(6*(2*Mb + Mp))/(12*g*Mb^2 - 4*L*Mb*Mp*s^2 + 18*g*Mb*Mp - 12*L*Mc*Mb*s^2 + 12*Mc*g*Mb - L*Mp^2*s^2 + 6*g*Mp^2 - 4*L*Mc*Mp*s^2 + 6*Mc*g*Mp);
%TFQ = vpa(Q,4)

% a = poly2sym(ax,s);
% bx = poly2sym(bx,s);
% bq = poly2sym(bq,s);
% vpa(a,4)
% vpa(bx,4)
% vpa(bq,4)

syms KxP KxD KqP KqD;

a = (s^2*(12*g*Mb^2 - 4*L*Mb*Mp*s^2 + 18*g*Mb*Mp - 12*L*Mc*Mb*s^2 + 12*Mc*g*Mb - L*Mp^2*s^2 + 6*g*Mp^2 - 4*L*Mc*Mp*s^2 + 6*Mc*g*Mp));
bx = (2*(6*Mb*g + 3*Mp*g - 6*L*Mb*s^2 - 2*L*Mp*s^2));
bq = -(6*(2*Mb + Mp))*s^2;

cp = a+(KxP+KxD*s)*bx+(KqP+KqD*s)*bq;
cp = vpa(expand(cp),4)
cp_coeffs = fliplr(coeffs(cp, s));
cp_coeffs = cp_coeffs./cp_coeffs(1);
cp_coeffs = vpa(cp_coeffs, 4)
eqn = cpoly-cp_coeffs;

[KxP, KxD, KqP, KqD] = solve(eqn(2),eqn(3),eqn(4),eqn(5),'KxP','KxD','KqP','KqD')
