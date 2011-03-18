function harmonic(A)
C = [ 1 2 4 2 ];
[ An Am] = size(A);
[Cn Cm] =size(C); % condition

if  Cn~= 1 || Cm ~= An || An ~= Am
    disp('Input error')
    return
end

%set time here
t = -fix(100*pi):1:fix(100*pi);
[tn tm] = size(t);% time

[vect   val ]=eig( A );
X = zeros (An,tm);
for i = 1: An
     for m = 1:tm
        x(:,m) = C(1,i)*exp(val(i,i)*t(1,m))* vect(:,i);
        X(:,m) = X(:,m) + x(:,m);
     end
end

plot( X(1,:) , X(3,:) , 'r')