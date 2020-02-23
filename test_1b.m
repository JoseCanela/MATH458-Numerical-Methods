A=[1 1 1; 0 0 0; 0 0 0];
b=[1; 0; 0];
c=[1;2;3];
v=[1;2;3];
options(1)=1;
[x,v]=SIMPLEX(c,A,b,v,options)
