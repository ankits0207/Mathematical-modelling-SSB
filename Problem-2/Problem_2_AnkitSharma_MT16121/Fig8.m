global E1 k1f k2f k1r k2r kx;

E1 = 1;
k1f = 1;
k2f = 1;
k1r = 1;
k2r = 1;
kx = 2;

tlast = 60;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% For curve a %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cdc25_p_init = 0.2;
cdc25_init = 1.8;
active_mpf_init = 0.2;
x_init = 0;

statevar_init = [active_mpf_init, cdc25_p_init, cdc25_init, x_init];
[time,statevars] = ode15s(@aguda_fig8,[0,tlast],statevar_init) ;
active_mpf_out = statevars(:,1);
p1 = plot(time, active_mpf_out);
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% For curve b %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cdc25_p_init = 0.2;
cdc25_init = 1.8;
active_mpf_init = 0.2;
x_init = 1.5;

statevar_init = [active_mpf_init, cdc25_p_init, cdc25_init, x_init];
[time,statevars] = ode15s(@aguda_fig8,[0,tlast],statevar_init) ;
active_mpf_out = statevars(:,1);
p2 = plot(time, active_mpf_out, 'red');

ylim([0,0.5]);

xlabel('time')
ylabel('active MPF')
legend([p1, p2],'a','b')
title('Plot showing that the activity of MPF is switched off when total cdc25 is decreased in curve b')