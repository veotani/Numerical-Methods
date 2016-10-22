function [res, iter, algoper, time] = NewtonModWSwitcher(x0, eps, switcher)

algoper = 0;
tic;
iter=0; 
xk=x0;
n = length(x0);

%while (iter<10)
while (true)
    if (iter <=  switcher)
        [L, U, P, ao]=PluDecompose(BigJacob(xk));
        algoper = algoper + ao;
    end
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

