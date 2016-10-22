function [ x ] = SolveLEup( A, b )


%переделать через обратный гаус
%y = L \ (Pt * b);
%x = U \ y;


%система вида Pt*b = L*y
%решение:
n=length(b);
x = zeros(n,1);
for i=n:-1:1 
    sumX = 0;
    for j=(i+1):n
        sumX = sumX + A(i,j)*x(j);
    end
    x(i) = (b(i) - sumX)/A(i,i);
end






end

