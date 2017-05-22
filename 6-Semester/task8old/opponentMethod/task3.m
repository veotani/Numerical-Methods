function [] = task3()
eps = 1e-5;
f = @(x, y) [0.1*y(2); -(1/20)*y(1)];
x0 = 0;
y0 = [(1/20)*pi; 0.1*pi];
xk = pi;
Delta = (1/max([x0 xk]))^5 + (norm(f(x0, y0)))^5;

h = (eps/Delta)^(1/5);
disp(h);

end