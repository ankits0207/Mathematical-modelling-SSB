function dbydt = odeeqns_1_qssa(t, x, et, dt)
    e2 = 0.05;
    d1 = 0.0009;

    dminus1 = 0.005;
    kmd = 100;
    kme = 1;
    
    st = 50;
    
    dsp = x(1);    
    es = x(2);
    sp = x(3);
    
    d = dt - dsp;

    dbydt(1,1) = dt*sp-(kmd+sp)*dsp;
    dbydt(2,1) = et*(st-sp-dsp)-es*(et+kme+st-sp-dsp) + es^2;
    dbydt(3,1) = e2*es + dminus1*dsp - d1*d*sp;


end