function [n,dir] = choose_link(nx,nt,s)
%CHOOSE_LINK Chooses a random location and direction on the lattice
%
% Inputs:
%     nx:     the number of lattice points to use for each spacial
%             dimension
%     nt:     the number of lattice points to use for the time
%             dimension
%     s:      random stream

n=ones(4,1);
n(1)=round(randi(s,[1,nx]));
n(2)=round(randi(s,[1,nx]));
n(3)=round(randi(s,[1,nx]));
n(4)=round(randi(s,[1,nt]));
dir=round(randi(s,[1,4]));

end

