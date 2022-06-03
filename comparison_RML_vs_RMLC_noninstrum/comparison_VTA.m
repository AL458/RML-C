%this script compares RML and RML_PI VTA modules in curiosity task (Daddaoua et al., 2016)

VTA_RML=importdata('VTA_RML.mat');
VTA_RMLPI=importdata('VTA_RMLPI.mat');


%plot1
figure2=figure;
axes1 = axes('Parent',figure2);
h=barwitherr([std(VTA_RML(:,2))/length(VTA_RML).^.5; std(VTA_RMLPI(:,2))/length(VTA_RMLPI).^.5],[mean(VTA_RML(:,2));mean(VTA_RMLPI(:,2))]);
ylim([0.5 1.3]);
xlim([0 3]);
set(axes1,'FontSize',20,'FontWeight','bold','XColor',[0 0 0],'XTick',[1 2],...
    'XTickLabel',{'RML','RML-C'},'YColor',[0 0 0],'ZColor',[0 0 0]);
ylabel('Activity (a.u.)','FontWeight','bold','FontSize',22);
set(h,'FaceColor',[0 0.45 0.74],'EdgeColor','none','LineWidth',3,'ShowBaseLine','off');

%plot2
VTA_comp_plot([1:3;1:3]', [mean(VTA_RML,1);mean(VTA_RMLPI,1)]', [std(VTA_RML,1)/length(VTA_RML).^.5; std(VTA_RMLPI,1)/length(VTA_RMLPI).^.5]');



%Stats ------------------------------------------------------------

 
[h,p,CI,stats]=ttest2(VTA_RMLPI(:,1),VTA_RML(:,1));

disp('RMLPI > RML for Cue1=1 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);



[h,p,CI,stats]=ttest2(VTA_RMLPI(:,2),VTA_RML(:,2));

disp('RMLPI > RML for Cue1=.5 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);


[h,p,CI,stats]=ttest2(VTA_RMLPI(:,3),VTA_RML(:,3));

disp('RMLPI > RML for Cue1=0 ---------')
disp(' ');
disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)]);
disp(['p = ' num2str(p)]);