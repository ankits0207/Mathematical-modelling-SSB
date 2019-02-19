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
    indx = find(forward_rate - backward_rate < eps, 1);
    yplot = AstarbyAtotal(indx);
    plot(S,yplot,'o')
    hold on
    S = S+1;
end
% To validate the concept of memory, when the value of stimulus was shifted 
% back to 1 and 0 (after the system shifted to "On state"), the 
% system did not shift back to "Off state" and remained in the "On state".
plot(1,yplot,'o')
plot(0,yplot,'o')
xlabel('Stimulus(arb. units)')
ylabel('Steady State [A*]/[Atotal]')