function muller(in_l, in_u, in_t, conv, fu)
%****************************************************************
%Title  -   Mullers Method Of Estimating Roots Of Polynomials.  *
%in_l   -   Lower bound initial estimated root                  *
%in_u   -   Midlle bound initial estimated root                 *
%in_t   -   Upper bound initial estimated root                  *
%conv   -   Tolerance value                                     *
%fu     -   Function to evaluate                                *
%Program Design By: Abdulraheem Sherif A.                       *
%Supervised By: Prof. Mshelia I. Bello.                         *
%Abubakar Tafawa Balewa University Bauchi, Bauchi State.        *
%As a requirement for the Award of BTech. Mathematics.          *
%****************************************************************
err = 1;
fprintf(' ------------------------\n');
fprintf(' Mullers Iterative Method\n');
fprintf(' ------------------------\n');
t = cputime;    
    iter = 0;
    fprintf('No. |First Root |Second Root |Third Root |Error       \n');
    fprintf('%d    %8.6f    %8.6f     %8.6f    \n',iter, double(in_l),double(in_u),double(in_t));
    %iterate for the result
    x_new = in_l;
    while abs(err) > conv
        q = double((in_t - in_u)/(in_u - in_l));
        func_l = double(subs(fu,in_l));%1
        func_u = double(subs(fu,in_u));%2
        func_t = double(subs(fu,in_t));%3
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
        A = double((q*func_t) - (q*(1 - q)*func_u) + (q*q*func_l));
        B = double(((2*q + 1) * func_t) - ((1 + q)*(1 + q)*func_u) + (q*q*func_l));
        C = double(((1 + q) * func_t));
        x_old = x_new;
       %implement formular
       pos = abs(double(B + sqrt(B*B - (4*A*C))));
       neg = abs(double(B - sqrt(B*B - (4*A*C))));
       res = max(pos,neg);
       x_new = double(in_t - ((in_t - in_u)*(2*C/res)));
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
    