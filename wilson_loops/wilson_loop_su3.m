function [value] = wilson_loop_su3(config,Nx,Nt,dx,dx2)
%WILSON_LOOP_SU3 Compute the Wilson loop

value=0;

for nt=1:Nt
for ny=1:Nx
for nz=1:Nx
for nx=1:Nx
    
    ni=[nx ny nz nt];
    n1s=[nx+dx, ny, nz, nt;
        nx, ny+dx, nz, nt;
        nx, ny, nz+dx, nt;
        nx, ny, nz, nt+dx];
    n2s=[nx+dx2, ny, nz, nt;
        nx, ny+dx2, nz, nt;
        nx, ny, nz+dx2, nt;
        nx, ny, nz, nt+dx2];
    
    for dim1=1:4
        for dim2=1:4
            if dim1==dim2
                continue;
            end
            P=wilson_line(config,ni,dim1,dx,Nx,Nt) * ...
                wilson_line(config,n1s(dim1,:),dim2,dx2,Nx,Nt);
        
            P2=wilson_line(config,ni,dim2,dx2,Nx,Nt) * ...
                wilson_line(config,n2s(dim2,:),dim1,dx,Nx,Nt);
        
            value=value+real(trace(P*ctranspose(P2)))/Nx^3/Nt/4/3;
        end
    end
    
end
end
end
end

% Divide by color charge
value=value/3;

end

