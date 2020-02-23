%% Simplex Method for Solving LinProg Prob: min c'x sub to Ax=b, x>=0
function [x,v]=SIMPLEX(c,A,b,v,options)
% Inputs/Arguments: 
%                   c = Coefficient vector corresponding to c'x
%                   A = Matrix corresponding to the constraint Ax=b 
%                   b = A Constant Vector
%               [A b] = The canonical form of Ax=b
%                   v = The vector of indices of the basic columns of A
%                          * v_i-th column of A is the i-th standard basis
%                            vector.
%             options : Parameters that indicate whether or not the results 
%                       will be displayed tabularly and how pivot element 
%                       of the alg. is selected.
%                          * If options(1) = 1, a tabular output of 
%                             results.
%                          * If options(1) = 0, no tabular output is shown.
%                          * If options(5) = 1, use Bland's Rule for
%                          pivoting.
%                          * If options(5) = 0, 
%                             ** q is the index that corresponds to the 
%                                most negative relative cost coefficient
%                                r_q.
%                             ** p is the index that mins  y_i0/y_iq.
%                                 *** If more than one index i mins 
%                                     y_i0/y_iq,let p be the smallest such 
%                                     index.
% Output:
%                   x = Solution
%                       OR 
%                   x = Solution
%                   v = The vector of indices of the basic columns of A

format compact;
%format short e; %converts values w/ long decimals into scientific notation
options = foptions(options);
display = options(1);
n=length(c); % number of coefficients corresponding to c'x
m=length(b); % number of basic columns in A (and number rows in b)
c_B=c(v(:)); % cost vector corresponding to the basis B
r = c'-c_B'*A; % row vector of relative cost coefficients
cost = -c_B'*b;
tableau=[A b;r cost]; %Matrix that is a tabular rep. of the problem

% If display = option(1) = 1, display a tabular version of the LP prob.
if display      
   disp(' '); 
   disp('Initial tableau:');
   disp(tableau);
end 

% While r_j <0 for all j (if r_j >=0 for all j, the current basic solution
% is optimal)
while ones(1,n)*(r' >= zeros(n,1)) ~= n
      if options(5) == 0 % Selecting an index q s.t. r_q<0
         [r_q,q] = min(r);
      else % Use Bland's Rule
              q=1;
         while r(q) >= 0
               q=q+1; 
          end
      end 
         min_ratio = inf;  % If the above if-else statements aren't met,   
         p=0;              % y_iq=<0. Hence, p=0. This is very bad.

% However, if the above if-else statements are met, we can calculate p.
      for i=1:m
          if tableau(i,q)>0
             if tableau(i,n+1)/tableau(i,q) < min_ratio
                min_ratio = tableau(i,n+1)/tableau(i,q);
                p = i; 
             end 
         end 
     end

%  But, again if p = 0 (NO y_iq>0), we must stop b/c prob is unbounded.
     if p == 0
              disp('Problem unbounded');
        break;
    end 
       tableau=pivot(tableau,p,q); % Update Tableau given new pair of (p,q)
       
%   Go back to the initial step displaying the new Tableau and repeat the
%   process given better/updated row vector of relative cost coefficients, 
%   r, and  p index of v (q-th column of the basis enters the basis and 
%   the p-th column leaves). 
    if display
            disp('Pivot point:');
            disp([p,q]);
            disp('New tableau:');
            disp(tableau);
    end 
        v(p) = q;
        r = tableau(m+1,1:n); 
end
% Getting Solution x
x=zeros(n,1);
x(v(:))=tableau(1:m,n+1);
end
  