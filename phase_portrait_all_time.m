function phase_portrait_all_time(A,a,b,c)
% for ploting the phase portrait for system X'=AX
% a, b,c  are given sets of parameter for which the graph is being ploted
% time can be changed in the program
[ An Am] = size(A);
[ an am]  = size(a);
[ bn bm] = size(b);
[ cn cm]  = size(c);
L   = [ -1 1];
M  = [ -1 1];
N   = [ -1 1];

if  An == 3
    for i  = 1 : am
        for l = 1:2
            for m = 1:2
                for n = 1:2
                    a_i =L(1,l)* a(1,i);
                    b_i = M(1,m)*b(1,i);
                    c_i = N(1,n)*c(1,i);
                    pp1_3(A,a_i,b_i,c_i);
                end
            end
        end
    end
end


 %%%%%%%%%%%%%%%%%       
function pp1_2(A, a_i , b_i)
[vect   val ]=eig( A );
%set time here
t = -1:.01:1;
     for m = 1:201
           Q(:, m)= a_i*exp(val(1,1)*t(1,m))* vect(:,1);
           W(:, m) = b_i*exp(val(2,2)*t(1,m)) * vect(:,2);
     end
     X = Q +W;
     hold on
     %plot(Q(1,:), Q(2,:),'b')
     %plot(W(1,:), W(2,:),'g')
     %plot(X(1,:), X(2,:),'m')
     plot(t,X(1,:),'c')
 
     
 %%%%%%%%%%%%%%%%%%     
 function pp1_3(A,a_i,b_i,c_i)

[vect   val ]=eig(A);
%set time here
t = -1:.01:1;
     for m = 1:201
           Q(:, m)= a_i*exp(val(1,1)*t(1,m))* vect(:,1);
           W(:, m) = b_i*exp(val(2,2)*t(1,m)) * vect(:,2);
           E(:, m) = c_i*exp(val(3,3)*t(1,m)) * vect(:,3);
     end
     X = Q +W+E;
     hold on
     %plot(Q(1,:), Q(2,:),'b --')
     %plot(W(1,:), W(2,:),'g --')
     %plot(E(1,:), E(2,:),'m --')
     %plot3(X(1,:), X(2,:),X(3,:),'r --')
     
     plot(t,X(1,:),'c')