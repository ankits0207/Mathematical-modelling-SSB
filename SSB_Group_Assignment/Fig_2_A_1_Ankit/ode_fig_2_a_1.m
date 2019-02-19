function deriv = ode_fig_2_a_1( t, statevar )

global e1 e2 d1 d2 e_minus_1 d_minus_1 Dt Et St;

Sp = statevar(1);

%% Defining and solving DSp and ES
syms x
eqn = (Dt-x)*Sp-((d_minus_1+d2)/d1)*x == 0;
DSp = solve(eqn,x);

syms y
eqn = (Et-y)*(St-Sp-DSp-y)-((e_minus_1+e2)/e1)*y == 0;
ES = solve(eqn,y);

%% Defining ODEs

deriv(1,1) = double(e2*ES(1) - d1*(Dt-DSp)*Sp + d_minus_1*DSp);

return

