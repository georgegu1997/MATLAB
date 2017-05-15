%calculate the linearized system using numbers
syms X Q s F;
eqn1 = '1.54*s^2*X-0.028475*s^2*Q=F';
eqn2 = '737/30000*s^2*Q-0.085*s^2*X-0.833*Q';

[X Q] = solve(eqn1,eqn2,'X','Q')
