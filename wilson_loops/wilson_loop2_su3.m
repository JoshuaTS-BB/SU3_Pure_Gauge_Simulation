function [value] = wilson_loop2_su3(config,Nx,Nt,dx,dt)
%POLYKOV_LOOP_SU3 Compute the Wilson loop

value=0;

for nt_i=1:Nt
for ny=1:Nx
for nz=1:Nx
for nx=1:Nx
    
    P=[1 0 0; 0 1 0; 0 0 1];
    for nt=nt_i:(nt_i+dt-1)
        P=P*build_su3(config(1,nx,ny,nz,mod_plus(nt,Nt),4,:));
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    for ny_p=ny:(ny+dx-1)
        P=P*build_su3(config(1,nx,mod_plus(ny,Nx),nz,mod_plus(nt_i+dt,Nt),2,:));
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    P2=[1 0 0; 0 1 0; 0 0 1];
    for ny_p=ny:(ny+dx-1)
        P2=P2*build_su3(config(1,nx,mod_plus(ny,Nx),nz,nt_i,2,:));
        %build_su3(config(1,nx_p,ny,nz,1,1,:))
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    for nt=nt_i:(nt_i+dt-1)
        P2=P2*build_su3(config(1,nx,mod_plus(ny+dx,Nx),nz,mod_plus(nt,Nt),4,:));
        %build_su3(config(1,nx+dx,ny,nz,nt,4,:))
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    value=value+real(trace(P*ctranspose(P2)))/Nx^3/Nt/3;
    
end
end
end
end

end

