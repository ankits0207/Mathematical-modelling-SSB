function deriv = aguda_fig8( t,statevar )

global E1 k1f k2f k1r k2r kx;

active_mpf = statevar(1);
cdc25_p = statevar(2);
cdc25 = statevar(3);
x = statevar(4);

deriv = [k1f*(E1-active_mpf)*cdc25_p-k1r*active_mpf; 
        k2r*cdc25*active_mpf - k2f*cdc25_p; 
        k2f*cdc25_p-k2r*cdc25*active_mpf-kx*cdc25*x; -kx*x*cdc25];
return

