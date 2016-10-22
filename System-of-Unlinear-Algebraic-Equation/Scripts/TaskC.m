for k=1:10
    [result, iterations ,algoperations, time] = NewtonModWSwitcher([0.5 0.5 1.5 -1 -0.5 1.5 0.5 -0.5 1.5 -1.5]', 0.000001, k);
    disp([iterations algoperations time k]);
end
disp('Оптимальное k=4');