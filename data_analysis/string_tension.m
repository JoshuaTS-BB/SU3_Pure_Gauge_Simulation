function sigma = string_tension(dV,r0)
% Returns sigma in MeV/fm
% Should be around 900 MeV/fm for QCD
% beta=5.7 -> r0=2.922(9)

a=0.5e-15/r0;
Vm=dV/a;
Vev=Vm*1.9732705e-7;
VMeV=Vev/1e6;
afm=a*1e15;
sigma=VMeV/afm;

end

