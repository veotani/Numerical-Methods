function [h] = auto_step(x0, y0)
eps = 1e-5;
f = @(x, y) [0.1*y(2); -(1/20)*y(1)];
Delta = (1/max([x0 pi]))^3+norm(f(x0, y0))^3;
h = (eps/Delta)^(1/3);
end