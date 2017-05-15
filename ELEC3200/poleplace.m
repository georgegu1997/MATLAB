%For ELEC 3200 Homework @ HKUST
%Written be GU Qiao

function [C_num, C_den ] = poleplace(P_num, P_den, poles, sproper)

%get the charactistic function from the desired poles
cpoly = 1;
for pole = poles
    cpoly = conv(cpoly, [1 -1*pole]);
end
cpoly = cpoly';

%get the order of the plant
n = length(P_den) - 1;
S= [];
%decide the order of the controller
if(sproper == false)
    m = n - 1;
    %construct the Sylvester's resultant matrix
    for j = 1:2*m+2
        for i = 1:m+n+1
            %the left half matrix
            if(j <= m+1)
                if(i-j>=0 && i-j <= n)
                    S(i,j) = P_den(i - j + 1);
                else
                    S(i,j) = 0;
                end
            %the right half matrix
            else
                if(i-j+m+1 >= 1 && i-j+m+1 <= n)
                    S(i,j) = P_num(i - j+m+1 + 1);
                else
                    S(i,j) = 0;
                end
            end
        end
    end
    %assign value to C
    X = S\cpoly;
    C_den = X(1:m+1);
    C_num = X(m+2:2*m+2);
else
    m = n;
    for j = 1:2*m+1
        for i = 1:m+n+1
            %the left half matrix
            if(j <= m+1)
                if(i-j >= 0 && i-j <= n)
                    S(i,j) = P_den(i - j + 1);
                else
                    S(i,j) = 0;
                end
            %the right half matrix
            else
                i-(j-m)
                if(i-(j-m) >= 1 && i-(j-m) <= n)
                    S(i,j) = P_num(i-(j-m)+1);
                else
                    S(i,j) = 0;
                end
            end
        end
    end
    %assign vlue to C
    X = S\cpoly;
    C_den = X(1:m+1);
    C_num = X(m+2:2*m+1);
end

end