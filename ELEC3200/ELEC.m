% syms L Ra Rb V;
% A = [L Ra;
%     V-Rb V/L];
% simplify(inv(A))
% % det(A)
% syms s a1 a2 a3 a4 a5;
% 
% A = [s+a1 -1 0 0 0;
%     a2 s -1 0 0;
%     a3 0 s -1 0;
%     a4 0 0 s -1;
%     a5 0 0 0 s]
% inv(A)
% b = [1;2;3;4;5]
% c = [1 0 0 0 0]
% simplify(c*(inv(A)*b))
% 
% % A = [1 0 0 0 0;
%     -1 1 0 0 0;
%     0 -1 1 1 0;
%     0 0 -1 0 1]
% B = [1;6;11;6]
% X = B\A
% X = [1; 7; 18; 0; 24]
% A*X

% A = [1 0 0 0 0 0;
%     -6 1 0 0 0 0;
%     5 -6 1 1 0 0;
%     0 5 -6 -3 1 0;
%     0 0 5 0 -3 1;
%     0 0 0 0 0 -3]
% B = [1;5;10;10;5;1]
% X = B\A

% format rational
% A = [1 0 1 0;
%     -2 1 0 1;
%     2 -2 1 0;
%     0 2 0 1]
% B = [1;-1;2;-1]
% x = inv(A)*B

