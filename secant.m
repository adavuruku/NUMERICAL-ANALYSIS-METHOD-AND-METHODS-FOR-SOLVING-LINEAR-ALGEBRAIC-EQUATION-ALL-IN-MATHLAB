function secant(in_l,in_u,conv, fu)
%****************************************************************
%Title  -   Secant Method Of Estimating Roots Of Polynomials.   *
%in_l   -   Lower bound initial estimated root                  *
%in_u   -   Upper bound initial estimated root                  *
%conv   -   Tolerance value                                     *
%fu     -   Function to evaluate                                *
%Program Design By: Abdulraheem Sherif A.                       *
%Supervised By: Prof. Mshelia I. Bello.                         *
%Abubakar Tafawa Balewa University Bauchi, Bauchi State.        *
%As a requirement for the Award of BTech. Mathematics.          *
%****************************************************************
err = 1;
fprintf(' -----------------------\n');
fprintf(' Secant Iterative Method\n');
fprintf(' -----------------------\n');
        iter = 0;
        fprintf('No. |Lower. Root |Upper. Root |Error       \n');
        fprintf('%d    %8.6f     %8.6f     \n',iter, double(in_l),double(in_u));
        t = cputime;
        %iterate for the result
        x_new = in_l;
        while abs(err) > conv
           func_a = double(subs(fu,in_l));
           if func_a == 0
               break;
           end
           func_b = double(subs(fu,in_u));
           x_old = x_new;
           %the method
           x_new = double(in_u - (func_b*((in_u - in_l)/(func_b - func_a))));
           %set the new value
           in_l = in_u;
           in_u = x_new;
           iter = iter + 1;
           if x_new ~= 0
               err = double((x_new - x_old)/x_new)*100;
           end
           if iter <= 9
               fprintf('%d    %8.6f     %8.6f     %8.6f       \n',iter, double(in_l),double(in_u), double(err));
           else
               fprintf('%d   %8.6f     %8.6f     %8.6f       \n',iter, double(in_l),double(in_u), double(err));
           end
        end
        f = cputime - t;
        fprintf(' -------------------------------------\n');
        fprintf(' The Estimated Root After %d Iterations in %8.6f seconds is : %8.6f \n',iter,double(f), double(x_new));
end
    