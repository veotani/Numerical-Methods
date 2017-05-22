function [x_new, y_new] = Runge2(x, y, h)
c2 = 0.1; a21 = c2; b2 = 1/(2*c2); b1 = 1 - 1/(2*c2); %хглемхрэ рср бя╗ мюуси!!!!
k1 = h*foo(x, y);
k2 = h*foo(x+c2*h, y+a21*k1);
y_new = y + b1*k1 + b2*k2;
x_new = x + h;
end