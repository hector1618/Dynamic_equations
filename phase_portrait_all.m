function phase_portrait_all(A,a,b,c)
[ An Am] = size(A);
[ an am]  = size(a);
[ bn bm] = size(b);
[ cn cm]  = size(c);
L   = [ -1 1];
M  = [ -1 1];
N   = [ -1 1];

if An == 2
    for i  = 1 : am
        for l = 1:2
            for m = 1:2
                a_i = L(1,l)* a(1,i);
                b_i = M(1,m)*b(1,i);
                pp1_2(A, a_i,b_i)
            end
        end
    end
end
    
if  An == 3
    for i  = 1 : am
        for l = 1:2
            for m = 1:2
                for n = 1:2
                    a_i =L(1,l)* a(1,i);
                    b_i = M(1,m)*b(1,i);
                    c_i = N(1,n)*c(1,i);
                    pp1_3(A, a_i,b_i,c_i)
                end
            end
        end
    end
end
 %%%%%%%%%%%%%%%%%       
function pp1_2(A, a_i , b_i)
[vect   val ]=eig( A );
%set time here
t = -10:.1:10;
     for m = 1:201
           Q(:, m)= a_i*exp(val(1,1)*t(1,m))* vect(:,1);
           W(:, m) = b_i*exp(val(2,2)*t(1,m)) * vect(:,2);
     end
     X = Q +W;
     hold on
     plot(Q(1,:), Q(2,:),'b')
     plot(W(1,:), W(2,:),'g')
     plot(X(1,:), X(2,:),'m')
 
     
 %%%%%%%%%%%%%%%%%%     
 function pp1_3(A,a_i,b_i,c_i)

[vect   val ]=eig(A);
%set time here
t = -10:.1:10;
     for m = 1:201
           Q(:, m)= a_i*exp(val(1,1)*t(1,m))* vect(:,1);
           W(:, m) = b_i*exp(val(2,2)*t(1,m)) * vect(:,2);
           E(:, m) = c_i*exp(val(3,3)*t(1,m)) * vect(:,3);
     end
     X = Q +W+E;
     hold on
     plot(Q(1,:), Q(2,:),'b --')
     plot(W(1,:), W(2,:),'g --')
     plot(E(1,:), E(2,:),'m --')
     plot3(X(1,:), X(2,:),X(3,:),'r --')
 