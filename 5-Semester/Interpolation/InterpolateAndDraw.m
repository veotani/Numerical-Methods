function [pointx, pointy, funy] = InterpolateAndDraw(fun, a, n, cheb,dfun,d2fun)
if (nargin==0)
    fun = @(x) x-sin(x)-0.25;
    a=5;
    n=4;
    cheb=false;
    dfun=@(x) 0;
    d2fun=@(x) 0;
end
if (nargin==4)
    dfun=@(x) 0;
    d2fun=@(x) 0;
end
roots=zeros(1,n);
values=zeros(1,n);
pointx=zeros(1,100);
%pointy=zeros(1,100);

funy=zeros(1,100);

if (cheb==false)
for i = 1:n
    roots(i)=-a+(i-1)*2*a/(n-1);
    values(i)=fun(roots(i)); 
end
elseif (cheb==true)
    for i=1:n
        roots(i)=0.5*(2*a*cos((2*i-1)/(2*n)*pi));
        values(i)=fun(roots(i));
    end
end

for i = 1:100
    pointx(i)=-a+(i-1)*2*a/(100-1);
    funy(i)=fun(pointx(i));
end

pointy=lagrange(pointx,roots,values);

diff = pointy-funy;
disp(max(diff));


b = figure;
plot(pointx,abs(diff));
title('Отклонения лагранжа от функции');
movegui(b,'northeast');

c = figure;
polyherm=Hermite(fun,dfun,[-a 0 a]);
polyherm2=Hermite2(fun,dfun,d2fun,[-a 0 a]);
funyherm=zeros(1,100);
funyherm2=zeros(1,100);
for i = 1:100
    funyherm(i)=BuildHermite(pointx(i),polyherm);
    funyherm2(i)=BuildHermite2(pointx(i),polyherm2);
end
movegui(c,'northwest');
plot(pointx,pointy,'black',pointx,funyherm,'red',pointx,funy,'green',pointx,funyherm2,'blue');
title('Чёрная - лагранж; Красная - Эрмит');
xlabel('Зелёная - функция; Синяя - ЭрмитD2F'); 
%Первое задание (только графики) InterpolateAndDraw(@(x) x-sin(x)-0.25, 5, 4, true, @(x) 1-cos(x), @(x) sin(x))
%Второе задание (только графики) 
%InterpolateAndDraw(@(x) x-sin(x)-0.25, 5, 4, true, @(x) (1-cos(x))*abs(x)+sign(x)*(x-sin(x)-0.25), @(x) sin(x))
end

