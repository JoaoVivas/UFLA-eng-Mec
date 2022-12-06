%m*d2u + c*du + k*u = 0
%d2u + c/m*du + k/m*u +  = 0
%d2u + 2*zeta*omega_n*du + omega_n^2*u = 0
%u = exp(-zeta*omega_n*t)*(A_1*cos(omega_d*t)+A_2*sin(omega_d*t))
%du =
%omega_d*exp(-zeta*omega_n*t)*(-A_1*sin(omega_d*t)+A_2*cos(omega_d*t))+(-zeta*omega_n*exp(-zeta*omega_n*t)*(A_1*cos(omega_d*t)+A_2*sin(omega_d*t))
%d2u = -2*zeta*omega_n*du - omega_n^2*u
clc;
clear all;
close all;

NP = 1000;

m = 1; %kg
k = 100;
c = 4;
NT = 10;
u_0 = 5;
du_0 = 0;

omega_n = (k/m)^0.5
c_c = 2*m*omega_n
zeta = c/c_c
omega_d = omega_n*(1-zeta^2)^0.5

A_1 = u_0;

A_2 = (du_0+ zeta*omega_n*u_0)/omega_d;
T = 2*pi/omega_n;
deltat = NT*T/NP;


for i = 1:NP+1
   t(i) = deltat*(i-1);
   u(i) = exp(-zeta*omega_n*t(i))*(A_1*cos(omega_d*t(i))+A_2*sin(omega_d*t(i)));
   du(i) = omega_d*exp(-zeta*omega_n*t(i))*(-A_1*sin(omega_d*t(i))+A_2*cos(omega_d*t(i)))+(-zeta*omega_n*exp(-zeta*omega_n*t(i))*(A_1*cos(omega_d*t(i))+A_2*sin(omega_d*t(i))));
   d2u(i) = -2*zeta*omega_n*du(i) - omega_n^2*u(i); 
end

figure(1)
plot(t,u)
xlabel('Tempo (s)')
ylabel('Deslocamento (m)')

figure(2)
plot(t,du)
xlabel('Tempo (s)')
ylabel('Velocidade (m/s)')

figure(3)
plot(t, d2u)
xlabel('Tempo (s)')
ylabel('Aceleração (m/s^2)')
