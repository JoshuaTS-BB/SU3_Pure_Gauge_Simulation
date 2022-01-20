function wils_dt = calc_wilson_loops(filename)

%num_proc=str2num(getenv('SLURM_NTASKS'));
%pool=parpool('local',num_proc);

%filename="ensemble_12x12_beta_5-7_cold_18-Jan-2022_14";
load("ensembles/12x12/"+filename+".mat","ensemble");
ensemble2(:,:,:,:,:,:,:)=ensemble(10:30:150,:,:,:,:,:,:);
clear ensemble

addpath("wilson_loops");

dti=4;
Ndt=2;
Ndx=5;

wils_dt=cell(1,Ndx*Ndt);
save("wilson_loops/wilson_loops_"+filename+".mat","wils_dt","Ndx","dti")

parfor i=1:Ndt*Ndx
    dx=mod(i,Ndx);
    if(dx==0) dx=Ndx; end
    dt=floor((i-1)/Ndx)+dti;
    [dx,dt]
    wils_dt(i)={plot_wilson(ensemble2,dx,dt)};
end

save("wilson_loops/wilson_loops_"+filename+".mat","wils_dt","Ndx","dti")

%delete(pool);

end
