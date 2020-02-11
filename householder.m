function householder(in_l,conv, fu)
%*******************************************************************
%Title  -   Householders Method Of Estimating Roots Of Polynomials.*
%in_l   -   lower bound initial estimated root                     *
%conv   -   tolerance value                                        *
%fu     -   Function to evaluate                                   *
%Program Design By: Abdulraheem Sherif A.                          *
%Supervised By: Prof. Mshelia I. Bello.                            *
%Abubakar Tafawa Balewa University Bauchi, Bauchi State.           *
%As a requirement for the Award of BTech. Mathematics.             *
%*******************************************************************
err = 1;
fprintf(' -----------------------------\n');
fprintf(' Householders Iterative Method\n');
fprintf(' -----------------------------\n');
t = cputime;
%differentiate
diff_f = diff(fu);
diff_s = diff(fu,2);    
        iter = 0;
        fprintf('No. |Est. Root |Error       \n');
        fprintf('%d    %8.6f    \n',iter, double(in_l));
        %iterate for the result
        x_new = in_l;
        while abs(err) > conv
           func = double(subs(fu,in_l));
           if func == 0
               break;
           end
           func_a = double(subs(diff_f,in_l));
           func_b = double(subs(diff_s,in_l));
           x_old = x_new;
           %implement formular
           x_new = double(in_l - ((func/func_a)*(1 + ((func*func_b)/(2*func_a*func_a)))));
           iter = iter + 1;
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
    