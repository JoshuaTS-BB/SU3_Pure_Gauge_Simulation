%load('ensembles/ensemble_12x12_beta_5-7_cold_.mat')
%ensemble2(:,:,:,:,:,:,:)=ensemble(150,:,:,:,:,:,:);
%clear ensemble;
ensemble=markov_su3(5,5,5.7,50,false,false,1);