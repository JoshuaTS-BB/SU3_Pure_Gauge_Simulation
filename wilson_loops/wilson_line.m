function mat = wilson_line(config,x,dim,dist,Nx,Nt)
% Wilson line starting at position x, going in direction dim, for distance
% dist, on a lattice of size Nx^3 x Nt with periodic boundary conditions.

mat=[1 0 0; 0 1 0; 0 0 1];

for i=1:dist
   mat=mat*build_su3(config(1,mod_plus(x(1),Nx),mod_plus(x(2),Nx),mod_plus(x(3),Nx),mod_plus(x(4),Nt),dim,:));
   x(dim)=x(dim)+1;
end

end

