function [x_new, y_new] = Runge2OptStep(x, y, h)
[x1, y1] = Runge2(x, y, h);
[x2, y2] = Runge2(x, y, h/2);
[x2, y2] = Runge2(x2, y2, h/2);
p = norm(y1-y2)/(2/3);
if p


end

