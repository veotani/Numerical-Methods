[result , iterations ,algoperations, time] = Newton([0.5 0.5 1.5 -1 -0.2 1.5 0.5 -0.5 1.5 -1.5]', 0.000001)
disp('А с новым x0');
disp([iterations algoperations time]);
[result , iterations ,algoperations, time] = NewtonMod([0.5 0.5 1.5 -1 -0.2 1.5 0.5 -0.5 1.5 -1.5]', 0.000001)
disp('B с новым x0');
disp([iterations algoperations time]);
disp('C c новым x0');
for k=1:10
    [result, iterations ,algoperations, time] = NewtonModWSwitcher([0.5 0.5 1.5 -1 -0.2 1.5 0.5 -0.5 1.5 -1.5]', 0.000001, k);
    disp([iterations algoperations time k]);
end
disp('D с новым х0');
for k=1:10
    [result, iterations ,algoperations, time] = NewtonModSwitchKIt([0.5 0.5 1.5 -1 -0.2 1.5 0.5 -0.5 1.5 -1.5]', 0.000001, k);
    disp([iterations algoperations time k]);
end