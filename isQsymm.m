rng('default'); %seeded
rng(1);
A = randn(500,500);
Q = transpose(A)*A; %positive definite