clear all;
close all;
clc;

S = 1;
k_not = 0.05;
k1 = 0.05;
k2 = 0.05;
k3 = 0.05;
k4 = 0.05;
y_total = 1;

x_dot = @(x,yp) k_not + k1*S - k2*x*yp;
yp_dot = @(x,yp) k3*x*(y_total - yp) - k4*yp;

x_nullcline = ezplot(x_dot);
set(x_nullcline,'color',[1 0 0])
hold on;
y_nullcline = ezplot(yp_dot);
set(y_nullcline,'color',[0 0 1])
hold off

title('Nullclines for part a')
xlabel('X')
ylabel('Y')
legend('x nullcline','y nullcline')