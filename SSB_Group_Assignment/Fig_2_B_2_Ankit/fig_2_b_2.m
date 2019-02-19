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
myarray2 = [];
S_hat_final = [];
ES_final = [];

%% TQSSA solution
Sp_hat = 1:1:50;
kmd = 100;
kme = 1;
syms x
syms y
for idx = 1:numel(Sp_hat)
    eqn = Dt*Sp_hat(idx) - x*(Dt + kmd + Sp_hat(idx)) + x^2 == 0;
    DSp_1 = solve(eqn,x);
    myarray1 = [myarray1 double(DSp_1(1))];
    eqn = Et*(St - Sp_hat(idx)) - y*(Et + kme + St - Sp_hat(idx)) + y^2 == 0;
    ES_1 = solve(eqn,y);
    myarray2 = [myarray2 double(ES_1(2))];    
end

DSp = myarray1';
ES = myarray2';

Sp = Sp_hat' - DSp;
S = St - Sp - DSp - ES;
S_hat = S + ES;

for idx = 1:numel(ES)
   if ES(idx) < 20 && S_hat(idx) < 35
      ES_final = [ES_final ES(idx)];
      S_hat_final = [S_hat_final S_hat(idx)];
   end
end
plot(S_hat_final,ES_final,'r-o')
hold on

%% Initial conditions
Sp = 50;
DSp = 0;
ES = 0;
statevar_i = [DSp, Sp, ES] ;

tlast = 150 ;
%% Use of ODE solver to get exact solution
[time, statevars] = ode15s(@ode_fig_1_d,[0,tlast],statevar_i) ;
DSp = statevars(:,1);
Sp = statevars(:,2);
ES = statevars(:,3);

S = St - Sp - DSp - ES;

S_hat = S + ES;

plot(S_hat,ES,'k-o')
title('Fig.2.B.2')
xlabel('S_h_a_t')
ylabel('E:S')
legend('TQSSA solution','Exact solution')

