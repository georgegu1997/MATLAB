%For ELEC 3200 Homework @ HKUST
%Written be GU Qiao

%input are the coefficient array of a and b
function [d_sym] = sfac(a_poly, b_poly)

syms s;
%a(s)
a_sym = poly2sym(a_poly,s);
%a(-s)
a1_poly = [a_poly];
for i = 1: length(a1_poly)
    if mod(length(a1_poly)-i,2)==0
        a1_poly(i) = a1_poly(i);
    else
        a1_poly(i) = -a1_poly(i);
    end
end
a1_sym = poly2sym(a1_poly,s);

%b(s)
b_sym = poly2sym(b_poly,s);
%b(-s)
b1_poly = b_poly;
for i = 1: length(b1_poly)
    if mod(length(b1_poly)-i,2)==0
        b1_poly(i) = b1_poly(i);
    else
        b1_poly(i) = -b1_poly(i);
    end
end
b1_sym = poly2sym(b1_poly,s);

% a(-s)*a(s)+b(-s)*b(s)
SOP = a_sym*a1_sym+b_sym*b1_sym;
rts = roots(sym2poly(SOP));
new_rts = [];

% find the negative roots
for i = 1: length(rts)
    if real(rts(i))<0
        new_rts = [new_rts rts(i)];
    end
end

% calculate d
d_poly = 1;
for i = 1: length(new_rts)
    d_poly = conv(d_poly, [1 -new_rts(i)]);
end

d_sym = poly2sym(d_poly,s);