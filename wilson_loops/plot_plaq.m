function p1 = plot_plaq(ensemble1)

N=size(ensemble1);
p1=zeros(N(1),1);

for i=1:N(1)
    p1(i)=average_plaquette_su3(ensemble1(i,:,:,:,:,:,:),N(4),N(5));
    [1 i]
end

plot(real(p1));

end

