function [ KxP, KxD, KqP, KqD ] = LAB4_poleplace( poles )
Mp = 0.07;
Mc = 1.42;
Mb = 0.05;
g = 9.8;
L = 0.335;

cpoly = [1];
for pole = poles
    cpoly = conv(cpoly, [1 -pole]);
end

syms s;
% TFX = (2*(6*Mb*g + 3*Mp*g - 6*L*Mb*s^2 - 2*L*Mp*s^2))/(s^2*(12*g*Mb^2 - 4*L*Mb*Mp*s^2 + 18*g*Mb*Mp - 12*L*Mc*Mb*s^2 + 12*Mc*g*Mb - L*Mp^2*s^2 + 6*g*Mp^2 - 4*L*Mc*Mp*s^2 + 6*Mc*g*Mp));
% TFQ =-(6*(2*Mb + Mp))/(12*g*Mb^2 - 4*L*Mb*Mp*s^2 + 18*g*Mb*Mp - 12*L*Mc*Mb*s^2 + 12*Mc*g*Mb - L*Mp^2*s^2 + 6*g*Mp^2 - 4*L*Mc*Mp*s^2 + 6*Mc*g*Mp);
syms KxP KxD KqP KqD;

a = (s^2*(12*g*Mb^2 - 4*L*Mb*Mp*s^2 + 18*g*Mb*Mp - 12*L*Mc*Mb*s^2 + 12*Mc*g*Mb - L*Mp^2*s^2 + 6*g*Mp^2 - 4*L*Mc*Mp*s^2 + 6*Mc*g*Mp));
bx = (2*(6*Mb*g + 3*Mp*g - 6*L*Mb*s^2 - 2*L*Mp*s^2));
bq = -(6*(2*Mb + Mp))*s^2;

cp = a+(KxP+KxD*s)*bx+(KqP+KqD*s)*bq;
cp = vpa(expand(cp),4);
cp_coeffs = fliplr(coeffs(cp, s));
cp_coeffs = cp_coeffs./cp_coeffs(1);
cp_coeffs = vpa(cp_coeffs, 4);
eqn = cpoly-cp_coeffs;

[KxP, KxD, KqP, KqD] = solve(eqn(2),eqn(3),eqn(4),eqn(5),'KxP','KxD','KqP','KqD');

end

