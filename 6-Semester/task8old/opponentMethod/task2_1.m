function [] = task2_1()

eps = 1e-4;
h = pi/2;
R = 5;
x0 = 0;
y0 = [(1/20)*pi; 0.1*pi];

while R>eps
    y1h = y0;
    y2h = y0;
    x1h = x0;
    x2h = x0;
    while (x1h<=pi)
        [x1h, y1h] = method(h, x1h, y1h);
        [x2h, y2h] = method(h/2, x2h, y2h);
        [x2h, y2h] = method(h/2, x2h, y2h);
    end
    h = h/2;
    R = norm(y2h-y1h)/15;
end
disp('Решение с точностью 10^(-4) в x=pi равно: ');
disp(y1h');
disp(['Шаг, с которым считали для такой точности h = ' num2str(h*2)]);
end