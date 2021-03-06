function [u_new,trials] = metro_step(u,n,dir,neigh_idx,beta,s)
%METRO_STEP Generate the next link in a Markov chain using the metropolis
%algorithm
%
% Inputs:
%     u:      A cell array containing the previous configuration in the 
%             Markov chain. To access a particular link variable matrix, 
%             use u(n1,n2,n3,n4,dir); where n1, n2, n3, and n4 are 
%             coordinates of the link; and dir=1,2,3,4 is the direction of 
%             the link.
%     n:      the coordinates (in lattice units) of the link to change,
%             formatted as (x; y; z; t)
%     dir:    the direction (1, 2, 3, or 4) of the link to change
%     Nx:     the number of lattice points to use for each spacial
%             dimension
%     Nt:     the number of lattice points to use for the time
%             dimension
%     neigh_idx: a cell array containing the indices of all of the neighbor
%                links that need to be calculated for any given link
%     beta:       the beta parameter to use for the gauge action
%     s:      Random stream
%
% Outputs:
%     u_new:  A cell array containing a new field configuration. To 
%             access a particular link variable matrix, use 
%             u_new(n1,n2,n3,n4,dir); where n1, n2, n3, and n4 are 
%             coordinates of the link; and dir=1,2,3,4 is the direction of 
%             the link.

trials=0;
success=false;
[u_new,success]=change_link_su3(u,n,dir,neigh_idx,beta,s);
trials=trials+1;

end

