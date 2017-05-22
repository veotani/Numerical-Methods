function [x_new, y_new] = Runge4(x, y, h) %бяч тсмйжхч ондлемхрэ мю ябни лернд 3 онпъдйю
k1 = h*foo(x, y);
k2 = h*foo(x+0.5*h, y+0.5*k1);
k3 = h*foo(x+0.5*h, y+0.5*k2);
k4 = h*foo(x+h, y+k3);
y_new = y + (1/6)*(k1+2*k2+2*k3+k4);
x_new = x + h;
end