function [V,errs,st,st_err] = jacknife(wils_dt1,wils_dt2)

Ndists=length(wils_dt1);
wil=wils_dt1(1);
wil=wil{1};
N=length(wil);

V=get_potential(wils_dt1,wils_dt2,0);
st=string_tension(mean([V(3)-V(2),V(4)-V(3)]),2.922);
%st=string_tension(V(3)-V(2),2.922);

errs=zeros(Ndists,1);
st_err=0;
bias=zeros(Ndists,1);
st_bias=0;
for i=1:N
    V_omit=get_potential(wils_dt1,wils_dt2,i);
    st_omit=string_tension(mean([V_omit(3)-V_omit(2),V_omit(4)-V_omit(3)]),2.922);
    %st_omit=string_tension(V_omit(3)-V_omit(2),2.922);
    st_err=st_err+(N-1)/N*(st-st_omit)^2;
    errs=errs+(N-1)/N*(V-V_omit).^2;
    bias=bias+V_omit/N;
    st_bias=st_bias+st_omit/N;
end

errs=errs.^0.5;
st_err=st_err^0.5;
V=V-(N-1)*(bias-V);
st=st-(N-1)*(st_bias-st);

end

