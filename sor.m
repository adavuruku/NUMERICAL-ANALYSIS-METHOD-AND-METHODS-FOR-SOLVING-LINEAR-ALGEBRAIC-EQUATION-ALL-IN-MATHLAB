function sor(matrix_in,right_v,sol_v,l_y,r_factor,tol)
%**************************************************************************
%Title       -   Succ. Over Rel.(SOR) Method Of Solving Linear System Eqtn.*
%matrix_in   -   Matrix representation of left hand side of the equation. *
%right_v     -   Vector representation of the right hand side             *
%sol_v       -   Vector representation of the initial solutions           *
%l_y         -   Size of the Matrix dimensions.                           *
%r_factor    -   Relaxation Factor.                                       *
%tol         -   tolerance value                                          *
%Program Design By: Abdulraheem Sherif A.                                 *
%Supervised By: Prof. Mshelia I. Bello.                                   *
%Abubakar Tafawa Balewa University Bauchi, Bauchi State.                  *
%As a requirement for the Award of BTech. Mathematics.                    *
%**************************************************************************
    fprintf(' -------------------------------------------------\n');
    fprintf(' Successive Over-Relaxation Iterative Method (SLE)\n');
    fprintf(' -------------------------------------------------\n');
    t = cputime;
    grid_data = reshape(str2double(regexp(matrix_in,'[+-]?\d+\.?\d*','match')),l_y,[]);
    right_data = reshape(str2double(regexp(right_v,'[+-]?\d+\.?\d*','match')),l_y,[]);
    in_data = reshape(str2double(regexp(sol_v,'[+-]?\d+\.?\d*','match')),l_y,[]);
    [r1 c1] = size(grid_data);
    [r2 c2] = size(right_data);
    [r3 c3] = size(in_data);
    if r1 ~= c1 || r1 ~= l_y || r1 ~= r2 || r1 ~= r3
        matrix_eqtn = grid_data
        fprintf('Data Provided are incorrect !!\n')
        return;
    end
    %check for diagonal dorminant
    for j = 1 : l_y
        if abs(grid_data(j,j)) < sum(abs(grid_data(j,[1:j-1,j+1:l_y])))
            matrix_eqtn = grid_data
            fprintf('Given Equation Cannot be solve Using Jacobi Method is Not Diagonnally Dorminant\n')
            return;
        end
    end
    %Display headings
    fprintf('No. ')
    for j = 1 : l_y
        fprintf('X(%1i)      ',j)
    end
    fprintf('Error  \n')
    
    %Start Iterations
    sol_data = in_data;
    err = 1;
    iteration = 0;
    while err > 10^-6
        for j = 1 : l_y
             %compute formular
             in_data(j) =   double(((right_data(j) - grid_data(j,[1:j-1,j+1:l_y])*in_data([1:j-1,j+1:l_y]))*(r_factor/grid_data(j,j))) + ((1 - r_factor)*sol_data(j)));
        end
        %compute error
        err = max(abs(in_data - sol_data));
        sol_data = in_data;
        %increment iteration
        iteration = iteration + 1;
        
        %Display computation result
        fprintf(' %d ',iteration)
        for j = 1 : l_y
            fprintf(' %8.6f ',sol_data(j))
        end
        fprintf(' %8.6f \n',err)
    end
    %Display final computation result
    f = cputime - t;
    fprintf(' -----------------------------------------------------------------------\n');
    fprintf(' The Estimated Solution After %d Iterations in %8.6f seconds is : \n',iteration,double(f));
    for j = 1 : l_y
        fprintf(' X(%1i)  =  %8.6f  ',j,sol_data(j))
    end
    fprintf('\n -----------------------------------------------------------------------\n');
end