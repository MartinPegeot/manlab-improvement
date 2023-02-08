scores = [444 460 380 
          387 366 500 
          365 451 611 
          548 412 452];

strikes = [9  6  5  
           6  4  8 
           4  7  16  
           10 9  8];
     
t = tiledlayout(3,3);

% Team 1
nexttile
plot([1 2 3 4],strikes(:,1),'-o')
title('Team 1 Strikes')

% Team 2
nexttile
plot([1 2 3 4],strikes(:,2),'-o')
title('Team 2 Strikes')

% Team 3
nexttile
plot([1 2 3 4],strikes(:,3),'-o')
title('Team 3 Strikes')

nexttile([2 3]);
bar([1 2 3 4],scores)
legend('Team 1','Team 2','Team 3','Location','northwest')

% Configure ticks and axis labels
xticks([1 2 3 4])
xlabel('Game')
ylabel('Score')

% Add layout title
title(t,'April Bowling League Data')
