function [res, iter, algoper, time] = NewtonMod(x0, eps, k)
if nargin==2
    k=1000;
end
algoper = 0;
tic;
iter=0; 
xk1=x0;
n = length(x0);
[L, U, P, ao]=PluDecompose(BigJacob(x0));
algoper = algoper + ao;
xk=ones(1,10);
while (norm(xk1 - xk) > eps && iter < k)
    xk=xk1;
    [quotient, ao] = SolvePLU(P, L, U, funF(xk)');
    algoper = algoper + ao;
    xk1=xk - quotient;
    algoper = algoper + n;
    %xk1=xk-(BigJacob(xk)\funF(xk)');
    iter = iter + 1;
    %disp(norm(xk1 - xk));
    if iter == 1000
        disp('NewtonMod exception: Too many iterations');
    end
end
res=xk1;
time=round(toc*1000, 2);
end

