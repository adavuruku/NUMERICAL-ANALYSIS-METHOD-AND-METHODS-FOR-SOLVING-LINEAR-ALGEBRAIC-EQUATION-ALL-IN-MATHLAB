function quadinter(in_l, in_u, in_t, conv, fu)
%***********************************************************************
%Title  -   Quad. Interval Method Of Estimating Roots Of Polynomials.  *
%in_l   -   Lower bound initial estimated root                         *
%in_u   -   Midlle bound initial estimated root                        *
%in_t   -   Upper bound initial estimated root                         *
%conv   -   Tolerance value                                            *
%fu     -   Function to evaluate                                       *
%Program Design By: Abdulraheem Sherif A.                              *
%Supervised By: Prof. Mshelia I. Bello.                                *
%Abubakar Tafawa Balewa University Bauchi, Bauchi State.               *
%As a requirement for the Award of BTech. Mathematics.                 *
%***********************************************************************
err = 1;
fprintf(' ------------------------------\n');
fprintf(' Quadratic Interpolation Method\n');
fprintf(' ------------------------------\n');
t = cputime;    
    iter = 0;
    fprintf('No. |First Root |Second Root |Third Root |Error       \n');
    fprintf('%d    %8.6f    %8.6f     %8.6f    \n',iter, double(in_l),double(in_u),double(in_t));
    %iterate for the result
    x_new = in_l;
    while abs(err) > conv
        func_l = double(subs(fu,in_l));%0
        func_u = double(subs(fu,in_u));%1
        func_t = double(subs(fu,in_t));%2
        if func_l==0
            x_new = in_l;
            break;
        end
        if func_u==0
            x_new = in_u;
            break;
        end
        if func_t==0
            x_new = in_t;
            break;
        end
        numerator = double(func_l * func_l *(in_t - in_u) + func_l*func_u*(in_u - in_t) +(func_u - func_t)*func_t*(in_l - in_u));
        denominator = double((func_u - func_l)*(func_t - func_l)*(func_t -func_u));
        x_old = x_new;
        x_new = double(in_u - (func_u * (numerator/denominator)));
        iter = iter + 1;
        in_l = in_u;
        in_u = in_t;
        in_t = x_new;
        if x_new ~= 0
            err = double(((x_new - x_old)/x_new) *100);
        end
        if iter <= 9
            fprintf('%d    %8.6f    %8.6f     %8.6f    %8.6f    \n',iter, double(in_l),double(in_u),double(in_t),double(err));
        else
            fprintf('%d   %8.6f   %8.6f    %8.6f   %8.6f    \n',iter, double(in_l),double(in_u),double(in_t),double(err));
        end
    end
    f = cputime - t;
    fprintf(' -------------------------------------\n');
    fprintf(' The Estimated Root After %d Iterations in %8.6f seconds is : %8.6f \n',iter,double(f), double(x_new));
end
    