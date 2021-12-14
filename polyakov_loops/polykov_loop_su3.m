function [value] = polykov_loop_su3(config,Nx,Nt,dist)
%POLYKOV_LOOP_SU3 Compute the Polykov loop correlator

value=0;

for nx=1:(Nx-1-dist)
for ny=1:(Nx-1-dist)
for nz=1:(Nx-1-dist)
    
    P=[1 0 0; 0 1 0; 0 0 1];
    for nt=1:Nt
        P=P*build_su3(config(1,nx,ny,nz,nt,4,:));
        %P=P*build_su3(config(:,4,nt,nz,ny,nx));
    end
    val1=trace(ctranspose(P));

    P=[1 0 0; 0 1 0; 0 0 1];
    for nt=1:Nt
        P=P*build_su3(config(1,nx+dist,ny,nz,nt,4,:));
        %P=P*build_su3(config(:,4,nt,nz,ny,nx+dist));
    end
    value=value+val1*trace(P)/(Nx-1-dist)^3/3;

    P=[1 0 0; 0 1 0; 0 0 1];
    for nt=1:Nt
        P=P*build_su3(config(1,nx,ny+dist,nz,nt,4,:));
        %P=P*build_su3(config(:,4,nt,nz,ny+dist,nx));
    end
    value=value+val1*trace(P)/(Nx-1-dist)^3/3;

    P=[1 0 0; 0 1 0; 0 0 1];
    for nt=1:Nt
        P=P*build_su3(config(1,nx,ny,nz+dist,nt,4,:));
        %P=P*build_su3(config(:,4,nt,nz+dist,ny,nx));
    end
    value=value+val1*trace(P)/(Nx-1-dist)^3/3;
    
end
end
end

end

