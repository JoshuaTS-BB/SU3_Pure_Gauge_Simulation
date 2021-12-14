function [nbnd] = apply_bound_cond(n,Nx,Nt)
%APPLY_BOUND_COND Applies periodic boundary conditions to the location n
%
% Inputs:
%     n:      coordinates (in lattice units), formatted as (x; y; z; t)
%     Nx:     the number of lattice points to use for each spacial
%             dimension
%     Nt:     the number of lattice points to use for the time
%             dimension
%
% Outputs:
%     nbnd:   coordinates (in lattice units) after the boundary conditions
%             are applied

nbnd=n;

if(n(1)==Nx+1)
    nbnd(1)=1;
elseif(n(1)==0)
    nbnd(1)=Nx;
end

if(n(2)==Nx+1)
    nbnd(2)=1;
elseif(n(2)==0)
    nbnd(2)=Nx;
end

if(n(3)==Nx+1)
    nbnd(3)=1;
elseif(n(3)==0)
    nbnd(3)=Nx;
end

if(n(4)==Nt+1)
    nbnd(4)=1;
elseif(n(4)==0)
    nbnd(4)=Nt;
end

end

