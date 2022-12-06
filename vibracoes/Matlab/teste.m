s = tf('s');

m = 66.4

L_1 = 0.2
delta_1 = 0.007
omega_1 = 16.9

L_2 = 0.3
delta_2 = 0.0065
omega_2 = 13.7

L_3 = 0.39
delta_3 = 0.005
omega_3 = 12.5

EA_10 = 3e4;
cA_10 = 4;

EA_20 = 2.9e4;
cA_20 = 4.5;

EA_30 = 3.2e4;
cA_30 = 3.8;

EA_1 = omega_1^2*m*L_1
cA_1 = 2*delta_1*omega_1*m*L_1

EA_2 = omega_2^2*m*L_2
cA_2 = 2*delta_2*omega_2*m*L_2

EA_3 = omega_3^2*m*L_3
cA_3 = 2*delta_3*omega_3*m*L_3

dif_EA_1 = EA_10 - EA_1
dif_cA_1 = cA_10 - cA_1

dif_EA_2 = EA_20 - EA_2
dif_cA_2 = cA_20 - cA_2

dif_EA_3 = EA_30 - EA_3
dif_cA_3 = cA_30 - cA_3

K_1 = EA_1/L_1
K_2 = EA_2/L_2
K_3 = EA_3/L_3

C_1 = cA_1/L_1
C_2 = cA_2/L_2
C_3 = cA_3/L_3

K = mean([K_1, K_2, K_3])
C = mean([C_1, C_2, C_3])
g_tf = M*s^2+C*s+K