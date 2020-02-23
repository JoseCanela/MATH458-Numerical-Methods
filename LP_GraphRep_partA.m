%% Final Project: Optimization Question 1a
% minimize x1+2x2+3x3
% subject to x1+x2+x3 = 1; x1,x2,x3 >= 0

% Part A: Draw a diagram that illustrates the geometry of the problem. 

% For readability, I am using x = x1, y = x2, and z = x3

function LP_GraphRep_partA
close all;
	
figure;
plot1 = gca;
% Converting the constraint into a function
syms f(x, y, z)
f(x, y, z) = x + y + z == 1;
syms g(x, y);
g(x, y) = solve(f(x, y, z), z);  
% Initializing the range that the x, y, z values can take
xrange = 0:1;
yrange = 0:1;
zrange = zeros(numel(xrange), numel(yrange));
% Computing the values of x, y, z corresponding to the initial constraint    
for i = 1:numel(yrange)
  for j = 1:numel(xrange) 
		a = g(xrange(j), yrange(i));
		zrange1(i, j) = double(a(1));
  end
end
%Plotting the initial constraint
surf(plot1, xrange,yrange,zrange1, 'FaceColor', 'green')
	
hold on %Used to have two plots on the same graph

% Creating the Obj Function subject to the given constraints
syms f(x, y, z)
f(x, y, z) = x + 2*y + 3*z ==1; % Constraint of Intersection
syms g(x, y);
g(x, y) = solve(f(x, y, z), z);  
% Initializing the range that the x,y,z values can take
xrange = 0:1;
yrange = 0:1;
zrange = zeros(numel(xrange), numel(yrange));
% Computing the values of x, y, z of the Obj Function
% given the initial constraints and the intersection constraint
for i = 1:numel(yrange)
  for j = 1:numel(xrange) 
		a = g(xrange(j), yrange(i));
		zrange1(i, j) = double(a(1));
  end
end
% Plotting Obj Function given the Constraints
surf(plot1, xrange, yrange, zrange1, 'FaceColor', 'red') 

% Customizing the overall graph 
xlim(0:1);
ylim(0:1);
zlim(0:1);
xlabel('x')
ylabel('y')
zlabel('z')
title({'Graphical Rep of LP Prob'; 'Min x_1+ 2x_2 +3x_3 Sub to x_1+ x_2 +x_3 = 1'}) 
end
