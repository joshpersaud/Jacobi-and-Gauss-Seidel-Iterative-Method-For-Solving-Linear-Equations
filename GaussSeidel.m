
	
function GaussR(A, start, tol, crit)

n = size(A, 1);
b = A(:, end); % separate vector from coeff
A(:, end) = [];
count = 0;

for i = 1:n
    b(i) = b(i) / A(i, i);
    x(i) = start(i);
    old_x(i) = x(i);
 
    for j = 1:n
        if (i ~= j)
            A(i, j) = A(i, j) / A(i, i);
        end % end if
    end % end j
end % end i

error = 10;

while (error > tol)
    count = count + 1;
    error = 0;
 
    for i = 1:n
        x(i) = b(i);
     
        for j = 1:n
            if (i ~= j)
                x(i) = x(i) - A(i, j) * x(j);
            end % end if
        end % end j
     
        if (crit == 1)
            error = (error + abs(x(i) - old_x(i))) / n; % mean abs error
            old_x(i) = x(i);
        else
            error = sqrt(error + (x(i) - old_x(i)) ^ 2) / n; %root absolute error
            old_x(i) = x(i);
        end
    end % end i
end % end while

if (crit == 1)
    disp('Mean absolute error')
else
    disp('Root mean square error')
end

disp(old_x)