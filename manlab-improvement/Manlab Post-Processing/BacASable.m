f1 = figure(1);
plot([0 1],[0 1],'b');

f2 = figure(2);
plot([0 1],[0.25 0.75],'r')
% ax2 = axes('Parent',f,'Units','normalized','OuterPosition',[.1 .1 .1 .2]);
f3 = figure(3);
plot([0.5 1],[0.1 0.2],'g')
% ax3 = axes('Parent',f,'Units','normalized','OuterPosition',[.2 .1 .1 .2]);

ax1 = f1.Children;
% ax1 = axes('Parent',f,'Units','normalized','OuterPosition',[0 .3 1 .7]);

ftot = figure('Units','normalized','OuterPosition',[0 0.06 1 0.94]);
copyobj(ax1,ftot);
set(ax1,'OuterPosition',[.1 .1 .1 .2])

ax1cc = copyobj(ax1,ftot);
set(ax1cc,'OuterPosition',[.2 .1 .1 .2])

