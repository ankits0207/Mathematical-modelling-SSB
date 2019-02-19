k1f = 1;
k2f = 1;
E1 = 0:0.1:10;
E2 = 0.2;
%E2 = 0:0.1:10;
k1r = 1;
k2r = 1;

ys2 = (k1f*k2f.*E1.*E2)./(k1f*k2f.*E1 + k1f*k2r) - (k1r*k2r)./(k1f*k2f.*E1 + k1f*k2r);
plot(E1,ys2)

xlim([0,10])
ylim([0,0.2])


xlabel('E1')
ylabel('ys2')
title('The steady state ys2 vs total enzyme concentration for case 1a in Fig3')
