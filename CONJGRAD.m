%% Conjugate Gradient Method for Solving Ax=b

function [x,numIt] = CONJGRAD(A,x,b,atol)
% Inputs/Arguments: 
%                   A = Matrix A=A'>0
%                  x = Initial Condition of x = x0
%                   b = A Constant Vector 
%                atol = Allowed Error Tolerance 
% Output:
%                   x = Final Solution
%               numIt = Number of Iterations  

n = length(b); % Number of rows/elements in b (also a Step Counter for 
               % the max number of iterations needed for the problem to be
               % solved.           
g = -(b - A*x); % Residual of Ax=b
d = -g; % Q-conjugate direction
tic
for numIt = 1:n % Given that CGM solves this problem in max n steps  
    Ad = A*d;
    alpha = dot(d,-g)/dot(d,Ad); % Step Size for updating x
    x = x + alpha*d;
    g = -(b - A*x);
    if sqrt(dot(-g,-g)) < atol % If norm of residual is less that atol, 
        return                 % we stop b/c the min has been achieved.
    else % If norm of residual is not less than atol, we update: d.
        beta = -dot(-g,Ad)/dot(d,Ad); % Step Size for updating d 
        d = -g + beta*d;               
    end
end
toc
disp('Residual =')
disp(sqrt(dot(-g,-g)))
end

    
    





 
