%% Conjugate Gradient Method for Solving Ax=b

function [x_new,numIt] = CONJGRAD1(A,x_new,b,atol)
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
g_curr = -(b - A*x_new);% Current Residual of Ax=b
if norm(g_curr)<= atol % Checking if norm of residual is already <= atol 
   disp('current residual is less than');
   disp(atol);
    return;
end

d = -g_curr; % Q-conjugate direction
tic
for numIt = 1:n % Given that CGM solves this problem in max n steps  
    x_curr=x_new;
    Ad = A*d;
    alpha = dot(d,-g_curr)/dot(d,Ad); % Step Size for updating x
    x_new = x_curr + alpha*d;
    if norm(x_new - x_curr)<= atol*norm(x_curr) % Check if x_new is min pt. 
        disp('norm of diff between iterates is less than');
        disp(atol);
         return;
    end
    g_old = g_curr;
    g_curr = -(b - A*x_new);
    if norm(g_curr) <= atol % If norm of residual is less than atol, 
        disp('norm of gradient is less than')
        disp(atol);
        return;                 % we stop b/c the min has been achieved.
    else % If norm of residual is not less than atol, we update: d.
        beta = -dot(-g_curr,Ad)/dot(d,Ad); % Step Size for updating d 
        d = -g_curr + beta*d;               
    end
end
toc
disp('Conj grad residual is');
disp(norm(g_curr))
end

    
    





 
