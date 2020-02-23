%% Pivoting about the (p,q)th Element of the Given Matrix G.
function G_new=PIVOT(G,p,q)
% For speed purposes, let's reallocate memory for G_new by having
G_new = zeros(size(G));

for i=1:size(G,1)
    if i==p
           G_new(p,:)=G(p,:)/G(p,q);
    else
           G_new(i,:)=G(i,:)-G(p,:)*(G(i,q)/G(p,q));
    end 
end 
end