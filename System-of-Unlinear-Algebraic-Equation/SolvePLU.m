function [ x,ao ] = SolvePLU(P,L,U,b)
%y = L \ (Pt * b);
%x = U \ y;
[y,ao]=SolveLEdown(L,P*b);
[x,ao]=SolveLEup(U,y);
end

