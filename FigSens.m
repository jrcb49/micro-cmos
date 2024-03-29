clearvars
close all
load('Sensitivity.mat')

f1 = figure( 'Units', 'normalized', 'Position', [0.1 0.25 0.5 0.45] );

x1 = olddev(:,1);
x1 = [x1,x1];
y1 = olddev(:,2:3);
err1 = olddev(:, 4:5);

x2 = newdev(:,1);
x2 = [x2,x2];
y2 = newdev(:,2:3);
err2 = newdev(:, 4:5);

x = [x1, x2];
y = [y1, y2];
err = [err1, err2];

y_diff = [olddev_diff(:, 2), newdev_diff(:, 2)];
err_diff = [olddev_diff(:, 3), newdev_diff(:, 3)];

dash_l1a = plot(newdev(:,1), newdev(:,2), 's-' ,...
    'Color', [0 0.4470 0.7410],...
    'MarkerSize', 15, 'MarkerFaceColor', [0 0.4470 0.7410]);
hold on
dash_l2a = plot(newdev(:,1), newdev(:,3), '^-' ,...
    'Color', [0 0.4470 0.7410],...
    'MarkerSize', 15, 'MarkerFaceColor', [0 0.4470 0.7410]);
dash_l3a = plot(olddev(:,1), olddev(:,2), 's-' ,...
    'Color', [0.8500 0.3250 0.0980],...
    'MarkerSize', 15, 'MarkerFaceColor', [0.8500 0.3250 0.0980]);
dash_l4a = plot(olddev(:,1), olddev(:,3), '^-' ,...
    'Color', [0.8500 0.3250 0.0980],...
    'MarkerSize', 15, 'MarkerFaceColor', [0.8500 0.3250 0.0980]);

eb_l = errorbar(x,y, err, 's', 'LineWidth', 5,...
    'Marker', 'none','Color', [0.6 0.6 0.6]);
uistack(eb_l, 'bottom')

set(get(get(eb_l(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(eb_l(2),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(eb_l(3),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(eb_l(4),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

lgd = legend({'New Device POF', 'New Device PWF',...
    'Previous Device POF', 'Previous Device PWF'});
lgd.Location = 'best';
lgd.FontSize = 12;

xlim([-0.25, 12.25])
xlabel('Light power density (\muW / cm^2)')

ylim([-500, 16000])
ylabel('Device pixel value (DN)')

set(gca,'FontSize', 24)
set(gca,'LineWidth', 2)
title('Sensitivity Comparison')
legend boxoff
set(gca, 'Position', [0.15 0.2 0.82 0.7])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f1 = figure( 'Units', 'normalized', 'Position', [0.1 0.25 0.5 0.45] );

dash_l1b = plot(newdev_diff(:,1), newdev_diff(:,2), 'd-' ,...
    'Color', [0 0.4470 0.7410],...
    'MarkerSize', 15, 'MarkerFaceColor', [0 0.4470 0.7410]);
hold on
dash_l3b = plot(olddev_diff(:,1), olddev_diff(:,2), 'd-' ,...
    'Color', [0.8500 0.3250 0.0980],...
    'MarkerSize', 15, 'MarkerFaceColor', [0.8500 0.3250 0.0980]);

eb_l = errorbar(x1,y_diff, err_diff, 's', 'LineWidth', 5,...
    'Marker', 'none','Color', [0.6 0.6 0.6]);
uistack(eb_l, 'bottom')


set(get(get(eb_l(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(eb_l(2),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

lgd = legend({'New Device (difference)', 'Previous Device (difference)'});
lgd.Location = 'best';

xlim([-0.25, 4.25])
xlabel('Light power density (\muW / cm^2)')

ylim([-500, 12000])
ylabel('Device pixel value (DN)')

set(gca,'FontSize', 24)
set(gca,'LineWidth', 2)
title('Sensitivity Comparison (Difference)')
legend boxoff
set(gca, 'Position', [0.15 0.2 0.81 0.7])