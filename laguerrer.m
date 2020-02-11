function laguerrer(in_l, n, conv, fu)
%****************************************************************
%Title  -   Laguerrer Method Of Estimating Roots Of Polynomials.*
%in_l   -   Lower bound initial estimated root                  *
%n      -   Degree of the given function                        *
%conv   -   Tolerance value                                     *
%fu     -   Function to evaluate                                *
%Program Design By: Abdulraheem Sherif A.                       *
%Supervised By: Prof. Mshelia I. Bello.                         *
%Abubakar Tafawa Balewa University Bauchi, Bauchi State.        *
%As a requirement for the Award of BTech. Mathematics.          *
%****************************************************************
err = 1;
fprintf(' --------------------------\n');
fprintf(' Laguerres Iterative Method\n');
fprintf(' --------------------------\n');
t = cputime;
%differentiate
diff_f = diff(fu);%b
diff_s = diff(fu,2);%a
    iter = 0;
    fprintf('No. |Est. Root |Error       \n');
    fprintf('%d    %8.6f    \n',iter, double(in_l));
    %iterate for the result
    x_new = in_l;
    while abs(err) > conv
        func_a = double(subs(fu,in_l));%c
        if func_a == 0
               break;
        end
        iter = iter + 1;
        func_f = double(subs(diff_f,in_l)); %b
        func_s = double(subs(diff_s,in_l));%a
        r = double(sqrt((n - 1)*((n-1)*func_f^2-n*func_s*func_a)));
        pos = func_f+r;
        neg = func_f-r;
        res = double(max(abs(pos),abs(neg)));
        a = double(n*(func_a/res));
        x_old = x_new;
        %implement formular
        x_new = double(in_l - a);
        in_l = x_new;
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