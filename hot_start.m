function [config] = hot_start(Nx,Nt)
%HOT_START Creates a random initial gauge field configuration for the
%Markov chain
%
% Inputs:
%     Nx:     the number of lattice points to use for each spacial
%             dimension
%     Nt:     the number of lattice points to use for the time
%             dimension
%
% Outputs:
%     config: A cell array containing a gauge field configuration. To 
%             access the first row of a particular link variable matrix, 
%             use config(:,dir,n4,n3,n2,n1); where n1, n2, n3, and n4 are 
%             coordinates of the link; and dir=1,2,3,4 is the direction of 
%             the link.

config = zeros(Nx,Nx,Nx,Nt,4,9);

for nx=1:Nx
for ny=1:Nx
for nz=1:Nx
for nt=1:Nt
for dir=1:4
    config(nx,ny,nz,nt,dir,:)=rand_su3();
end
end
end
end
end

end

