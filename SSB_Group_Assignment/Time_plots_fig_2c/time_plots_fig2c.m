clear all;
close all;
clc;

et = 20;
dt = 200;
st = 50;
%% exact solution
[t,y] = ode15s(@(t,y) odeeqns_1_fullmodel(t, y, et, dt),[0 100],[st; 0; 0]);
sp = y(:,1);
dsp = y(:,2);
es = y(:,3);

s1 = st - sp - dsp - es;
shat1 = s1+es;
t1 = t;
%% QSSA
opts = odeset('Mass', [0 0 0; 0 0 0; 1 0 0]);
[t,y] = ode15s(@(t,y) odeeqns_1_qssa(t, y, et, dt),[0 100],[st; 0; 0], opts);
dsp = y(:,1);
es = y(:,2);
sp = y(:,3);

shat2 = st - sp - dsp;
s2 = shat2 - es;
t2 = t;
%% TQSSA Solution
statevar_i = 50;
ES = 50;
tlast = 200;
[time, statevars] = ode15s(@ode_fig_2_c,[0,tlast],statevar_i) ;
Sp = 0;
Sp_hat = statevars(:,1); 
s3 = Sp - Sp_hat;
shat3 = s3 + ES;
t3 = time;

s3 = 50-Sp_hat;

% %% TQSSA
% opts = odeset('Mass', [0 0 0; 0 0 0; 1 0 0]);
% [t,y] = ode15s(@(t,y) odeeqns_1_tqssa(t, y, et, dt),[0 100],[20; 0; 0], opts);
% dsp = y(:,1);
% es = y(:,2);
% sphat = y(:,3);
% 
% sp = sphat - dsp;
% s3 = st - sp;
% shat3 = s3+es;
% t3 = t;
%% Results
figure
subplot(121), title('S hat vs time'), xlabel('time(min)'), ylabel('S hat (nM)');
hold on;
plot(t1, shat1,'k');
plot(t2, shat2,'b');
plot(t3, shat3,'r');
legend('exact','QSSA','TQSSA');
subplot(122), title('S vs time'), xlabel('time(min)'), ylabel('S (nM)');
hold on;
plot(t1, s1,'k');
plot(t2, s2,'b');
plot(t3, s3,'r');
legend('exact','QSSA','TQSSA');