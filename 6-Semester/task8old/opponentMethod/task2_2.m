function [ heps ] = task2_2(  )
%найдём оптимальный шаг
eps = 1e-4;
h = 1;
R = 5;
x0 = 0;
y0 = [(1/20)*pi; 0.1*pi];

while R>eps
    y1h = y0;
    y2h = y0;
    x1h = x0;
    x2h = x0;
    while (x1h<pi)
        [x1h, y1h] = method(h, x1h, y1h);
        [x2h, y2h] = method(h/2, x2h, y2h);
        [x2h, y2h] = method(h/2, x2h, y2h);
    end
    h = h/2;
    R = norm(y2h-y1h)/7;
end

heps = h/2*(8*eps/norm(y2h-y1h))^(1/4);
disp('Оптимальный шаг heps = ');
disp(heps);
end

