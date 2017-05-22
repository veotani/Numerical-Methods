function LeastSquaresLegandre(fun)
c=zeros(1,4);
for i=1:4
    integral=0;
    for j=-1:1e-6:1
        integral = integral + fun(j)*Legendre(j, i-1)*(1e-5);
    end
    c(i)=((2i+1)/2) * integral;
end
pointx=zeros(1,200);
pointy=zeros(1,200);
legendre=zeros(1,200);
for i=1:200
    pointx(i)=-1+0.01*i;
    pointy(i)=fun(pointx(i))
    for j=1:4
        legendre(i) = legendre(i) + c(j)*Legendre(pointx(i), j-1);
    end
end
plot(pointx, pointy, 'b', pointx, legendre, 'g');
end