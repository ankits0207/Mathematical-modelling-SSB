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
myarray = [];

%% TQSSA solution
Sp_hat = 17:1:50;
syms x
for idx = 1:numel(Sp_hat)
    eqn = (Dt-x).*(Sp_hat(idx) - x)-((d_minus_1 + d2)/d1).*x == 0;
    sol = solve(eqn,x);
    myarray = [myarray double(sol(2))];
end
DSp = myarray';
plot(Sp_hat,DSp,'r-o');
hold on;
%% Initial conditions
Sp = 50;
Sp_hat = 50;
DSp = 0;
ES = 0;
statevar_i = [DSp, Sp, ES] ;
statevar_ii = Sp_hat;
tlast = 150 ;

%% Use of ODE solver to get exact solution
[time, statevars] = ode15s(@ode_fig_1_d,[0,tlast],statevar_i) ;
DSp = statevars(:,1);
Sp = statevars(:,2);
ES = statevars(:,3);

Sp_hat = Sp + DSp;

plot(Sp_hat,DSp,'k-o')

title('Fig.2.B.1')
xlabel('Sp_h_a_t')
ylabel('D:Sp')
legend('TQSSA solution', 'Exact solution')

