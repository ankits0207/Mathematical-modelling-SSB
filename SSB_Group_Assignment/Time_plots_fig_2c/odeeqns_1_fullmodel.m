function dbydt = odeeqns_1_fullmodel(t, x, et, dt)
    e1 = 0.1;
    eminus1 = 0.05;
    e2 = 0.05;
    d1 = 0.0009;
    d2 = 0.085;
    dminus1 = 0.005;

    st = 50;
    
    sp = x(1);
    dsp = x(2);
    es = x(3);

    
    d = dt - dsp;
    e = et - es;
    s = st - sp - dsp - es;
    
    dbydt(1,1) = e2*es - d1*d*sp + dminus1*dsp;
    dbydt(2,1) = d1*d*sp - (dminus1+d2)*dsp;
    dbydt(3,1) = e1*e*s - (eminus1+e2)*es;


end