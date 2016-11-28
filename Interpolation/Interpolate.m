function [pointx, pointy, funy] = Interpolate(fun, a)
maxdiff=zeros(1,10);
maxdiffcheb=zeros(1,10);
ns=3:12;


%pointy=zeros(1,100);
for n=3:12
    
roots=zeros(1,n);
values=zeros(1,n);
rootscheb=zeros(1,n);
valuescheb=zeros(1,n);
pointx=zeros(1,100);
funy=zeros(1,100);

    for i = 1:n
        roots(i)=-a+(i-1)*2*a/(n-1);
        values(i)=fun(roots(i)); 
    end

    for i=1:n
        rootscheb(i)=0.5*(2*a*cos((2*i-1)/(2*n)*pi));
        valuescheb(i)=fun(rootscheb(i));
    end
    
for i = 1:100
    pointx(i)=-a+(i-1)*2*a/(100-1);
    funy(i)=fun(pointx(i));
end

pointy=lagrange(pointx,roots,values);
pointycheb=lagrange(pointx,rootscheb,valuescheb);
diff = pointy-funy;
diffcheb = pointycheb-funy;
maxdiff(n-2)=max(abs(diff));
maxdiffcheb(n-2)=max(abs(diffcheb));

end
figure;
plot(ns,maxdiff,'black',ns,maxdiffcheb,'red');
end



