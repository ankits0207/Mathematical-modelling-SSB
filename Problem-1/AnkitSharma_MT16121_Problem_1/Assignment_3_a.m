Atotal = 100;
AstarbyAtotal = 0:0.01:1;
Astar = AstarbyAtotal.*Atotal;
kf = 0.05;
S = 0;
kfb = 2;
n = 5;
cons = 40;
kb = 0.5;
I = 1;

% Defining feedback rate in terms of Hills equation
feedback_rate = kfb.*((Astar.^n)./((Astar.^n)+cons^n)).*(1 - AstarbyAtotal);
% Defining the backward rate
backward_rate = kb*I*AstarbyAtotal;

% Using for loop to get different forward rates corresonding to varying
% stimulus
for i = 1:7
    % Defining basal rate
    basal_rate = kf*S*(1 - AstarbyAtotal);    
    forward_rate = basal_rate + feedback_rate;
    p1 = plot(AstarbyAtotal, forward_rate);
    hold on
    S = S+1;
end

p2 = plot(AstarbyAtotal,backward_rate,'--');
xlabel('[A*]/[Atotal]')
ylabel('Rate')
title('Rate balance plot')
legend([p1, p2],'Total forward reaction','Back reaction')
