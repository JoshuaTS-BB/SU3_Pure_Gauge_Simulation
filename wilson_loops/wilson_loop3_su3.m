function [value] = wilson_loop_su3(config,Nx,Nt,dx,dt)
%WILSON_LOOP_SU3 Compute the Wilson loop

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
    
    for nx_p=nx:(nx+dx-1)
        P=P*build_su3(config(1,mod_plus(nx_p,Nx),ny,nz,mod_plus(nt_i+dt,Nt),1,:));
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    P2=[1 0 0; 0 1 0; 0 0 1];
    for nx_p=nx:(nx+dx-1)
        P2=P2*build_su3(config(1,mod_plus(nx_p,Nx),ny,nz,nt_i,1,:));
        %build_su3(config(1,nx_p,ny,nz,1,1,:))
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    for nt=nt_i:(nt_i+dt-1)
        P2=P2*build_su3(config(1,mod_plus(nx+dx,Nx),ny,nz,mod_plus(nt,Nt),4,:));
        %build_su3(config(1,nx+dx,ny,nz,nt,4,:))
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    value=value+real(trace(P*ctranspose(P2)))/Nx^3/Nt/3;
    

    
    P=[1 0 0; 0 1 0; 0 0 1];
    for nt=nt_i:(nt_i+dt-1)
        P=P*build_su3(config(1,nx,ny,nz,mod_plus(nt,Nt),4,:));
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    for ny_p=ny:(ny+dx-1)
        P=P*build_su3(config(1,nx,mod_plus(ny_p,Nx),nz,mod_plus(nt_i+dt,Nt),2,:));
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    P2=[1 0 0; 0 1 0; 0 0 1];
    for ny_p=ny:(ny+dx-1)
        P2=P2*build_su3(config(1,nx,mod_plus(ny_p,Nx),nz,nt_i,2,:));
        %build_su3(config(1,nx_p,ny,nz,1,1,:))
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    for nt=nt_i:(nt_i+dt-1)
        P2=P2*build_su3(config(1,nx,mod_plus(ny+dx,Nx),nz,mod_plus(nt,Nt),4,:));
        %build_su3(config(1,nx+dx,ny,nz,nt,4,:))
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    value=value+real(trace(P*ctranspose(P2)))/Nx^3/Nt/3;
    
    
    
    P=[1 0 0; 0 1 0; 0 0 1];
    for nt=nt_i:(nt_i+dt-1)
        P=P*build_su3(config(1,nx,ny,nz,mod_plus(nt,Nt),4,:));
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    for nz_p=nz:(nz+dx-1)
        P=P*build_su3(config(1,nx,ny,mod_plus(nz_p,Nx),mod_plus(dt+nt_i,Nt),3,:));
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    P2=[1 0 0; 0 1 0; 0 0 1];
    for nz_p=nz:(nz+dx-1)
        P2=P2*build_su3(config(1,nx,ny,mod_plus(nz_p,Nx),nt_i,3,:));
        %build_su3(config(1,nx_p,ny,nz,1,1,:))
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    for nt=nt_i:(nt_i+dt-1)
        P2=P2*build_su3(config(1,nx,ny,mod_plus(nz+dx,Nx),mod_plus(nt,Nt),4,:));
        %build_su3(config(1,nx+dx,ny,nz,nt,4,:))
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    
    value=value+real(trace(P*ctranspose(P2)))/Nx^3/Nt/3;
    
end
end
end
end

% Divide by color charge
value=value/3;

end

