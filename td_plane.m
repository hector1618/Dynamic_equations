function td_plane( )
a = -10:.1:10;
for i = 1:201
    A = [ a(1,i)  , (sqrt(2)+a(1,i)/2) ;(sqrt(2)-a(1,i)/2 ) , 0 ]; 
    T(1,i) = trace(A);
    D(1,i) = det(A);
end

plot( T,D,'r') 