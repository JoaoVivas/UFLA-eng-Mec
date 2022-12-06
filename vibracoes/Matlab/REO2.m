clc
clear all
close all
%%Questão 2
mm1 = 24;
mm = 15;

for n=1:11+1
   t(n) = n;
   m(n) = n*(mm1+mm)
   k(n) = (200-mm1-mm)*n
   c(n) = n*(100-abs(mm1-mm))
end

k_59 = (200-mm1-mm)*59
k_54 = (200-mm1-mm)*54
k_6 = (200-mm1-mm)*6;
k = k_59+k_54+k_6

c_54 = 54*(100-abs(mm1-mm))
c_59 = 59*(100-abs(mm1-mm))

%% questão 3
L = 2.5;
E = 210*10^9;
I = 1.5*10^(-5);

k_1 = 5*10^5;
k_3 = 2*10^5;
k_4 = 3*10^5;
k_2 = 3*E*I/L^3

k_eq = 1/(1/k_1+1/k_2+1/k_3)

ku = k_4 - k_eq

T = 2*pi*(8/ku)^0.5

%%Questão 4
clc
clear all
close all

syms x y teta_1 teta_p dy d2y
syms k m r r_p I_p g I_1 

x = -y/2;
teta_1 = -y/(2*r);
teta_p = -y/(2*r_p);

T = (9*m/8+I_p/(8*r_p)+I_1/(8*r))*dy^2
U = (9*k/8)*y^2 - 2*m*g*y

L = T - U

eq = (9*m/4+(I_p/(4*r_p))+I_1/(4*r))*d2y+(9*k/4)*y-2*m*g


k = 6000;
m = 0;
r = 6.4;
r_p = 6.6;
I_p = 11.1514;
g = 9.81;
I_1 = m*r^2;

eq2 = 11.1514/(4*6.6)

neweq = subs(eq2)
newneweq = simplify(neweq)

%%
clc
clear all
close all

M = 300;

a = 1.44;
b = 0.96;

k1 = 3000;
k2 = 16000;
k3 = 6000;
k4 = 4400;

Total = (a^2*k1+b^2*k2)+(k1+k2)+(k1+k3)+(k2+k4)-(2*(a*k1+b*k2+a*k1+b*k2+k1+k2))

media = Total/16

I1 = M*a^2/6
I2 = M*b^2/6

I = I1 + I2




