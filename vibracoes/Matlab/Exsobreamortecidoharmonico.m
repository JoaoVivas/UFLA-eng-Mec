%m*d2u + c*du + k*u = 0
%d2u + c/m*du + k/m*u = 0
%d2u + 2*zeta*omega_n*du + omega_n^2*u = 0
%omega_a = omega_n*(zeta^2-)^0.5
%u = exp(-zeta*omega_n*t)*(U_1*exp(-omega_a*t)+U_2*exp(omega_a*t)
%du =
%-zeta*omega_n*exp(-zeta*omega_n*t)*(U_1*exp(-omega_a*t)+U_2*exp(omega_a*t))+omega_a*exp(-zeta*omega_n*t)*(-U_1*exp(-omega_a*t)+U_2*exp(omega_a*t))
%d2u = -2*zeta*omega_n*du - omega_n^2*u
clc;
clear all;
close all;

NP = 1000;

m = 1; %kg
k = 100;
c = 4;
NT = 1;
u_0 = 1;
du_0 = 0;

%omega_n = (k/m)^0.5;
omega_n = 1;

%c_c = 2*m*omega_n
%zeta = c/c_c
zeta = 1.1;

%omega_d = omega_n*(1-zeta^2)^0.5;
omega_a = omega_n*(zeta^2-1)^0.5;

U_1 = (u_0/2)-(du_0+zeta*omega_n*u_0/(2*omega_a));
U_2 = (u_0/2)+(du_0+zeta*omega_n*u_0/(2*omega_a));

T = 2*pi/omega_n;
deltat = NT*T/NP;


for i = 1:NP+1
   t(i) = deltat*(i-1);
   u(i) = exp(-zeta*omega_n*t(i))*(U_1*exp(-omega_a*t(i))+U_2*exp(omega_a*t(i)));
   du(i) = -zeta*omega_n*exp(-zeta*omega_n*t(i))*(U_1*exp(-omega_a*t(i))+U_2*exp(omega_a*t(i)))+omega_a*exp(-zeta*omega_n*t(i))*(-U_1*exp(-omega_a*t(i))+U_2*exp(omega_a*t(i)));
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