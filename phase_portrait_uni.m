function phase_portrait_uni(A ,C)
% A is an co-efficient matrix
% C is a given condition 
% t is time specified
[ An Am] = size(A);
[Cn Cm] =size(C); % condition
%set time here
t = -1:.01:1;
[tn tm] = size(t);% time

if  Cn~= 1 || Cm ~= An || An ~= Am
    disp('Input error')
    return
end


[vect   val ]=eig( A );
X = zeros (An,tm);
for i = 1: An
     for m = 1:tm
        x(:,m) = C(1,i)*exp(val(i,i)*t(1,m))* vect(:,i);
        X(:,m) = X(:,m) + x(:,m);
     end
end

disp('Parameter is X-axis is time')
y_axis = input( 'Which derivativeof x, u want to see on Y axis? \n');

plot( t , X(y_axis + 1, :), 'r' )

t_i = input (' Values of derivatives of X at time ?\n');
for i = 1:An
    X_disp(i,1) = interp1(t,X(i,:),t_i);
end
X_disp