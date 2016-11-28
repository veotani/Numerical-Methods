function [ x,ao ] = SolvePLU(P,L,U,b)
%y = L \ (Pt * b);
%x = U \ y;
[y,ao1]=SolveLEdown(L,P*b);
[x,ao2]=SolveLEup(U,y);
ao = ao1+ao2;
end

