function [res,iter,algoper,time, answerReady] = Newton(x0, eps, k)
if nargin==2
    k=1000;
end
answerReady=false;
algoper = 0;
tic;
iter=0; xk=x0;
n = length(x0);
xk1=zeros(1,10);
while (iter<k && norm(xk1-xk)>eps)
    if iter>0
        xk=xk1;
    end
    [L,U,P, ao]=PluDecompose(BigJacob(xk));
    algoper = algoper + ao;
    [quotient, ao] = SolvePLU(P,L,U,funF(xk)');
    algoper = algoper + ao;
    xk1=xk-quotient;
    algoper = algoper + n;
    iter=iter+1;
    %disp(norm(xk1-xk));
    if iter == 1000
        disp('Newton exception: Too many iterations');
    end
end
res=xk1;
if norm(xk1 - xk) < eps
    answerReady = true;
end
time=round(toc*1000,2);
end

