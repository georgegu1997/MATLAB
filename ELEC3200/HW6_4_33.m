A=[...
    -1.7860 15.9674 -1.6930 13.1487;
    -1.1773 -15.2644 -1.3548 -14.5145;
    3.3427 -6.8798 3.4513 -3.5889;
    1.5017 16.7058 1.1717 13.4250];
B=[-0.9618;
    1.3011;
    0.1081;
    -1.1984];
C=[29.8608 35.9450 29.4689 17.7162];
D=0;
plant=ss(A,B,C,D);

C_num=[0.8745 4.0787 2.4574 0.6105];
C_den=[1 3.7897 5.9143 0];
controller=tf(C_num,C_den);

G = minreal(plant*controller/(1+plant*controller));
% tf(G)
% pole(G)
% figure(1)
% impulse(G,30)
% figure(2)
% step(G,30)
% figure(3)
% t=0:0.001:30;
% u=cos(t);
% lsim(G,u,t)
% stepinfo(y)

step=tf([1],[1 0])
error=minreal(step*G-step)
[num den] = tfdata(error)
num = cell2mat(num)
den = cell2mat(den)
norm2(den,num(2:8))
