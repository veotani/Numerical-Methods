function TaskB(x0, eps)
if (x0 == 0)
    x0 = [0.5 0.5 1.5 -1 -0.5 1.5 0.5 -0.5 1.5 -1.5]';
end
[result , iterations ,algoperations, time] = NewtonMod(x0, eps);
disp('Task B');
disp('Result: ');
disp(result');
disp(['Iterations: ' num2str(iterations)]);
disp(['Algebraic Operations: ' num2str(algoperations)]);
disp(['Time: ' num2str(time)]);
end

