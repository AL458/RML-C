%script to analize the differences in boost and behavior between RML and
%RML-C for the information seeking task

% dat1=spm_select(inf,'mat','select RML results');
% dat2=spm_select(inf,'mat','select RML_PI results');

close all
clc
Nsubj=30;

dat1=zeros(Nsubj,8);
dat2=dat1;

dat1(:,1:2)=importdata('../main_results/Inf_seeking_new_LIP/no_pred5b/LA.mat');
dat1(:,3:4)=importdata('../main_results/Inf_seeking_new_LIP/no_pred5b/opt.mat');
dat1(:,5:6)=importdata('../main_results/Inf_seeking_new_LIP/no_pred5b/stay.mat');
dat1(:,7:8)=importdata('../main_results/Inf_seeking_new_LIP/no_pred5b/V_box_sel.mat');

dat2(:,1:2)=importdata('../RML_PI_new_LIP/no_pred5b/LA.mat');
dat2(:,3:4)=importdata('../RML_PI_new_LIP/no_pred5b/opt.mat');
dat2(:,5:6)=importdata('../RML_PI_new_LIP/no_pred5b/stay.mat');
dat2(:,7:8)=importdata('../RML_PI_new_LIP/no_pred5b/V_box_sel.mat');




dat1b=[mean(dat1(:,1:2),2) mean(dat1(:,3:4),2) mean(dat1(:,5:6),2)];
dat2b=[mean(dat2(:,1:2),2) mean(dat2(:,3:4),2) mean(dat2(:,5:6),2)];



figure1=figure;
axes1 = axes('Parent',figure1);
h=barwitherr(std([dat1b(:,1) dat2b(:,1)],1)./sqrt(Nsubj),mean([dat1b(:,1) dat2b(:,1)],1));
ylim([50 80]);
xlim([0 3]);
set(axes1,'FontSize',20,'FontWeight','bold','XColor',[0 0 0],'XTick',[1 2],...
    'XTickLabel',{'RML','RML-C'},'YColor',[0 0 0],'ZColor',[0 0 0]);
ylabel('LIP activity (a.u.)','FontWeight','bold','FontSize',22);
set(h,'FaceColor',[0 0.45 0.74],'EdgeColor','none','LineWidth',3,'ShowBaseLine','off');

figure1=figure;
axes1 = axes('Parent',figure1);
h=barwitherr(100*std([dat1b(:,2) dat2b(:,2)],1)./sqrt(Nsubj),100*mean([dat1b(:,2) dat2b(:,2)],1));
ylim([80 100]);
xlim([0 3]);
set(axes1,'FontSize',20,'FontWeight','bold','XColor',[0 0 0],'XTick',[1 2],...
    'XTickLabel',{'RML','RML-C'},'YColor',[0 0 0],'ZColor',[0 0 0]);
ylabel('Correct choices (%)','FontWeight','bold','FontSize',22);
set(h,'FaceColor',[0 0.45 0.74],'EdgeColor','none','LineWidth',3,'ShowBaseLine','off');

figure1=figure;
axes1 = axes('Parent',figure1);
h=barwitherr(100*std([dat1b(:,3) dat2b(:,3)],1)./sqrt(Nsubj),100*(1-mean([dat1b(:,3) dat2b(:,3)],1)));
ylim([60 90]);
xlim([0 3]);
set(axes1,'FontSize',20,'FontWeight','bold','XColor',[0 0 0],'XTick',[1 2],...
    'XTickLabel',{'RML','RML-C'},'YColor',[0 0 0],'ZColor',[0 0 0]);
ylabel('Completion (%)','FontWeight','bold','FontSize',22);
set(h,'FaceColor',[0 0.45 0.74],'EdgeColor','none','LineWidth',3,'ShowBaseLine','off');

comp_plot([1:2;1:2]',[mean(dat2(:,[2,1]),1);mean(dat1(:,[2,1]),1)]',[std(dat2(:,[2,1]),1);std(dat1(:,[2,1]),1)]'/Nsubj^.5,'Activity (a.u.)','LIP');

comp_plot([1:2;1:2]',100*[mean(dat2(:,[4,3]),1);mean(dat1(:,[4,3]),1)]',100*[std(dat2(:,[4,3]),1);std(dat1(:,[4,3]),1)]'/Nsubj^.5,'Correct (%)','Correct resp');

comp_plot([1:2;1:2]',100*(1-[mean(dat2(:,[6,5]),1);mean(dat1(:,[6,5]),1)]'),100*[std(dat2(:,[6,5]),1);std(dat1(:,[6,5]),1)]'/Nsubj^.5,'Completion (%)','Completion');

comp_plot([1:2;1:2]',[mean(dat2(:,[8,7]),1);mean(dat1(:,[8,7]),1)]',[std(dat2(:,[8,7]),1);std(dat1(:,[8,7]),1)]'/Nsubj^.5,'Activity (a.u.)','Exp value');

%----Stats ----------------------------------------------------------

% disp('LIP Stats (RML-C > RML)')
% disp(' ')
% [h,p,ci,stats]=ttest2(dat2b(:,1),dat1b(:,1));
% disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)])
% disp(['p = ' num2str(p)])
% disp(' ')
% 
% disp('Correct choiches Stats (RML-C > RML)')
% disp(' ')
% [h,p,ci,stats]=ttest2(dat2b(:,2),dat1b(:,2));
% disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)])
% disp(['p = ' num2str(p)])
% disp(' ')
% 
% disp('Completion Stats (RML-C > RML)')
% disp(' ')
% [h,p,ci,stats]=ttest2(dat1b(:,3),dat2b(:,3));
% disp(['t(' num2str(stats.df) ') = ' num2str(stats.tstat)])
% disp(['p = ' num2str(p)])
% disp(' ')

disp('LIP stats ------------------')

tbl=simple_mixed_anova([dat2(:,1:2);dat1(:,1:2)],[ones(size(dat2(:,1:2),1),1);ones(size(dat1(:,1:2),1),1)+1],{'RW'},{'model'})

disp(' ')

disp('Correct choiches stat ------------------')

tbl=simple_mixed_anova([dat2(:,3:4);dat1(:,3:4)],[ones(size(dat2(:,3:4),1),1);ones(size(dat1(:,3:4),1),1)+1],{'RW'},{'model'})

disp(' ')

disp('Completion stats ------------------')

tbl=simple_mixed_anova([dat2(:,5:6);dat1(:,5:6)],[ones(size(dat2(:,5:6),1),1);ones(size(dat1(:,5:6),1),1)+1],{'RW'},{'model'})

disp(' ')


