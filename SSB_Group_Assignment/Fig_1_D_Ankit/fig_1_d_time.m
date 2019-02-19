clc;
clear all;
close all;

global e1 e2 d1 d2 e_minus_1 d_minus_1 k Dt Et St;

e1 = 0.1;
e2 = 0.05;
d1 = 0.09;
d2 = 0.085;
e_minus_1 = 0.05;
d_minus_1 = 0.005;

k = 5;
Dt = 5;
Et = Dt*k;
St = 50;

%% Initial conditions
Sp = 0;
DSp = 0;
ES = 0;
statevar_i = [DSp, Sp, ES] ;

tlast = 200 ;
%% Use of ODE solver
[time, statevars] = ode15s(@ode_fig_1_d,[0,tlast],statevar_i) ;
DSp = statevars(:,1);
Sp = statevars(:,2);
ES = statevars(:,3);

Sp_hat = Sp + DSp;
plot(time,Sp_hat./St)
ylabel('Sp_h_a_t/St')
xlabel('ET/DT')
legend('Jd = 1.02')

