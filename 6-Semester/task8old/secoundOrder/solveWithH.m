function [] = solveWithH(h)
x0 = 0;
y0 = [(1/20)*pi; 0.1*pi];
x = x0;
y = y0;
while (x<pi)
    [x, y] = SecoundOrder(h, x, y);
end
y1h=y;
x = x0;
y = y0;
while (x<pi)
    [x, y] = SecoundOrder(h/2, x, y);
end
y2h=y;
R = norm(y2h-y1h)/(3/4);
disp('Решение с шагом h = ');
disp(h);
disp('Даёт погрешность R = ');
disp(R);
end

