function [] = process()
h=[];
exacty = [exp(sin(25)); exp(-sin(25)); 2*sin(25)+2; cos(25)]; %Точное значение решения при x=5
y0 = [1 1 2 1]';
x0 = 0;
for i = 0:6
    h = [h 1/2^(i+6)];
end
R = [];
for i = 1:7
    x = x0; y = y0;
    while (x<5)
        [x, y] = initmeth(h(i), x, y);
    end
    y
    R = [R norm(y-exacty)];
end
plot(h, R);
end

