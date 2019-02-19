function deriv = ode_fig_1_d( t, statevar )

global e1 e2 d1 d2 e_minus_1 d_minus_1 Dt Et St;

DSp = statevar(1);
Sp = statevar(2);
ES = statevar(3);

%% Conservation relationship
D = Dt - DSp;
E = Et - ES;
S = St - Sp - DSp - ES;

%% Defining ODEs
deriv(1,1) = d1*D*Sp - (d_minus_1 + d2)*DSp;
deriv(2,1) = e2*ES - d1*D*Sp + d_minus_1*DSp;
deriv(3,1) = e1*E*S - (e_minus_1 + e2)*ES;

return

