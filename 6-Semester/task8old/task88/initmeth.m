function [x1, y1] = initmeth(h, x0, y0)
A = 2; B = -1; C = 2;
f = @(X) [2*X(5)*X(2)^(1/B)*X(4); 2*B*X(5)*exp(B/C*X(3)-A)*X(4); 2*C*X(5)*X(4); -2*X(5)*log(X(1))];
c2=0.55;a12 = 0.55;b2=1/1.1;b1=1-b2;c1=0;
X = [y0; x0];
k1 = f(X);
X1 = X + [h/2.*k1; h/2];
k2 = f(X1);
y1 = y0 + h*b1*k1 + h*b2*k2;
x1 = x0 + h;
end

