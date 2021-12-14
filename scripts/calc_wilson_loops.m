%num_proc=str2num(getenv('SLURM_NTASKS'));
%pool=parpool('local',num_proc);

filename="ensemble_12x12_beta_5-7_cold_09-Nov-2021_1";
load("ensembles/"+filename+".mat");
ensemble2(:,:,:,:,:,:,:)=ensemble(5:5:500,:,:,:,:,:,:);

addpath("wilson_loops");

dts=4:5;
Ndt=length(dts);
Ndx=7;

wils_dt=cell(1,Ndx*Ndt);
save("wilson_loops/wilson_loops_"+filename+".mat","wils_dt","Ndx","dts")

parfor i=1:Ndt*Ndx
    dx=mod(i,Ndx);
    if(dx==0) dx=Ndx; end
    dt=floor(i/Ndx)+1;
    wils_dt(i)={plot_wilson(ensemble2,dx,dt)};
end

save("wilson_loops/wilson_loops_"+filename+".mat","wils_dt","Ndx","dts")

delete(pool);
