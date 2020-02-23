function [x,sigma2] = Lagrange(Q,e,m,x)
%Input arguments:
%           Q = covariance matrix
%           e = vector of expected value of returns
%           m = constraint of problem
%           x = vector of unknown portfolio
%   Use Lagrange Multiplier theory to find a portfolio that minimizes
%   variance to achieve a given level of mean return, m.
lambda = sym('lambda', [1 2]); %unknown lambdas
 %Lagrange
L = x*Q*transpose(x) + lambda(1)*(m-x*e) + lambda(2)*(1-x*ones(5,1));
%partial diff
diffLx = Q*transpose(x) - lambda(1)*e - lambda(2)*ones(5,1);
diffL1 = diff(L,lambda(1));
diffL2 = diff(L,lambda(2));
%solve for lambdas
A = [.5*transpose(e)*inv(Q)*e, .5*transpose(e)*inv(Q)*ones(5,1); .5*transpose(e)*inv(Q)*ones(5,1), .5*ones(1,5)*inv(Q)*ones(5,1)];
b = [m;1];
lambda = inv(A)*b;
lambda1 = lambda(1);
lambda2 = lambda(2);
%substitute in x
diffLx = subs(diffLx);
%solve for x
a = solve(diffLx,x);
x(1) = a.x1;
x(2) = a.x2;
x(3) = a.x3;
x(4) = a.x4;
x(5) = a.x5;
x = double(x);
%find sigma^2
sigma2 = x * Q * transpose(x);
end
