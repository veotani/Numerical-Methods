function [legendre] = Legendre(x, n)
if n==1
    legendre = -x;
elseif n==2
    legendre = (1/8)* (1.5*x^2-0.5);
elseif n==3
    legendre = (1/48) * (24*x*(3-5*x^2));
elseif n==0
    legendre = 1;
end

