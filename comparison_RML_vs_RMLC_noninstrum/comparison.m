%this script compares RML and RML_PI VTA modules in curiosity task (Daddaoua et al., 2016)
clc
close all
% clear all


b_RML=importdata('boost_RML.mat');
b_RMLPI=importdata('boost_RMLPI.mat');

u_RML=importdata('uncover_RML.mat');
u_RMLPI=importdata('uncover_RMLPI.mat');

VPI_RML=importdata('VPIdiff_RML.mat');
VPI_RMLPI=importdata('VPIdiff_RMLPI.mat');


%plot2

comp_plot([1:3;1:3]', 100*[mean(u_RMLPI(:,[3 2 1]),1);mean(u_RML(:,[3 2 1]),1)]', 100*[std(u_RMLPI(:,[3 2 1]),1)/length(u_RMLPI).^.5; std(u_RML(:,[3 2 1]),1)/length(u_RML).^.5]','Uncover (%)','Uncover');

comp_plot([1:3;1:3]', [mean(b_RMLPI(:,[3 2 1]),1);mean(b_RML(:,[3 2 1]),1)]', [std(b_RMLPI(:,[3 2 1]),1)/length(b_RMLPI).^.5; std(b_RML(:,[3 2 1]),1)/length(b_RML).^.5]','Boost (a.u.)','DA and NE boosting');
% 
comp_plot([1:3;1:3]', [mean(VPI_RMLPI(:,[3 2 1]),1);mean(VPI_RML(:,[3 2 1]),1)]', [std(VPI_RMLPI(:,[3 2 1]),1)/length(VPI_RMLPI).^.5; std(VPI_RML(:,[3 2 1]),1)/length(VPI_RML).^.5]','Value (a.u.)','Value of uncover decision');

% figure1 = figure;
% % Create axes
% axes1 = axes('Parent',figure1);
% hold(axes1,'on');
% errnorm=size(VPI_RML,1).^.5;
% VPI_bar=[mean(VPI_RMLPI(:,1)) mean(VPI_RML(:,1));mean(VPI_RMLPI(:,2)) mean(VPI_RML(:,2));mean(VPI_RMLPI(:,3)) mean(VPI_RML(:,3))];
% VPI_err=[std(VPI_RMLPI(:,1)) std(VPI_RML(:,1));mean(VPI_RMLPI(:,2)) mean(VPI_RML(:,2));mean(VPI_RMLPI(:,3)) mean(VPI_RML(:,3))]./errnorm;
% barwitherr(VPI_err, VPI_bar);
% % Create ylabel
% ylabel('Value (a.u.)','FontWeight','bold','FontSize',20);
% % Create xlabel
% xlabel('Rw prob at Cue1','FontWeight','bold','FontSize',20);
% % Create title
% title('Value of decision to uncover');
% % Uncomment the following line to preserve the X-limits of the axes
% % xlim(axes1,[0.7 3.2]);
% box(axes1,'on');
% % Set the remaining axes properties
% set(axes1,'FontSize',20,'FontWeight','bold','XTick',[1 2 3],'XTickLabel',...
%     {'1','.5','0'});
% % Create legend
% legend1 = legend(axes1,'show');
% set(legend1,'EdgeColor',[1 1 1]);
% 
% 
% 
% figure1 = figure;
% % Create axes
% axes1 = axes('Parent',figure1);
% hold(axes1,'on');
% errnorm=size(VPI_RML,1).^.5;
% VPI_bar=[mean(VPI_RMLPI(:,1)) mean(VPI_RML(:,1));mean(VPI_RMLPI(:,2)) mean(VPI_RML(:,2));mean(VPI_RMLPI(:,3)) mean(VPI_RML(:,3))];
% VPI_err=[std(VPI_RMLPI(:,1)) std(VPI_RML(:,1));mean(VPI_RMLPI(:,2)) mean(VPI_RML(:,2));mean(VPI_RMLPI(:,3)) mean(VPI_RML(:,3))]./errnorm;
% barwitherr(VPI_err, VPI_bar);
% % Create ylabel
% ylabel('Activity (a.u.)','FontWeight','bold','FontSize',20);
% % Create xlabel
% xlabel('Rw prob at Cue1','FontWeight','bold','FontSize',20);
% % Create title
% title('DA and NE boost');
% % Uncomment the following line to preserve the X-limits of the axes
% % xlim(axes1,[0.7 3.2]);
% box(axes1,'on');
% % Set the remaining axes properties
% set(axes1,'FontSize',20,'FontWeight','bold','XTick',[1 2 3],'XTickLabel',...
%     {'1','.5','0'});
% % Create legend
% legend1 = legend(axes1,'show');
% set(legend1,'EdgeColor',[1 1 1]);


%Stats ------------------------------------------------------------

 
disp('-------- Uncover --------------------');
disp(' ');

tbl=simple_mixed_anova([u_RMLPI;u_RML],[ones(size(u_RMLPI,1),1);ones(size(u_RML,1),1)+1],{'Rw_Prob_Cue1'},{'model'})

[h,p,CI,stats]=ttest2(u_RMLPI(:,1),u_RML(:,1));

disp('RMLPI > RML for Cue1=1 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);

[h,p,CI,stats]=ttest2(u_RMLPI(:,2),u_RML(:,2));

disp('RMLPI > RML for Cue1=.5 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);


[h,p,CI,stats]=ttest2(u_RMLPI(:,3),u_RML(:,3));

disp('RMLPI > RML for Cue1=0 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);

[h,p,CI,stats]=ttest(u_RMLPI(:,2),u_RMLPI(:,1));

disp('RMLPI, Cue1=.5 > Cue1=1 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);


disp('-------- Boost --------------------');
disp(' ');

tbl=simple_mixed_anova([b_RMLPI;b_RML],[ones(size(b_RMLPI,1),1);ones(size(b_RML,1),1)+1],{'Rw_Prob_Cue1'},{'model'})

[h,p,CI,stats]=ttest2(b_RMLPI(:,1),b_RML(:,1));

disp('RMLPI > RML for Cue1=1 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);

[h,p,CI,stats]=ttest2(b_RMLPI(:,2),b_RML(:,2));

disp('RMLPI > RML for Cue1=.5 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);


[h,p,CI,stats]=ttest2(b_RMLPI(:,3),b_RML(:,3));

disp('RMLPI > RML for Cue1=0 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);

[h,p,CI,stats]=ttest(b_RMLPI(:,2),b_RMLPI(:,1));

disp('RMLPI, Cue1=.5 > Cue1=1 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);


disp('-------- Policy value --------------------');
disp(' ');

tbl=simple_mixed_anova([VPI_RMLPI;VPI_RML],[ones(size(VPI_RMLPI,1),1);ones(size(VPI_RML,1),1)+1],{'Rw_Prob_Cue1'},{'model'})

[h,p,CI,stats]=ttest2(VPI_RMLPI(:,1),VPI_RML(:,1));

disp('RMLPI > RML for Cue1=1 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);

[h,p,CI,stats]=ttest2(VPI_RMLPI(:,2),VPI_RML(:,2));

disp('RMLPI > RML for Cue1=.5 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);


[h,p,CI,stats]=ttest2(VPI_RMLPI(:,3),VPI_RML(:,3));

disp('RMLPI > RML for Cue1=0 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);





