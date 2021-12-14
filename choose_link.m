function [n,dir] = choose_link(nx,nt)
%CHOOSE_LINK Chooses a random location and direction on the lattice
%
% Inputs:
%     nx:     the number of lattice points to use for each spacial
%             dimension
%     nt:     the number of lattice points to use for the time
%             dimension

n=ones(4,1);
n(1)=round(randi([1,nx]));
n(2)=round(randi([1,nx]));
n(3)=round(randi([1,nx]));
n(4)=round(randi([1,nt]));
dir=round(randi([1,4]));

end

