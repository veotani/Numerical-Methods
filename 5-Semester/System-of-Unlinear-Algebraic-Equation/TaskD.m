function TaskD(k, eps, x0)
disp('TaskD');
if (nargin==1)
    x0 = [0.5 0.5 1.5 -1 -0.5 1.5 0.5 -0.5 1.5 -1.5]';
    eps = 1e-10;
end
it=0; t=0; aa=0;
answerReady=false;
while ~answerReady && it<1000
    [result , iterations ,algoperations, time, answerReady] = Newton(x0, eps, k);
    it=it+iterations;
    aa=aa+algoperations;
    t=t+time;
    if ~answerReady
        [res, ite, aop, ticc] = NewtonMod(result, eps);
        it=it+ite;
        aa=aa+aop;
        t=t+ticc;
        x0=res;
    else
        x0=result;
    end
end
disp(['Итераций:' num2str(it) ' Операций: ' num2str(aa) ' Время: ' num2str(t)]);
end