function deriv = aguda_fig5_a_b( t,statevar )

global E1 E2 k1f k2f k1r k2r;

y1 = statevar(1);

deriv = k1f*(E1-y1)*((k2f*E2*y1)/(k2f*y1 + k2r)) - k1r*y1;

return

