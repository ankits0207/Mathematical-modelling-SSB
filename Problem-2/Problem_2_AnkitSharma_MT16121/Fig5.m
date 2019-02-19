global E1 E2 k1f k2f k1r k2r E1dash;

E1 = 2;
E2 = 1;
k1f = 1;
k2f = 1;
k1r = 1;
k2r = 1;
E1dash = 0.9;

tlast = 100;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% For curve a %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y1 = 1;
statevar_init = y1;
[time,statevars] = ode15s(@aguda_fig5_a_b,[0,tlast],statevar_init) ;
y1out = statevars(:,1);
p1 = plot(time, y1out);
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% For curve b %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y1 = 0.1;
statevar_init = y1;
[time,statevars] = ode15s(@aguda_fig5_a_b,[0,tlast],statevar_init) ;
y1out = statevars(:,1);
p2 = plot(time, y1out, 'red');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% For curve c %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y1 = 1;
statevar_init = y1;
[time,statevars] = ode15s(@aguda_fig5_c_d,[0,tlast],statevar_init) ;
y1out = statevars(:,1);
p3 = plot(time, y1out,'green');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% For curve c %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y1 = 0.1;
statevar_init = y1;
[time,statevars] = ode15s(@aguda_fig5_c_d,[0,tlast],statevar_init) ;
y1out = statevars(:,1);
p4 = plot(time, y1out,'magenta');

xlabel('time')
ylabel('y1')
title('Evolution of concentration of species y1 for case 1a in fig 3')
legend([p1, p2, p3, p4],'a','b','c','d')
