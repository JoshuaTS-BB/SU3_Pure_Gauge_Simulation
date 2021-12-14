function [V,errs] = jacknife(wils_dt1,wils_dt2)

Ndists=length(wils_dt1);
wil=wils_dt1(1);
wil=wil{1};
N=length(wil);

V=get_potential(wils_dt1,wils_dt2,0);

errs=zeros(Ndists,1);
bias=zeros(Ndists,1);
for i=1:N
    V_omit=get_potential(wils_dt1,wils_dt2,i);
    errs=errs+(N-1)/N*(V-V_omit).^2;
    bias=bias+V_omit/N;
end

errs=errs.^0.5;
V=V-(N-1)*(bias-V);

end

