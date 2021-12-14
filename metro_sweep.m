function [u_new] = metro_sweep(u,Nx,Nt,neigh_idx,beta,i)
%METRO_SWEEP Sweep through every link in the lattice using the metropolis
%algorithm to generate a new field configuration
%algorithm
%
% Inputs:
%     u:      A cell array containing the previous configuration in the 
%             Markov chain. To access a particular link variable matrix, 
%             use u(n1,n2,n3,n4,dir); where n1, n2, n3, and n4 are 
%             coordinates of the link; and dir=1,2,3,4 is the direction of 
%             the link.
%     Nx:     the number of lattice points to use for each spacial
%             dimension
%     Nt:     the number of lattice points to use for the time
%             dimension
%     neigh_idx: a cell array containing the indices of all of the neighbor
%                links that need to be calculated for any given link
%     beta:       the beta parameter to use for the gauge action
%
% Outputs:
%     u_new:  A cell array containing a new field configuration. To 
%             access a particular link variable matrix, use 
%             u_new(n1,n2,n3,n4,dir); where n1, n2, n3, and n4 are 
%             coordinates of the link; and dir=1,2,3,4 is the direction of 
%             the link.

u_new=u;

trials=0;
for nx=1:Nx
    for ny=1:Nx
        for nz=1:Nx
            for nt=1:Nt
                [i,nx ny nz nt]
                for dir=1:4
                    [u_new,t]=metro_step(u_new,[nx ny nz nt],dir,neigh_idx,beta);
                    trials=trials+t;
                end
            end
        end
    end
end

%(trials/Nx^3/Nt/4)^(-1);

end
