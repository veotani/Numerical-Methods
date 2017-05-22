function [solution1, solution2] = AutoStep()
%Надёжность ОК, т.к. быстро находит оптимальную длину
%Экономичность ОК, т.к. всегда в зоне лучшей погрешности, где шаг имеет
%оптимальную длину
%Оптимальность ОК, т.к. сразу идём с оптимальным шагом и не тратим лишнее
%вычислительное время, в погоне за ненужной точностью (т.к. и без того
%достигаем поставленную точоность 10^(-5)
delta = 1e-7/4;
x0 = 0; y0 = [(1/20)*pi; 0.1*pi]; %ИЗМЕНИТЬ y0 НА СВОИ y0 (другие A и B)
h1 = init_h(1e-4, x0, y0, 2);
h2 = init_h(1e-4, x0, y0, 4);
H1 = h1; H2 = h2;
x=x0; y=y0;
Y = y0; X = 0;
i = 0;
while x < pi
    x_prev  = x;
    y_prev = y;
    [x, y] = Runge2(x, y, h1);
    [x1, y1] = Runge2(x_prev, y_prev, h1/2);
    [x1, y1] = Runge2(x1, y1, h1/2);
    p = norm(y1-y)/(2/3);
    if p>delta*4
        H1(end) = h1/2;
        x = x_prev;
        y = y_prev;
    end
    if p<=delta*4 & p>delta
        h1 = h1/2;
        H1 = [H1 h1];
        Y = [Y y1];
        y = y1;
        X = [X x];
    end
    if p<=delta & p>=delta/8
        H1 = [H1 h1];
        Y = [Y y];
        X = [X x];
    end
    if p<delta/8
        h1 = h1*2;
        H1 = [H1 h1];
        Y = [Y y];
        X = [X x];
    end
end
solution1 = Y(:, end);
figure;
plot(X, H1);
title('Зависимость шага от х. Главный метод.');
disp(p);
disp(X);

%_______________________ОППОНЕНТ___________________________________________
delta = 1e-6/16;
x=x0; y=y0;
Y = y0; X = 0;
while x < pi
    x_prev  = x;
    y_prev = y;
    [x, y] = Runge4(x, y, h2);                %ПОДСТАВИТЬ ДРУГУЮ ФУНКЦИЮ
    [x1, y1] = Runge4(x_prev, y_prev, h2/2);  %АНАЛОГИЧНО
    [x1, y1] = Runge4(x1, y1, h2/2);          %АНАЛОГИЧНО
    p = norm(y1-y)/(2/3);
    if p>delta*16
        H2(end) = h2/2;
        x = x_prev;
        y = y_prev;
        disp('la');
    end
    if p<=delta*16 & p>delta
        h2 = h2/2;
        H2 = [H2 h2];
        Y = [Y y1];
        y = y1;
        X = [X x];
    end
    if p<=delta & p>=delta/32
        H2 = [H2 h2];
        Y = [Y y];
        X = [X x];
    end
    if p<delta/8
        h2 = h2*2;
        H2 = [H2 h2];
        Y = [Y y];
        X = [X x];
    end
end
solution2 = Y(:, end);
figure;
plot(X, H2);
title('Зависимость шага от х. Оппонентный метод.');

end