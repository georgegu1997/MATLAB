%For ELEC 3200 Homework @ HKUST
%Written be GU Qiao

function [result, table] = routh( cpoly )
%determine the size of the routh table
m = length(cpoly);
n = ceil(m/2);

%initialize the matrix
table = zeros(m, n);
result = 'stable';

%fill the matrix with the coefficients provided
for k = 1:m
    j = ceil(k/2);
    if mod(k,2) == 0
        i = 2;
    else
        i = 1;
    end
    table(i,j) = cpoly(k);
end

%reproduce the table
for i = 3:m
    for j = 1:n-1
        if(table(i-1,j+1)~=0 || table(i-2,j+1)~=0)
            %table(i,j) = -(table(i-2,1)*table(i-1,j+1)-table(i-2,j+1)*table(i-1,1))/table(i-1,1);
            cal_result = -det([table(i-2,1) table(i-1,1);table(i-2,j+1) table(i-1,j+1)])/table(i-1,1);
            % rounding down due to the precision limit
            if (cal_result < 1e-8)
               cal_result = 0;
            end
            table(i,j) =  cal_result;
             % if 0 occurs in the table, stop immediately and return 'unstable'
            if(table(i,j) == 0)
                result = 'unstable';
                return
            end
        else
            table(i,j) = 0;
        end
    end
end

% check for the stability
for i = 1:m
    if(table(i,1) <= 0)
        result = 'unstable';
    end
end
end

