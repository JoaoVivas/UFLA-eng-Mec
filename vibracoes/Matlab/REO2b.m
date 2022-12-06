%%1
clc
clear all
close all
NT = 1;
NP = 1000;

m = 5.0475;
h = 3.9;
k = 1095;
c = 2.95;
g = 9.81;

y_0 = 0;
dy_0 = (2*g*h)^0.5/2

omega_n = (k/(2*m))^0.5
zeta = c/(4*m*omega_n)

omega_d = omega_n*(1-zeta^2)^0.5

A_1 = y_0;

A_2 = (dy_0+ zeta*omega_n*y_0)/omega_d;
t = pi/(2*omega_n)
ym = 0.42*exp(-t*zeta*omega_n)

x  = fulldiff

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

%%
clc
clear all
close all
%%
clc
clear all
close all
%%
clc
clear all
close all
%%
clc
clear all
close all
