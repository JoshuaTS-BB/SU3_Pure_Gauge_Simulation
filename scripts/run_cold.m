%load('ensembles/ensemble_12x12_beta_5-7_cold__p_100-105.mat')
%ensemble2(:,:,:,:,:,:,:)=ensemble(1:5,:,:,:,:,:,:);
%clear ensemble;
markov_su3(5,5,5.7,50,false,false);