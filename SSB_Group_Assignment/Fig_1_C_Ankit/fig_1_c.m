clc;
clear all;
close all;

k2e = 1;
k2d = 1.7;
kme = 1;
kmd = 1;
St = 50;

%% For Dt = 0.5
Et = 0:0.01:2;
Dt_1 = 0.5;
Ve = (k2e*Et)./(k2d*Dt_1);
Vd = 1;
Je = (kme + Et)./St;
Jd = (kmd + Dt_1)./St;

Sp_star_hat = St*(2*Ve.*Jd)./(Vd - Ve + Vd.*Je + Ve.*Jd + ((Vd - Ve + Vd.*Je + Ve.*Jd).^2 - 4*(Vd - Ve).*(Ve.*Jd)).^0.5);
plot(Et./Dt_1,Sp_star_hat./St)
hold on
%% For Dt = 5
Et = 0:0.1:20;
Dt_2 = 5;
Ve = (k2e*Et)./(k2d*Dt_2);
Vd = 1;
Je = (kme + Et)./St;
Jd = (kmd + Dt_2)./St;

Sp_star_hat = St*(2*Ve.*Jd)./(Vd - Ve + Vd.*Je + Ve.*Jd + ((Vd - Ve + Vd.*Je + Ve.*Jd).^2 - 4*(Vd - Ve).*(Ve.*Jd)).^0.5);
plot(Et./Dt_2,Sp_star_hat./St,'--')
%% For Dt = 50
Et = 0:1:200;
Dt_3 = 50;
Ve = (k2e*Et)./(k2d*Dt_3);
Vd = 1;
Je = (kme + Et)./St;
Jd = (kmd + Dt_3)./St;

Sp_star_hat = St*(2*Ve.*Jd)./(Vd - Ve + Vd.*Je + Ve.*Jd + ((Vd - Ve + Vd.*Je + Ve.*Jd).^2 - 4*(Vd - Ve).*(Ve.*Jd)).^0.5);
plot(Et./Dt_3,Sp_star_hat./St,':')
%% Labelling the plot
title('Fig 1.C')
xlabel('ET/DT') % x-axis label
ylabel('Sp_h_a_t/St') % y-axis label
legend('Jd = 0.03','Jd = 0.12','Jd = 1.02')