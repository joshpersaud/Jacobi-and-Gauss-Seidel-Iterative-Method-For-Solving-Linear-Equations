function [R, E, I] = jacobi(System, x, Tolerance, Flag)
[N, m] = size(System); A = System(:, 1:m - 1); b = System(:, m);
for i = 1: N
    b(i) = b(i) / A(i, i);
    for j = 1: N
    	if i ~= j
    		A(i, j) = A(i, j) / A(i, i);
    	end 
	end
end
if Flag < 1 || Flag > 2 
	disp('Input Flags: ');
else
    er = 10; iter = 0;
    while er > Tolerance er = 0;
        iter =
        xOld = x = b;
        for i = 1: N
        	for j = 1: N
        		if i ~= j
        			x(i) = x(i) - A(i, j) * xOld(j);
        		end
        	end
            er = er + abs(x(i) - xOld(i));
           end
            if Flag == 1 
            	er = er elseif Flag
            elseif Flag ==2
            	er = sqrt(er^(2)/N);
            end
        end

        R=x; E=er; I = iter;
                 
end
end