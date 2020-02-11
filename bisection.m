function bisection(in_l,in_u,conv, fu)
%****************************************************************
%Title  -   Bisection Method Of Estimating Roots Of Polynomials.*
%in_l   -   lower bound initial estimated root                  *
%in_u   -   upper bound initial estimated root                  *
%conv   -   tolerance value                                     *
%fu     -   Function to evaluate                                *
%Program Design By: Abdulraheem Sherif A.                       *
%Supervised By: Prof. Mshelia I. Bello.                         *
%Abubakar Tafawa Balewa University Bauchi, Bauchi State.        *
%As a requirement for the Award of BTech. Mathematics.          *
%****************************************************************
err = 1;
fprintf(' --------------------------\n');
fprintf(' Bisection Iterative Method\n');
fprintf(' --------------------------\n');
t = cputime;
%determine if given initial value is bracket
func_a = double(subs(fu,in_l));
func_b = double(subs(fu,in_u));
    
    if (func_a*func_b) >= 0
        fprintf('Root not Located between %8.6f and %8.6f  \n',in_l,in_u);
        return
    else
        iter = 0;
        fprintf('No. |Lower. Root |Upper. Root |Error       \n');
        fprintf('%d    %8.6f     %8.6f     \n',iter, double(in_l),double(in_u));
        %iterate for the result
        x_new = in_l;
        while abs(err) > conv
           x_old = x_new;
           %implement formular
           x_new = double((in_l + in_u)*0.5);
           iter = iter + 1;
           if x_new ~= 0
               err = double((x_new - x_old)/x_new)*100;
           end
           fun_xnew = double(subs(fu,x_new));
           test = double(fun_xnew * func_a);
           if test < 0
               in_u =  x_new;
           elseif test > 0
               in_l =  x_new;
           else
               err =0;
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
end
    