%For ELEC 3200 Homework @ HKUST
%Written be GU Qiao

function [ result ] = robust_stable( lower_bound, upper_bound )
% check the correntness of input
if(length(lower_bound) ~= length(upper_bound))
    error('The length of two bound vecctors dont match');
end

% get the number of the coefficients
m = length(lower_bound);
result = 'stable';

%four condition for the routh table test
for i = 0:3
    cpoly = [];
    %construct the polynomial
    for j = 1:m
        if(mod(i,4)<=1)
            cpoly = [cpoly lower_bound(j)];
        else
            cpoly = [cpoly upper_bound(j)];
        end
        i = i+1;
    end
    %use the routh table to check the stability
    [r , ~] = routh(cpoly);
    if(strcmp(r,'unstable'))
        result = r;
    end
end
end

