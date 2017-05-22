function [] = task3()
x0 = 0;
y0 = [(1/20)*pi; 0.1*pi];
h = auto_step(x0, y0);
x1h = x0;
y1h = y0;
x2h = x0;
y2h = y0;
X = x0; R = 0;
while (x1h<pi)
    [x1h, y1h] = SecoundOrder(h, x1h, y1h);
    [x2h, y2h] = SecoundOrder(h/2, x2h, y2h);    
    [x2h, y2h] = SecoundOrder(h/2, x2h, y2h);
    R = norm(y2h-y1h)/3;    
end
disp(R);
end

