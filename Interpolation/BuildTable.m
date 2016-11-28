function [] = BuildTable(flag)
a=5;
%���� ���� ������, �� ������� ��� |x|*f, ����� ������� ��� f
if flag
    fun = @(x) abs(x) * (x - sin(x) - 0.25);
else
    fun = @(x) x - sin(x) - 0.25;
end
for n=3:12
    rootsLagrange=zeros(1,n);
    valuesLag=zeros(1,n);
    rootsChebyshev=zeros(1,n);
    valuesCheb=zeros(1,n);
    pointx=zeros(1,100);

    funy=zeros(1,100);
    %����� ��� ��������
    for i = 1:n
        rootsLagrange(i)=-a+(i-1)*2*a/(n-1);
        valuesLag(i)=fun(rootsLagrange(i)); 
    end
    %����� ��� ��������
    for i=1:n
        rootsChebyshev(i)=0.5*(2*a*cos((2*i-1)/(2*n)*pi));
        valuesCheb(i)=fun(rootsChebyshev(i));
    end

%�����, � ������� ����� ��������� ��������
    for i = 1:100
        pointx(i)=-a+(i-1)*2*a/(100-1);
        funy(i)=fun(pointx(i));
    end

    pointsLagrange=lagrange(pointx,rootsLagrange,valuesLag);
    pointsChebLagrange=lagrange(pointx,rootsChebyshev,valuesCheb);
    disp([n max(abs(pointsLagrange-funy)) max(abs(pointsChebLagrange-funy))]);
end
end

