function TaskD(x0, eps)
if (x0 == 0)
    x0 = [0.5 0.5 1.5 -1 -0.5 1.5 0.5 -0.5 1.5 -1.5]';
end
disp('Task D');
for k=1:10
    [result, iterations ,algoperations, time] = NewtonModSwitchKIt(x0, eps, k);
    disp([iterations algoperations time k]);
end
disp('Оптимальное k=7');
end

