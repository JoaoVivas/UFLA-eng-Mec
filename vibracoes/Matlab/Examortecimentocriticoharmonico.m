%d2u + 2*omega_n*du + omega_n^2*u = 0
%u = U_0*exp(-omega_n*t) + t*U_1*exp(-omega_n*t) 
%du =
%-omega_n*U_0*exp(-omega_n*t)+U_1*exp(-omega_n*t)-omega_n*t*U_1*exp(-omega_n*t)
%d2u = -2*zeta*omega_n*du - omega_n^2*u
clc;
clear all;
close all;

NP = 1000;

m = 1; %kg
k = 100;
NT = 1;
u_0 = 1;
du_0 = 0;

omega_n = (k/m)^0.5
omega_n = 1;

U_0 = u_0;
U_1 = (du_0+ omega_n*u_0);
T = 2*pi/omega_n;
deltat = NT*T/NP;


for i = 1:NP+1
   t(i) = deltat*(i-1);
   u(i) = U_0*exp(-omega_n*t(i)) + t(i)*U_1*exp(-omega_n*t(i));
   du(i) = -omega_n*U_0*exp(-omega_n*t(i))+U_1*exp(-omega_n*t(i))-omega_n*t(i)*U_1*exp(-omega_n*t(i));
   d2u(i) = -2*omega_n*du(i) - omega_n^2*u(i); 
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