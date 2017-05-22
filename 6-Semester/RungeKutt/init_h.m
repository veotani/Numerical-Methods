function [h] = init_h(eps, x0, y0, s)
xk = pi;
Delta = (1/max([x0, xk]))^(s+1)+norm(foo(x0, y0))^(s+1); 
h = (eps/Delta)^(1/(s+1));
end