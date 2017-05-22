function [] = TaskE(k1, k2)
if nargin==0
    k1=8;
    k2=8;
end
x0 = [0.5 0.5 1.5 -1 -0.2 1.5 0.5 -0.5 1.5 -1.5]';
eps=1e-10;
TaskA(x0, eps);
TaskB(x0, eps);
TaskC(k1, eps, x0);
TaskD(k2, eps, x0)
end

