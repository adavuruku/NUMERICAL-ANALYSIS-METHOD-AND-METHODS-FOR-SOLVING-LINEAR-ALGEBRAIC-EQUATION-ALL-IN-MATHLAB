function laguerrer(in_l, n, conv, fu)
%display initial roots
%display at command window
err = 1;
fprintf(' --------------------------\n');
fprintf(' Laguerres Iterative Method\n');
fprintf(' --------------------------\n');
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
        c = double(subs(fu,in_l));
        %if (func_a) < conv
        %    fprintf('The Estimate Initial Root %8.6f is too small. \n',in_l);
        %    break;
        %else
            iter = iter + 1;
            b = double(subs(diff_f,in_l));
            a = double(subs(diff_s,in_l));
            %G = double(func_f/func_a);
            %H = double((G*G) - (func_s/func_a));
            r = double(sqrt((n - 1)*((n-1)*b^2-n*a*c)));
            
            pos = b+r;
            neg = b-r;
            res = double(max(abs(pos),abs(neg)));
            z = double(n*(c/res));
            x_old = x_new;
            %implement formular
            x_new = double(in_l - z);
            in_l = x_new;
            if x_new ~= 0
                err = double((x_new - x_old)/x_new)*100;
            end
            if iter <= 9
                fprintf('%d    %8.6f   %8.6f     \n',iter, double(in_l),double(err));
            else
                   fprintf('%d   %8.6f   %8.6f     \n',iter, double(in_l),double(err));
            end
        %end
    end
    f = cputime - t;
    fprintf(' -------------------------------------\n');
    fprintf(' The Estimated Root After %d Iterations in %8.6f seconds is : %8.6f \n',iter,double(f), double(x_new));
end