function [heps] = task2_2()
%определяем оптимальный постоянный шаг heps
h = 2;
eps = 1e-4;
R = 5;
while R>eps
    h = h/2;
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
end
disp('Решение задачи Коши:');
disp(y1h');
disp('Получили оптимальный постоянный шаг heps равный');
heps = h/2*sqrt(eps/R);
disp(heps);
end

