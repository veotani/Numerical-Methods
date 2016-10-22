[result, iterations, algebraic_operations, timeUsed] = NewtonMod([0.5 0.5 1.5 -1 -0.5 1.5 0.5 -0.5 1.5 -1.5]', 1e-15);
disp('������� b):');
disp(['���������� ��������: ' num2str(iterations) ]);
disp(['������� ������������ �������������� ��������: ', num2str(algebraic_operations)]);
disp(['������� ���������: ' num2str(timeUsed)]);
disp(['���������� ���������: ', num2str(result')]);
disp('');

statistics = zeros(11, 3);
for i=1:10
    [res, iter, algoper, time] = NewtonModWSwitcher( [0.5 0.5 1.5 -1 -0.5 1.5 0.5 -0.5 1.5 -1.5]', 0.000001, i);
    statistics(i, 1) = iter; 
    statistics(i, 2) = algoper;
    statistics(i, 3) = time;
end
disp('������� c):');
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