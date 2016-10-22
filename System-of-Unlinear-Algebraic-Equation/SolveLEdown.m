function [ x,ao ] = SolveLEdown( A, b )
%переделать через обратный гаус
%y = L \ (Pt * b);
%x = U \ y;
%система вида Pt*b = L*y
%решение:
ao=0;
n=length(b);
x = zeros(n,1);
for i=1:n 
    sumX = 0;
    for j=1:i
        sumX = sumX + A(i,j)*x(j);
        ao=ao+2;
    end
    x(i) = (b(i) - sumX)/A(i,i);
    ao=ao+2;
end
