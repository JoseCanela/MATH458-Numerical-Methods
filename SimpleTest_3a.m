A = [4 2;2 2];
x = [0;0];
b = [-1;1];
atol = 1e-7;
[x,numIt] = CONJGRAD(A,x,b,atol)
