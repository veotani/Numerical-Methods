function [] = task2_3()
h = task2_2/2;
x0 = 0;
y0 = [(1/20)*pi; 0.1*pi];
y1h = y0;
y2h = y0;
x1h = x0;
x2h = x0; 
X=x0; R=0;
while (x1h<pi)
    [x1h, y1h] = method(h, x1h, y1h);
    [x2h, y2h] = method(h/2, x2h, y2h);
    [x2h, y2h] = method(h/2, x2h, y2h);
    X = [X x1h]; R = [R norm(y2h-y1h)/7];
end
plot(X, R);
title('Зависимость R от x');
end