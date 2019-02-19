clear all;
close all;
clc;

S = 0.5;
E = 0.5;
k_not = 0.05;
k1 = 0.05;
k2 = 0.05;
k3 = 0.05;
k4 = 0.05;
y_total = 1;

x_dot = @(x,y) k_not + k1*S - k2*x*y;
y_dot = @(x,y) k4*E*(y_total - y) - k3*x*y;

x_nullcline = ezplot(x_dot);
set(x_nullcline,'color',[1 0 0])
hold on;
y_nullcline = ezplot(y_dot);
set(y_nullcline,'color',[0 0 1])
hold off

title('Nullclines for part c')
xlabel('X')
ylabel('Y')
legend('x nullcline','y nullcline')