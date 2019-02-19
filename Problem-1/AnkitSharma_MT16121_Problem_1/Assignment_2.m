Atotal = 15;
kf = 1;
kfb = 0.5;
kb = 1;
I = 1;
S = 0;

AstarbyAtotal = 0:0.01:1;
Astar = AstarbyAtotal*Atotal;

% Defining the basal reaction rate
basal_rxn_rate = kf*S-kf*S*AstarbyAtotal;
% Defining the feedback rate
feedback_rate = kfb*Astar - kfb*(Astar.^2)./Atotal;
% Defining the forward_rate
forward_rate = basal_rxn_rate + feedback_rate;
% Plotting the forward rate
plot(AstarbyAtotal,forward_rate)
hold on

% Defining the backward rate
backward_rate = (Astar./Atotal)./(0.05+Astar./Atotal);
% Plotting the backward rate
plot(AstarbyAtotal,backward_rate,'--')
xlabel('[A*]/[Atotal]')
ylabel('Rate')
legend('Forward reaction','Back reaction')
title('Rate balance plot')
