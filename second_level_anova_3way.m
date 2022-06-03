%anova analysis pred x rew Daddaoua et al., 2016

clear all
clc
dir1=spm_select(inf,'dir','select pred condition RML-C');
dir2=spm_select(inf,'dir','select no pred condition RML-C');

dir3=spm_select(inf,'dir','select pred condition RML');
dir4=spm_select(inf,'dir','select no pred condition RML');



disp('Analysis on NE output ------------------')


dat=importdata([dir1 'NE.mat']);
dat(:,3:4)=importdata([dir2 'NE.mat']);
dat(:,5:6)=importdata([dir3 'NE.mat']);
dat(:,7:8)=importdata([dir4 'NE.mat']);

datamix=zeros(length(dat)*2,2,2);
datamix(:,:,1)=[dat(:,1) dat(:,3);dat(:,5) dat(:,7)];%high RW
datamix(:,:,2)=[dat(:,2) dat(:,4);dat(:,6) dat(:,8)];%low RW

between_factor=zeros(length(dat)*2,1);
between_factor(length(dat)+1:end)=1;


[table,rm]=simple_mixed_anova(datamix,between_factor,{'Inf','RW'},{'Mode_Type'})
    
    



disp('Analysis on LA output ------------------')

dat=importdata([dir1 'LA.mat']);
dat(:,3:4)=importdata([dir2 'LA.mat']);
dat(:,5:6)=importdata([dir3 'LA.mat']);
dat(:,7:8)=importdata([dir4 'LA.mat']);

datamix=zeros(length(dat)*2,2,2);
datamix(:,:,1)=[dat(:,1) dat(:,3);dat(:,5) dat(:,7)];%high RW
datamix(:,:,2)=[dat(:,2) dat(:,4);dat(:,6) dat(:,8)];%low RW

between_factor=zeros(length(dat)*2,1);
between_factor(length(dat)+1:end)=1;


[table,rm]=simple_mixed_anova(datamix,between_factor,{'Inf','RW'},{'Mode_Type'})

disp('')

 
disp('Analysis on Stay responses------------------')
dat=importdata([dir1 'stay.mat']);
dat(:,3:4)=importdata([dir2 'stay.mat']);
dat(:,5:6)=importdata([dir3 'stay.mat']);
dat(:,7:8)=importdata([dir4 'stay.mat']);

datamix=zeros(length(dat)*2,2,2);
datamix(:,:,1)=[dat(:,1) dat(:,3);dat(:,5) dat(:,7)];%high RW
datamix(:,:,2)=[dat(:,2) dat(:,4);dat(:,6) dat(:,8)];%low RW

between_factor=zeros(length(dat)*2,1);
between_factor(length(dat)+1:end)=1;


[table,rm]=simple_mixed_anova(datamix,between_factor,{'Inf','RW'},{'Mode_Type'})

disp('')


disp('Analysis on Correct choices------------------')
dat=importdata([dir1 'opt.mat']);
dat(:,3:4)=importdata([dir2 'opt.mat']);
dat(:,5:6)=importdata([dir3 'opt.mat']);
dat(:,7:8)=importdata([dir4 'opt.mat']);

datamix=zeros(length(dat)*2,2,2);
datamix(:,:,1)=[dat(:,1) dat(:,3);dat(:,5) dat(:,7)];%high RW
datamix(:,:,2)=[dat(:,2) dat(:,4);dat(:,6) dat(:,8)];%low RW

between_factor=zeros(length(dat)*2,1);
between_factor(length(dat)+1:end)=1;


[table,rm]=simple_mixed_anova(datamix,between_factor,{'Inf','RW'},{'Mode_Type'})

disp('')


disp('Analysis on RW expectation ------------------')

dat=importdata([dir1 'V_box_sel.mat']);
dat(:,3:4)=importdata([dir2 'V_box_sel.mat']);
dat(:,5:6)=importdata([dir3 'V_box_sel.mat']);
dat(:,7:8)=importdata([dir4 'V_box_sel.mat']);

datamix=zeros(length(dat)*2,2,2);
datamix(:,:,1)=[dat(:,1) dat(:,3);dat(:,5) dat(:,7)];%high RW
datamix(:,:,2)=[dat(:,2) dat(:,4);dat(:,6) dat(:,8)];%low RW

between_factor=zeros(length(dat)*2,1);
between_factor(length(dat)+1:end)=1;


[table,rm]=simple_mixed_anova(datamix,between_factor,{'Inf','RW'},{'Mode_Type'})

disp('')