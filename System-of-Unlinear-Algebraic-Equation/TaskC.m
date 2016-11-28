function TaskC(k, eps, x0)
disp('TaskC');
if (nargin==1)
    x0 = [0.5 0.5 1.5 -1 -0.5 1.5 0.5 -0.5 1.5 -1.5]';
    eps = 1e-10;
end
[result , iterations ,algoperations, time, aReady] = Newton(x0, eps, k);
if ~aReady
    [res, it, ao, tic] = NewtonMod(result, eps);
else
    it=0; ao=0;
    tic=0;
end
disp(['Итераций:' num2str(it+iterations) ' Операций: ' num2str(algoperations+ao) ' Время: ' num2str(time+tic)]);
end