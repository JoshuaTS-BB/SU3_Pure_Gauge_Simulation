function [neighbor_index] = create_neighbor_index(Nx,Nt)
%CREATE_NEIGHBOR_INDEX Creates an array with the indices of the
%neighbors of each link in the lattice
%
% Inputs:
%     Nx:       the length of the spacial dimensions of the lattice (in
%               units of lattice spacing)
%     Nt:       the length of the time dimension of the lattice (in
%               units of lattice spacing)
%
% Outputs:
%     neighbor_index: an array containing the indices of all of the 
%                     neighbor links that need to be calculated for any 
%                     given link. To access the coordinates of the 18 link
%                     variables relavent to a particular stable, use
%                     neighbor_index(nx,ny,nz,nt,dir,:,:,:), where 
%                     [nx,ny,nz,nt] are the coordinates of the link, and
%                     dir=1,2,3,4 is the direction of the link.

neighbor_index=zeros(Nx,Nx,Nx,Nt,4,3,6,5);

dirs=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

for nx=1:Nx
    for ny=1:Nx
        for nz=1:Nx
            for nt=1:Nt
                for mu=1:4
                    dir=dirs(mu,:);
                    n=[nx ny nz nt];
                    
                    for pnu=1:3
                        if mu<=pnu
                            nu=pnu+1;
                        else
                            nu=pnu;
                        end
                        dirnu=dirs(nu,:);
                        
                        neighbor_index(nx,ny,nz,nt,mu,pnu,1,:)=[
                            apply_bound_cond(n+dir,Nx,Nt) nu];
                        neighbor_index(nx,ny,nz,nt,mu,pnu,2,:)=[
                            apply_bound_cond(n+dirnu,Nx,Nt) mu];
                        neighbor_index(nx,ny,nz,nt,mu,pnu,3,:)=[
                            n nu];
                        neighbor_index(nx,ny,nz,nt,mu,pnu,4,:)=[
                            apply_bound_cond(n+dir-dirnu,Nx,Nt) nu];
                        neighbor_index(nx,ny,nz,nt,mu,pnu,5,:)=[
                            apply_bound_cond(n-dirnu,Nx,Nt) mu];
                        neighbor_index(nx,ny,nz,nt,mu,pnu,6,:)=[
                            apply_bound_cond(n-dirnu,Nx,Nt) nu];
                    end
                end
            end
        end
    end
end

end

