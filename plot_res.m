function plot_res(XMatrix1, YMatrix1, DMatrix1)
%CREATEFIGURE(XMatrix1, YMatrix1, DMatrix1)
%  XMATRIX1:  errorbar x matrix data
%  YMATRIX1:  errorbar y matrix data
%  DMATRIX1:  errorbar delta matrix data

%  Auto-generated by MATLAB on 28-Nov-2019 17:36:11

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple error bars using matrix input to errorbar
errorbar1 = errorbar(XMatrix1,YMatrix1,DMatrix1,'LineWidth',6);
set(errorbar1(1),'DisplayName','Inf','Color',[1 0 0]);
set(errorbar1(2),'DisplayName','unInf','Color',[0 0 1]);

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0.7 2.3]);
% Set the remaining axes properties
set(axes1,'FontSize',20,'FontWeight','bold','XTick',[1 2],'XTickLabel',...
    {'r','R'});
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'EdgeColor',[1 1 1]);
xlim([.7 2.3])

