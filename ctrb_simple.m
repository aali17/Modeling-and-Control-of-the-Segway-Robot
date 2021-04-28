clc
clear
close all

A = [0 0 2.16 0;
    0 0 0 0;
    0 0 0 1;
    0 0 72.49 0];

B = [-1.67 1.67;
0.029 -0.029;
0 0;
-24.15 -24.15];
C = [1 1 1 1];
x = [1 1 1 1]';

c = ctrb(A,B);
r = rank(c);
l = length(A(:,1));

p = [-1 -2 -1.5 -2.1];
kcl = place(A,B,p);

delta = [0.05, 0.01, 0, 0]';
x_est = x - delta;

u = -kcl*x_est;

x_est = A*x_est + B*u;

x = x_est + delta;

D = [0];

sys2 = ss(A-B*kcl,B,C,D);
figure
step(sys2)

