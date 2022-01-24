function [ensemble] = markov_su3(Nx,Nt,beta,Nconfig,hot,initial_ensemble,idx)
%MARKOV_SU2 Create an ensemble of gauge field configurations for the
%group SU(2)
%
% Inputs:
%     Nx:         the number of lattice points to use for each spacial
%                 dimension
%     Nt:         the number of lattice points to use for the time
%                 dimension
%     beta:       the beta parameter to use for the gauge action
%     Nconfig:    the number of configurations to generate
%     hot:        true for a hot start and false otherwise
%     idx:        an index to distinguish this ensemble from other similar
%                 ones generated on the same day
%
% Outputs:
%     ensemble:   A cell array of gauge field configurations. To access the 
%                 first row of a particular link variable matrix, use 
%                 ensemble(config,n1,n2,n3,n4,dir,:); where config is the
%                 index of a particular configuration; n1, n2, n3, and n4
%                 are coordinates of the link; and dir=1,2,3,4 is the
%                 direction of the link.

filename="ensembles/ensemble_"+int2str(Nx)+"x"+int2str(Nt)+"_beta_" + ...
    int2str(floor(beta))+"-"+int2str(10*(beta-floor(beta)));

ensemble=zeros(Nconfig,Nx,Nx,Nx,Nt,4,9);
u=zeros(Nx,Nx,Nx,Nt,4,9);

neigh_idx=create_neighbor_index(Nx,Nt);

if hot
    filename=filename+"_hot";
else
    filename=filename+"_cold";
end

filename=filename+"_"+date+"_"+int2str(idx)+".mat";

s=RandStream('mt19937ar','Seed',Nx*Nt+floor(beta*10)+datenum(date)+7*idx);

N=0;
if initial_ensemble(1)~=false
    N=size(initial_ensemble);
    N=N(1);
    ensemble(1:N,:,:,:,:,:,:)=initial_ensemble(:,:,:,:,:,:,:);
    u(:,:,:,:,:,:)=ensemble(N,:,:,:,:,:,:);
elseif hot
    u = hot_start(Nx,Nt,s);
else
    u = cold_start(Nx,Nt);
end

for i=(N+1):Nconfig
    for j=1:2
        u = metro_sweep(u,Nx,Nt,neigh_idx,beta,s,(i-1)*2+j);
    end
    ensemble(i,:,:,:,:,:,:)=u;
    save(filename,"ensemble");
end

end
