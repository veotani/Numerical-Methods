function [] = countWithH(h)
h = h*2;
x0 = 0;
y0 = [(1/20)*pi; 0.1*pi];
y1h = y0;
y2h = y0;
x1h = x0;
x2h = x0; 
X=[]; R=[];
while (x1h<pi)
    [x1h, y1h] = method(h, x1h, y1h);
    [x2h, y2h] = method(h/2, x2h, y2h);
    [x2h, y2h] = method(h/2, x2h, y2h);
    R = norm(y2h-y1h)/7;
end
R;
title('Зависимость R от x');
end

