function [p1] = plot_polykov(ensemble1,sep)

N=size(ensemble1);
p1=zeros(N(1),1);

for i=1:N(1)
    [1 i]
    p1(i)=polykov_loop_su3(ensemble1(i,:,:,:,:,:,:),N(4),N(5),sep);
end

plot(real(p1));

end

