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
set(y_nullcline,'color',[0 1 0])

[x,y] = meshgrid(-20:0.5:20);
dx = k_not + k1*S - k2*x.*y;
dy = k4*E*(y_total - y) - k3*x.*y;
r = ( dx.^2 + dy.^2 ).^0.5;
px = dx./r;
py = dy./r;
quiver(x,y,px,py);
hold off;

title('Direction fields for part c')
xlabel('X')
ylabel('Y')
legend('x nullcline','y nullcline','Direction fields')