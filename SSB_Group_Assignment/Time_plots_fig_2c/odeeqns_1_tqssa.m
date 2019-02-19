function dbydt = odeeqns_1_tqssa(t, x, et, dt)
    e2 = 0.05;
    d2 = 0.085;
    kmd = 100;
    kme = 1;
    k = 0.1;
    et = dt*k;
    
    st = 50;
    
    dsp = x(1);
    es = x(2);
    sphat = x(3);
    
       
    dbydt(1,1) = dt*sphat - dsp*(dt+kmd+sphat) + dsp^2;
    dbydt(2,1) = et*(st-sphat)-es*(et+kme+st-sphat) + es^2;
    dbydt(3,1) = e2*es - d2*dsp;

end