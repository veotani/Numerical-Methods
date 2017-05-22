function [] = LeastSquares(f, x, a, b)
y=zeros(1, 5)';
for i=1:5                       %������ ������� ���������� �� 5 �����
    y(i)=f(x(i));                   %������ �������� �������
end
Q = zeros(5, 4);
for i=1:5
    for j=0:3
        Q(i, j+1) = x(i)^j;           %������ ����� ���������, ��������� � �����
    end
end
A = (Q'*Q) \ (Q'*y);
disp(A');
leastSq = @(x) A(1)+A(2)*x+A(3)*x^2+A(4)*x^3;
for i=1:200
    pointsx(i)=a+(b-a)*i/200;
    pointsy(i)=f(pointsx(i));
    pointsLS(i)=leastSq(pointsx(i));
end
plot(pointsx, pointsy, 'r', pointsx, pointsLS, 'g');
end

