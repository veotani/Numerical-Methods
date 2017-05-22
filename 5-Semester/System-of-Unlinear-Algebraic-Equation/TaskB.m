function TaskB(x0, eps)
if (nargin==0)
    x0 = [0.5 0.5 1.5 -1 -0.5 1.5 0.5 -0.5 1.5 -1.5]';
    eps = 1e-10;
end
if (nargin==1)
    eps=1e-10;
end
[result , iterations ,algoperations, time] = NewtonMod(x0, eps);
disp('Task B');
disp('Result: ');
disp(result');
disp(['Iterations: ' num2str(iterations)]);
disp(['Algebraic Operations: ' num2str(algoperations)]);
disp(['Time: ' num2str(time)]);
end

