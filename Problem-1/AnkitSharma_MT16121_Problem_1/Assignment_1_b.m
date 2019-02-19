Atotal = 2;
kf = 1;
kfb = 1;
kb = 0.25;
I = 1;
n = 3;
cons = 0.5;

AstarbyAtotal = 0:0.01:1;
Astar = AstarbyAtotal*Atotal;
% Defining feedback rate
feedback_rate = kfb.*((Astar.^n)./((Astar.^n)+cons^n)).*(1 - AstarbyAtotal);
forward_rate = feedback_rate;
% Defining forward rate
plot(AstarbyAtotal,forward_rate)
hold on

% Defining backward rate
backward_rate = kb*I*AstarbyAtotal;
% Plotting backward rate
plot(AstarbyAtotal,backward_rate,'--')

xlabel('[A*]/[Atotal]')
ylabel('Rate')
legend('Forward reaction','Back reaction')
title('Rate balance plot')