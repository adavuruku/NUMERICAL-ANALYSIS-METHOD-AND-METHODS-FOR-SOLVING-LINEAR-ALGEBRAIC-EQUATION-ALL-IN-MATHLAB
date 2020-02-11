function laold(in_l, n, conv, fu)
%display initial roots
%display at command window
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
        func_a = double(subs(fu,in_l));
        if (func_a) < -0.0000000001
            fprintf('The Estimate Initial Root %8.6f is too small. \n',in_l);
            break;
        else
            iter = iter + 1;
            func_f = double(subs(diff_f,in_l));
            func_s = double(subs(diff_s,in_l));
            G = double(func_f/func_a);
            H = double((G*G) - (func_s/func_a));
            
            pos = double(G + sqrt((n - 1)*((n*H)-(G*G))));
            neg = double(G - sqrt((n - 1)*((n*H)-(G*G))));
            res = double(max(abs(pos),abs(neg)));
            a = double(n/res);
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
    end
    f = cputime - t;
    fprintf(' -------------------------------------\n');
    fprintf(' The Estimated Root After %d Iterations in %8.6f seconds is : %8.6f \n',iter,double(f), double(x_new));
end