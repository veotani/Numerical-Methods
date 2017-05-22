function [x1, y1] = metod(h, x0, y0)
f = @(x, y) [0.1*y(2); -(1/20)*y(1)];
k1 = h*f(x0, y0);
k2 = h*f(x0+0.5*h, y0+0.5*k1);
k3 = h*f(x0+0.5*h, y0+0.5*k2);
k4 = h*f(x0+h, y0+k3);
y1 = y0 + (k1+2*k2+2*k3+k4)/6;
x1 = x0 + h;
end

