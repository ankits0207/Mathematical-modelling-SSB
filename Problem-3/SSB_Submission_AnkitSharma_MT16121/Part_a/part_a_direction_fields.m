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
set(y_nullcline,'color',[0 1 0])

[x,yp] = meshgrid(-20:0.5:20);
dx = k_not + k1*S - k2*x.*yp;
dy = k3*x.*(y_total - yp) - k4*yp;
r = ( dx.^2 + dy.^2 ).^0.5;
px = dx./r;
py = dy./r;
quiver(x,yp,px,py);

title('Direction fields for part a')
xlabel('X')
ylabel('Y')
legend('x nullcline','y nullcline','Direction fields')