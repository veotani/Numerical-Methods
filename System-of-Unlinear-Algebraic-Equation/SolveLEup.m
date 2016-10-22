function [ x,ao ] = SolveLEup( A, b )
%���������� ����� �������� ����
%y = L \ (Pt * b);
%x = U \ y;
%������� ���� Pt*b = L*y
%�������:
ao=0;
n=length(b);
x = zeros(n,1);
for i=n:-1:1 
    sumX = 0;
    for j=(i+1):n
        sumX = sumX + A(i,j)*x(j);
        ao=ao+2;
    end
    x(i) = (b(i) - sumX)/A(i,i);
    ao=ao+2;
end






end

