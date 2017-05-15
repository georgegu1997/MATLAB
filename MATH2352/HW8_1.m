% format rational;
% A = [1 0 1 0;
%     1 1 0 1;
%     5/4 1 1 0;
%     0 5/4 0 1];
% B = [0;0;0;1];
% X = A\B

% t = 0:0.0001:10;
% y = 3*exp(-t)-2*exp(-2*t)+heaviside(t-pi).*(exp(-2*(t-pi))-exp(-(t-pi)));
% plot(t,y);

t = 0:0.0001:10;
y = cos(t) + sin(t) + heaviside(t-2*pi).*sin(t-2*pi);
plot(t,y);
