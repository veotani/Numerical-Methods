function [sol1, sol2] = SolveWithPrecision(precision)
addpath(genpath('D:\words'));
if nargin == 0
    precision = 1e-12;
end
x0 = 0;
y0 = [(1/20)*pi; 0.1*pi]; %ИЗМЕНИТЬ y0
xk = pi;
R = precision + 1;
h = init_h(1e-4, x0, y0, 2);

%считаем на сетке h     
x_main_method = x0;
y_main_method = y0;
while x_main_method < xk
    [x_main_method, y_main_method] = Runge2(x_main_method, y_main_method, h);
end

R = 5;
while R>precision
    
    x_main_method_betterGrid = x0;
    y_main_method_betterGrid = y0;
    while x_main_method_betterGrid < xk
        [x_main_method_betterGrid, y_main_method_betterGrid] = Runge2(x_main_method_betterGrid, y_main_method_betterGrid, h/2);
    end
    
    R = norm(y_main_method_betterGrid - y_main_method)/(3/4);
    h = h/2;
    %сохраняем значение, чтобы не пересчитывать
    y_main_method = y_main_method_betterGrid;
end

hopt1 = (h/2)*sqrt(precision/R);
disp('Главный метод:');
disp(['Решение на сетке h = ' num2str(h) ' с погрешностью R = ' num2str(R)]);
disp(y_main_method);
sol1 = y_main_method;
r1 = R;
disp(['Оптимальный шаг heps = ' num2str(hopt1)]);



%______________________________МЕТОД ОППОНЕНТ______________________________
h = init_h(1e-4, x0, y0, 4);
x_main_method = x0;
y_main_method = y0;
while x_main_method < xk
    [x_main_method, y_main_method] = Runge4(x_main_method, y_main_method, h);
end
R = precision + 1;
while R>precision
    
    x_main_method_betterGrid = x0;
    y_main_method_betterGrid = y0;
    while x_main_method_betterGrid < xk
        %ВМЕСТО Runge4 свой метод
        [x_main_method_betterGrid, y_main_method_betterGrid] = Runge4(x_main_method_betterGrid, y_main_method_betterGrid , h/2);
    end
    
    R = norm(y_main_method_betterGrid - y_main_method)/(15/16); %ИЗМЕНИТЬ 15/16 на 7/8
    h = h/2;
    %сохраняем значение, чтобы не пересчитывать
    y_main_method = y_main_method_betterGrid;
end
hopt2 = h/2*(precision/R)^(1/4);
disp('Метод оппонент:');
disp(['Решение на сетке h = ' num2str(h) ' с погрешностью R = ' num2str(R)]);
disp(y_main_method);
sol2 = y_main_method;
disp(['Оптимальный шаг heps = ' num2str(hopt2)]);


x1 = 0;y1 = y0;
x2 = 0;y2 = y0;
x = 0;R1 = 0;
while x < pi
    [x1, y1] = Runge2(x1, y1, hopt1);
    [x2, y2] = Runge2(x2, y2, hopt1/2);
    [x2, y2] = Runge2(x2, y2, hopt1/2);
    x = [x x1];
    R1 = [R1 norm(y2-y1)/(2/3)]; 
end

figure;
plot(x, R1);
title('Основной метод');


x1 = 0;y1 = y0;
x2 = 0;y2 = y0;
x = 0;R1 = 0;
while x < pi
    [x1, y1] = Runge4(x1, y1, hopt2);
    [x2, y2] = Runge4(x2, y2, hopt2/2);
    [x2, y2] = Runge4(x2, y2, hopt2/2);
    x = [x x1];
    R1 = [R1 norm(y2-y1)/(15/16)]; 
end

figure;
plot(x, R1);
title('Метод оппонент');

end