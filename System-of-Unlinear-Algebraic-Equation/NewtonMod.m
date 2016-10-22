function [res, iter, algoper, time] = NewtonMod(x0, eps)
algoper = 0;
tic;
iter=0; 
xk=x0;
n = length(x0);
[L, U, P, ao]=PluDecompose(BigJacob(x0));
algoper = algoper + ao;
%while (iter<10)
while (true)
    [quotient, ao] = SolvePLU(P, L, U, funF(xk)');
    algoper = algoper + ao;
    xk1=xk - quotient;
    algoper = algoper + n;
    %xk1=xk-(BigJacob(xk)\funF(xk)');
    iter = iter + 1;
    %disp(norm(xk1 - xk));
    if (norm(xk1 - xk) < eps)
        break
    end
    xk=xk1;
end
res=xk1;
time=round(toc*1000, 2);
end

