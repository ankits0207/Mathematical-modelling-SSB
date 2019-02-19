Atotal = 2;
kf = 1;
kfb = 1;
kb = 0.5;
I = 1;
S = 0.25;
n = 3;
cons = 0.5;

AstarbyAtotal = 0:0.01:1;
Astar = AstarbyAtotal*Atotal;

% Defining no feedback rate
no_feedback_rate = kf*S-kf*S*AstarbyAtotal;
% Plotting no feedback rate
plot(AstarbyAtotal,no_feedback_rate)
hold on

% Defining only feedback rate
only_feedback_rate = kfb.*((Astar.^n)./((Astar.^n)+cons^n)).*(1 - AstarbyAtotal);
% Plotting only feedback rate
plot(AstarbyAtotal,only_feedback_rate,'red')

% Defining total forward rate
total_forward_rate = no_feedback_rate + only_feedback_rate;
% Plotting total forward rate
plot(AstarbyAtotal,total_forward_rate,'green')

xlabel('[A*]/[Atotal]')
ylabel('Rate')
legend('No feedback','Feedback alone','Total')
title('Forward reaction rate')