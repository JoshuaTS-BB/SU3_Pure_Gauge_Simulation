function [value] = staple(u,n,dir,neigh_idx)
%STAPLES Calucalte the staple of the given link
%
% Inputs:
%     u:         A cell array containing the gauge field configuration. To 
%                access a particular link variable matrix, use 
%                u(n1,n2,n3,n4,dir); where n1, n2, n3, and n4 are 
%                coordinates of the link; and dir=1,2,3,4 is the direction 
%                of the link.
%     n:         the coordinates (in lattice units) of the link whose 
%                staple is to be calulated, formatted as (x; y; z; t)
%     dir:       the direction (1,2,3, or 4) of the link whose staple is to 
%                be calulated
%     neigh_idx: a cell array containing the indices of all of the neighbor
%                links that need to be calculated for any given link

value=0;

% pnu is not the actual nu value. It is equal to nu if mu>pnu. Otherwise,
% it is equal to nu-1
for pnu=1:3
    % coords=[apply_bound_cond(n+dirmu,Nx,Nt) nu]
    coords=neigh_idx(n(1),n(2),n(3),n(4),dir,pnu,1,:);
    u1=build_su3(u(coords(1),coords(2),coords(3),coords(4),coords(5),:));
    
    % coords=[apply_bound_cond(n+dirnu,Nx,Nt) mu];
    coords=neigh_idx(n(1),n(2),n(3),n(4),dir,pnu,2,:);
    u2=build_su3(u(coords(1),coords(2),coords(3),coords(4),coords(5),:));
    
    % coods=[n nu];
    coords=neigh_idx(n(1),n(2),n(3),n(4),dir,pnu,3,:);
    u3=build_su3(u(coords(1),coords(2),coords(3),coords(4),coords(5),:));
    
    % coords=[apply_bound_cond(n+dir-dirnu,Nx,Nt) nu];
    coords=neigh_idx(n(1),n(2),n(3),n(4),dir,pnu,4,:);
    u4=build_su3(u(coords(1),coords(2),coords(3),coords(4),coords(5),:));
    
    % coords=[apply_bound_cond(n-dirnu,Nx,Nt) mu];
    coords=neigh_idx(n(1),n(2),n(3),n(4),dir,pnu,5,:);
    u5=build_su3(u(coords(1),coords(2),coords(3),coords(4),coords(5),:));
    
    % coords=[apply_bound_cond(n-dirnu,Nx,Nt) nu]
    coords=neigh_idx(n(1),n(2),n(3),n(4),dir,pnu,6,:);
    u6=build_su3(u(coords(1),coords(2),coords(3),coords(4),coords(5),:));
    
    value = value + u1*ctranspose(u2)*ctranspose(u3) + ...
        ctranspose(u4)*ctranspose(u5)*u6;
end

end

