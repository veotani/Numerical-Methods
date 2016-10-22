function [ L, U, Pt, ao ] = PluDecompose( M )
n = length( M );
ao = 0;
L = zeros( n, n );
U = M;
Pt = eye( n, n );
for i=1:(n - 1)
   [tmp, j] = max( abs( U(i:n, i) ) ) ;
   j = j + (i - 1); 
   U ([i, j], :) = U ([j, i], :);
   Pt([i, j], :) = Pt([j, i], :);
   L ([i, j], :) = L ([j, i], :);

   for j=(i + 1):n
      s = -U(j, i)/U(i, i);
      U(j, :) = U(j, :) + s*U(i, :); 
      L(j, i) = -s;                  
      ao = ao + 1 + 2*(n-i);
   end
end
L = L + eye( n, n );  
ao = ao + n;
end

