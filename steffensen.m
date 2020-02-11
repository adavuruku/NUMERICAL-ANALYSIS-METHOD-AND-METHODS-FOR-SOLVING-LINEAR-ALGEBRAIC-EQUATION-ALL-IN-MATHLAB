function steffensen(in_l,conv, fu)
%*******************************************************************
%Title  -   Steffenssens Method Of Estimating Roots Of Polynomials.*
%in_l   -   Initial estimated root                                 *
%conv   -   Tolerance value                                        *
%fu     -   Function to evaluate                                   *
%Program Design By: Abdulraheem Sherif A.                          *
%Supervised By: Prof. Mshelia I. Bello.                            *
%Abubakar Tafawa Balewa University Bauchi, Bauchi State.           *
%As a requirement for the Award of BTech. Mathematics.             *
%*******************************************************************
err = 1;
fprintf(' -----------------------------\n');
fprintf(' Steffenssens Iterative Method\n');
fprintf(' -----------------------------\n');
t = cputime;
        iter = 0;
        fprintf('No. |Est. Root     |Error       \n');
        fprintf('%d    %8.6f    \n',iter, double(in_l));
        %iterate for the result
        x_new = in_l;
        while abs(err) > conv
           func_a = double(subs(fu,in_l));
           if func_a == 0
               break;
           end
           in_u = double(func_a + in_l);
           func_b = double(subs(fu,in_u));
           x_old = x_new;
           %calc slope
           g = double((func_b/func_a)-1);
           x_new = double(in_l - (func_a/g));
           %set the new value
           in_l = x_new;
           iter = iter + 1;
           if x_new ~= 0
               err = double((x_new - x_old)/x_new)*100;
           end
           if iter <= 9
               fprintf('%d    %8.6f   %8.6f     \n',iter, double(in_l),double(err));
           else
               fprintf('%d   %8.6f   %8.6f     \n',iter, double(in_l),double(err));
           end
        end
        f = cputime - t;
        fprintf(' -------------------------------------\n');
        fprintf(' The Estimated Root After %d Iterations in %8.6f seconds is : %8.6f \n',iter,double(f), double(x_new));
end
    