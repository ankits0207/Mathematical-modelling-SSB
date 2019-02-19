kf = 1;
Etotal = 0:0.1:10;
kr = 1;

yss1 = 0;
yss2 = (kf.*Etotal-kr)./kf;

for i = 1:length(Etotal)
    f_dash_y_at_yss1 = -2*kf*yss1 + kf.*Etotal(i) - kr;
    f_dash_y_at_yss2 = -2*kf*yss2(i) + kf.*Etotal(i) - kr;
    if (f_dash_y_at_yss1 < 0)
        p1 = plot(Etotal(i),yss1,'o');
    elseif (f_dash_y_at_yss1 > 0)
        p2 = plot(Etotal(i),yss1,'.');
    end
    hold on;
    if (f_dash_y_at_yss2 < 0)
        p1 = plot(Etotal(i),yss2(i),'o');
    elseif (f_dash_y_at_yss2 > 0)
        p2 = plot(Etotal(i),yss2(i),'.');
    end
end

xlim([0,4])
ylim([0,3])

xlabel('Etotal')
ylabel('yss')
legend([p1, p2],'Stable steady state','Unstable steady state')
title('Bifurcation Plot')