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
%% Initial conditions
Sp = 50;
DSp = 0;
ES = 0;
statevar_i = [DSp, Sp, ES] ;
statevar_ii = Sp;

tlast = 100 ;

%% Use of ODE solver to plot QSSA solution
kmd = 100;
[time, statevars] = ode15s(@ode_fig_2_a_1,[0,tlast],statevar_ii);
Sp = statevars(:,1);
DSp = (Dt*Sp)./(kmd + Sp);
plot(Sp,DSp,'b-o')
hold on;

%% Use of ODE solver to plot exact solution
[time, statevars] = ode15s(@ode_fig_1_d,[0,tlast],statevar_i) ;
DSp = statevars(:,1);
Sp = statevars(:,2);
ES = statevars(:,3);
plot(Sp,DSp,'k-o')

title('Fig.2A.1')
xlabel('Sp')
ylabel('D:Sp')
legend('QSSA solution',' Exact solution')


