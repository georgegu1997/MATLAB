a = tf([1 1 0],[1])
b = tf([1/2],[1])
p = tf([1 2*sqrt(2)-1 4-2*sqrt(2)], [1])
q = tf([6*sqrt(2)-8 1/2],[1])
d = tf([1 sqrt(2) 1/2],[1])
J = norm((d-a)/d,2)^2 + norm(b/d,2)^2 + norm((d-p)/d,2)^2 + norm(q/d,2)^2