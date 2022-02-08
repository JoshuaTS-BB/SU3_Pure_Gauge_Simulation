function p = plot_wilson(ensemble,dx,dt,idx)

N=size(ensemble);
p=zeros(N(1),1);

for i=1:N(1)
    [idx, dx, dt, i]
    w=wilson_loop_su3(ensemble(i,:,:,:,:,:,:),N(4),N(5),dx,dt);
    p(i)=w;
end

plot(real(p));

end