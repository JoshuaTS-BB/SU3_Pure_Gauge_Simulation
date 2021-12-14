function V = get_potential(wils_dt1,wils_dt2,omit)

N=length(wils_dt1);

V=zeros(N,1);

for i=1:N
    wil=wils_dt1{i};
    n=length(wil);
    wil2=wils_dt2{i};

    V(i)=log(mean(wil([1:omit-1 omit+1:n]))/mean(wil2([1:omit-1 omit+1:n])));
end

end