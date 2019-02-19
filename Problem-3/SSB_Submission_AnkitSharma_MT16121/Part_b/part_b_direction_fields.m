clear all;
close all;
clc;

S = 1;
E = 1;
k_not = 0.05;
k1 = 0.05;
k2 = 0.05;
k3 = 0.05;
k4 = 0.05;
k5 = 0.05;
y_total = 1;

x_dot = @(x,yp) k_not + k1*S + k3*yp - k2*x;
yp_dot = @(x,yp) k4*x*(y_total - yp) - k5*E*yp;

x_nullcline = ezplot(x_dot);
set(x_nullcline,'color',[1 0 0])
hold on;
y_nullcline = ezplot(yp_dot);
set(y_nullcline,'color',[0 1 0])

[x,yp] = meshgrid(-20:0.5:20);
dx = k_not + k1*S + k3*yp - k2*x;
dy = k4*x.*(y_total - yp) - k5*E*yp;
r = ( dx.^2 + dy.^2 ).^0.5;
px = dx./r;
py = dy./r;
quiver(x,yp,px,py);
hold off;

title('Direction fields for part b')
xlabel('X')
ylabel('Y')
legend('x nullcline','y nullcline','Direction fields')