function [x1, y1] = SecoundOrder(h, x0, y0)
%���������� ������� ������� ��� ������������ ���� ������� ������� ������
%��������� ����� 2 ������� � �2
c2 = 0.1;
a21 = c2;
b2 = 1/(2*c2);
b1 = 1 - 1/(2*c2);



f = @(x, y) [0.1*y(2); -(1/20)*y(1)];
k1 = h*f(x0, y0);
k2 = h*f(x0+c2*h, y0+a21*k1);
x1 = x0+h;
y1 = y0+b1*k1+b2*k2;
end

