function vars = block_correlation(v,Np,intersection)

N=size(v,1);
vars=zeros(floor(N/2),1);
vars(1)=var(v);

for K=2:floor(N/2)
    l=floor(N/K);
    av=zeros(l,1);
    for i=1:l
        av(i)=mean(v((i-1)*K+1:i*K));
    end
    vars(K)=var(av);
end

K_inv=(1:Np).^(-1);
K_inv=K_inv.*(vars(intersection)/K_inv(intersection));

hold on;
plot(vars(1:Np));
plot(K_inv(1:Np));
hold off;

end