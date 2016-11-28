function [] = GraphForAbs(n)
a=5;
fun = @(x) abs(x) * (x - sin(x) - 0.25);
    roots=zeros(1,n);
    values=zeros(1,n);
    pointx=zeros(1,100);

    funy=zeros(1,100);
    %Корни для лагранжа
    for i = 1:n
        rootsLagrange(i)=-a+(i-1)*2*a/(n-1);
        valuesLag(i)=fun(rootsLagrange(i)); 
    end
    %Корни для чебышева
    for i=1:n
        rootsChebyshev(i)=0.5*(2*a*cos((2*i-1)/(2*n)*pi));
        valuesCheb(i)=fun(rootsChebyshev(i));
    end

%точки, в которых хотим вычислить значения
    for i = 1:100
        pointx(i)=-a+(i-1)*2*a/(100-1);
        funy(i)=fun(pointx(i));
    end

    pointsLagrange=lagrange(pointx,rootsLagrange,valuesLag);
    pointsChebLagrange=lagrange(pointx,rootsChebyshev,valuesCheb);
    b = figure;
    plot(pointx, pointsLagrange, 'r', pointx, funy, 'b');
    title('Лагранж');
    movegui(b,'northeast');
    b = figure;
    plot(pointx, pointsChebLagrange, 'r', pointx, funy, 'b');
    title('Лагранж по корням полинома Чебышева');
    movegui(b,'northwest');

end

