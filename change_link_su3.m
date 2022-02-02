function [new_u,success] = change_link_su3(u,n,dir,neigh_idx,beta,s)
%CHANGE_LINK_SU3 Creates a new configuration by changing a single link
%
% Inputs:
%     u:      A cell array containing the configuration to be change. To 
%             access a particular link variable matrix, use 
%             u(n1,n2,n3,n4,dir); where n1, n2, n3, and n4 are coordinates 
%             of the link; and dir=1,2,3,4 is the direction of the link.
%     n:      the coordinates (in lattice units) of the link to change,
%             formatted as (x; y; z; t)
%     dir:    the direction (1, 2, 3, or 4) of the link to change
%     neigh_idx: a cell array containing the indices of all of the neighbor
%                links that need to be calculated for any given link
%     beta:   the beta parameter to use for the gauge action
%     s:      Random stream
%
% Outputs:
%     u_new:  A cell array containing a new field configuration changed by
%             one link. To access a particular link variable matrix, use 
%             u_new(n1,n2,n3,n4,dir); where n1, n2, n3, and n4 are 
%             coordinates of the link; and dir=1,2,3,4 is the direction of 
%             the link.

new_u=u;
success=false;

staple=staple(u,n,dir,neigh_idx)));

u_dir_n=build_su3(u(n(1),n(2),n(3),n(4),dir,:));


for i=1:10
    u_dir_n_new=get_X_su3(s)*u_dir_n;

    % N=3 for SU(3)
    N=3;
    deltaS=-beta/N*real(trace((u_dir_n_new-u_dir_n)*staple;

    if exp(-deltaS)>=random(0,1,s)
        success=true;
        u_dir_n=u_dir_n_new;
    end
end

new_u(n(1),n(2),n(3),n(4),dir,:)=u_dir_n(:);

end

