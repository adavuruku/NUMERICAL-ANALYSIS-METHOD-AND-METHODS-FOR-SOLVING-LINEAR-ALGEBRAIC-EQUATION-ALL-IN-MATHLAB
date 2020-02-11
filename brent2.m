function brent2(a,b,conv, fu)
%display initial roots
%display at command window
err = 1;
%conv =1d-6;
fprintf(' -----------------------\n');
fprintf(' Brents Iterative Method\n');
fprintf(' -----------------------\n');
t = cputime;
iter = 1;

%first step is bisection
x1 =a; f1 = double(subs(fu,x1));
if f1==0; root = x1; return; end

x2 =b; f2 = double(subs(fu,x2));
if f2==0; root = x2; return; end

if f1*f2 > 0
    fprintf('Root not Located between %8.6f and %8.6f  (Not Bracketed) \n',a,b);
    return;
end
x3 = double(0.5 *(a + b));
fprintf('No. |First Root |Second Root |Third Root |Error       \n');
fprintf('%d    %8.6f    %8.6f     %8.6f    \n',iter, double(x1),double(x2),double(x3));
%iterate for the result
x_new = x3;
    while err > conv
        iter = iter + 1;
        f3 = double(subs(fu,x3));
       if abs(f3) < conv
           root = x3; break;
       end
       %tighteen brackets (a,b) on the root
       if f1~= f3 && f2 ~= f3
            %try Quadratic interpolation
           n1 = double((x1*f2*f3)/((f1 - f2)*(f1 - f3)));
           n2 = double((x2*f1*f3)/((f2 - f1)*(f2 - f3)));
           n3 = double((x3*f1*f2)/((f3 - f1)*(f3 - f2)));
           x3 = double(n1 + n2 + n3);
       else
          x3 = x2 - f2*((x2 - x1)/(f2 - f1));
       end
       if (b - a) < conv*max(abs(b),1)
           root = 0.5*(a +b);
           return;
       end
       %try Quadratic interpolation
       denom = double((f2 -f1)*(f3 - f1)*(f2 - f3));
       numer = double(x3*(f1 - f2)*(f2 - f3 + f1)...
           + f2 *x1*(f2 - f3)+ f1*x2*(f3 - f1));
       %if division by zero, push x out of bracket
       %to force bisection
       if denom ==0;
           dx = b -a;
       else
           dx = double(f3*(numer/denom));
       end
       x = double(x3 + dx);
       %if interpolation goes out of bracket, bisection
       if (b - x)*(x - a) <0
           dx = 0.5 *(b -a);
           x = a + dx;
       end
       %let x3 < ... x & choose new x1, x2 so that x1 < x3 < x2
       if x < x3
           x2 = x3; f2 = f3;
       else
           x1 = x3; f1 = f3;
       end
       x_old = x3;
       x3 = x;
       if x3 ~= 0
           err = double((x3 - x_old)/x3)*100;
       end
       if iter <= 9
            fprintf('%d    %8.6f    %8.6f     %8.6f    %8.6f    \n',iter, double(x1),double(x2),double(x3),double(err));
       else
            fprintf('%d   %8.6f   %8.6f    %8.6f   %8.6f    \n',iter, double(x1),double(x2),double(x3),double(err));
       end
    end
    root = NaN;
    f = cputime - t;
    fprintf(' -------------------------------------\n');
    fprintf(' The Estimated Root After %d Iterations in %8.6f seconds is : %8.6f \n',iter,double(f), double(x_new));
end
    