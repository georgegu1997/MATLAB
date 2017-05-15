%For ELEC 3200 Homework @ HKUST
%Written be GU Qiao

function [result] = norm2(den_poly, num_poly)
%check the size of the input arrays.
assert(length(den_poly)-1==length(num_poly), ...
    'The size of num_poly should be size of den_poly - 1!');

%get the size of the routh table
m = length(den_poly);
n = ceil(m/2);

%Get the usual routh table from Routh function
[~, first_part] = routh(den_poly);

%initialize the second and third part
second_part = zeros(m, n);
third_part = zeros(m,n);

%construct the second part iteratively
for r = 1:m
    if r == 1
        for c = 1:n
            if 2*c-1 <= length(num_poly);
                second_part(r,c) = num_poly(2*c-1);
            end
        end
    elseif mod(r,2) == 0
        second_part(r,:) = first_part(r,:);
    else 
        for c = 1:n-1
            if second_part(r-2,c+1)~=0
                second_part(r, c) = ...
                    -det([second_part(r-2,1) second_part(r-2,c+1); ...
                    second_part(r-1,1) second_part(r-1,c+1)])...
                    /second_part(r-1, 1);
            end
        end
    end
end

%construct the third part iteratively
for r = 1:m
    if r == 1
    elseif r == 2
        for c = 1:n
            if 2*c <= length(num_poly);
                third_part(r,c) = num_poly(2*c);
            end
        end
    elseif mod(r,2) == 1
        third_part(r,:) = first_part(r,:);
    else 
        for c = 1:n-1
            if third_part(r-2,c+1)~=0
                third_part(r, c) = ...
                    -det([third_part(r-2,1) third_part(r-2,c+1); ...
                    third_part(r-1,1) third_part(r-1,c+1)])...
                    /third_part(r-1, 1);
            end
        end
    end
end

%calculate alphas and betas
a=zeros(1,m-1);
b=zeros(1,m-1);
for i=1:m-1
    a(i) = first_part(i,1)/first_part(i+1,1);
    if mod(i,2)==1
        b(i)=second_part(i,1)/second_part(i+1,1);
    else
        b(i)=third_part(i,1)/third_part(i+1,1);
    end
end

%calculate 2-norm
result = 0;
for i = 1:m-1;
    result = result + b(i)^2/(2*a(i));
end
% result
result = result^(1/2);