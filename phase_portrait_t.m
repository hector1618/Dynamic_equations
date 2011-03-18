function phase_portrait_t(A,a,b,T)
A = inv(T)*A*T;
[ an am]  = size(a);
[ bn bm] = size(b);
if am~=bm
    disp('enter matrix of same length')
    return
end

for i  = 1 : am
        a_i = a(1,i);
        b_i = b(1,i);
        pp1(A, a_i,b_i);
        a_i = -a(1,i);
        b_i = b(1,i);
        pp1(A, a_i,b_i);
         a_i = a(1,i);
        b_i = -b(1,i);
        pp1(A, a_i,b_i);
         a_i = -a(1,i);
        b_i = -b(1,i);
        pp1(A, a_i,b_i);
end

 %%%%%%%%%%%%%%%%%       
 function pp1(A, a_i,b_i)
[vect   val ]=eig(A);
%set time here
t = -2:.01:0;
     for m = 1:201
           Q(:, m)= a_i*exp(val(1,1)*t(1,m))* vect(:,1);
           W(:, m) = b_i*exp(val(2,2)*t(1,m)) * vect(:,2);
     end
     X = Q +W;
     hold on
     plot(Q(1,:), Q(2,:),'b')
     plot(W(1,:), W(2,:),'g')
     plot(X(1,:), X(2,:),'r')