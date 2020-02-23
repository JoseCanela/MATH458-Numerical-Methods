%% Problem #2
%initial conditions
n = 5;
m = 5; 
rng('default'); %seeded
rng(1);
M = randn(n,n);
Q = transpose(M) * M; %positive definite matrix
e = randn(n,1); %expected values of rates of returns
x = sym('x',[1 n]); %unknown portfolio
%find portfolio and sigma^2 using Lagrange Multipliers
[xx,sigma2] = Lagrange(Q,e,m,x)
%Solve for different m
m = [5,10,15,20,25,30];
sigma2 = zeros(size(m));
for i = 1:length(m)
    [xx,sigma2(i)] = Lagrange(Q,e,m(i),x);
end
%graph m and sigma2
plot(m,sigma2);
xlabel('m')
ylabel('sigma2')