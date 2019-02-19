function deriv = ode_fig_2_c( t, statevar )
Sp_hat = statevar(1);

Dt = 200;
d_minus_1 = 0.005;
d2 = 0.085;
d1 = 0.0009;
Et = 20;
e_minus_1 = 0.05;
e2 = 0.05;
e1 = 0.1;
St = 50;

syms x
eqn = (Dt-x)*(Sp_hat-x)-((d_minus_1+d2)/d1)*x == 0;
DSp = solve(eqn,x);
syms y
eqn = (Et-y)*(St-Sp_hat-y)-((e_minus_1+e2)/e1)*y == 0;
ES = solve(eqn,y);  

%% Defining ODEs
deriv(1,1) = double(e2*ES(2)-d2*DSp(2));

return

