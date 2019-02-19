clc;
clear all;
close all;

global e1 e2 d1 d2 e_minus_1 d_minus_1 k Dt Et St;

e1 = 0.1;
e2 = 0.05;
d1 = 0.0009;
d2 = 0.085;
e_minus_1 = 0.05;
d_minus_1 = 0.005;

k = 0.1;
Dt = 200;
Et = Dt*k;
St = 50;
myarray1 = [];
S_new = [];
ES_new = [];

%% QSSA solution
Sp = 5:1:100;
kmd = 100;
syms y
DSp = (Dt*Sp)./(kmd+Sp);
for idx = 1:numel(Sp)
    eqn = (Et-y)*(St-Sp(idx)-DSp(idx)-y)-((e_minus_1+e2)/e1)*y == 0;
    ES = solve(eqn,y);
    myarray1 = [myarray1 double(ES(2))];
end
ES = myarray1';
S = St - Sp' - DSp' - ES;
for idx = 1:numel(ES)
    if ES(idx) >= 0
        ES_new = [ES_new ES(idx)];
        S_new = [S_new S(idx)]; 
    end
end
plot(S_new,ES_new,'b-o')
hold on;

%% Initial conditions
Sp = 50;
DSp = 0;
ES = 0;
statevar_i = [DSp, Sp, ES] ;
statevar_ii = Sp;

tlast = 150 ;
%% Use of ODE solver to plot exact solution
[time, statevars] = ode15s(@ode_fig_1_d,[0,tlast],statevar_i) ;
DSp = statevars(:,1);
Sp = statevars(:,2);
ES = statevars(:,3);

S = St - Sp - DSp - ES;

plot(S,ES,'k-o')
title('Fig.2A.2')
xlabel('S')
ylabel('E:S')
legend('QSSA solution',' Exact solution')

