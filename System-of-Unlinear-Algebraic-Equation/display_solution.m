[result, iterations, algebraic_operations, timeUsed] = NewtonMod([0.5 0.5 1.5 -1 -0.5 1.5 0.5 -0.5 1.5 -1.5]', 1e-15);
disp('Задание b):');
disp(['количество итераций: ' num2str(iterations) ]);
disp(['сделано элементарных алгебраических операций: ', num2str(algebraic_operations)]);
disp(['времени затрачено: ' num2str(timeUsed)]);
disp(['полученный результат: ', num2str(result')]);
disp('');

statistics = zeros(11, 3);
for i=1:10
    [res, iter, algoper, time] = NewtonModWSwitcher( [0.5 0.5 1.5 -1 -0.5 1.5 0.5 -0.5 1.5 -1.5]', 0.000001, i);
    statistics(i, 1) = iter; 
    statistics(i, 2) = algoper;
    statistics(i, 3) = time;
end
disp('Задание c):');
disp
disp(statistics);

statistics = zeros(10, 2);
for i=1:10
    [res, iter, algoper, time] = NewtonModSwitchKIt( [0.5 0.5 1.5 -1 -0.5 1.5 0.5 -0.5 1.5 -1.5]', 0.000001, i);
    statistics(i, 1) = iter; 
    statistics(i, 2) = algoper;
end
disp('d):');
disp(statistics);