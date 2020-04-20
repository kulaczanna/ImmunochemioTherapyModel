function rownania = model_Immuno_Chemio_Therapy(t, x)

K_T = 9e-1;
K_N = 6e-1;
K_L = 6e-1;
K_C = 6e-1;

T = x(1);
N = x(2);
L = x(3);
C = x(4);
M = x(5);
I = x(6);
I_alfa = x(7);
I_alfa0 = 10;
liczba_dni_w_cyklu = x(8);

% ustawienie parametrów
a = 4.31e-1;
b = 1.02e-9;
c = 6.41e-11;
d = 2.34;
e = 2.08e-7;
l = 2.09;
f = 4.12e-2;
g = 1.25e-2;
h = 2.02e7;
jj = 2.49e-2;
k = 3.66e7;
m = 2.04e-1;
q = 1.42e-6;
p = 3.42e-6;
s = 8.39e-2;
r1 = 1.1e-7;
r2 = 6.5e-11;
u = 3e-10;
alfa = 7.5e8;
beta = 1.2e-2;
gamma = 9e-1;
p_i = 1.25e-1;
g_i = 2e2;
mi_I = 1e1;
c_CTL = 4.4e-9;
g_prim = 1.7;
j_prim = 3.3e-9;
k_prim = 1.8e-8;

% D = d * (((L / T)^l) / (s + ((L / T)^l))); % tumor inactivation by CD8+T
D = count_D(d, L, T, s, l);
c_prim = c_CTL * (2 - (exp((-I_alfa) / I_alfa0))); % I_alfa, CD8T, tumor interact - inactivation
% c_prim = c_CTL;

% dawkowanie TIL
 if(t >= 7 && t < 8)
     V_L = 1e9;
 else
     V_L = 0;
 end
 
% funkcja stê¿enia interleukiny-2
 if(t >= 8 && t <= 8.45 || t >= 8.7 && t <= 9.15 ...
            || t >= 9.4 && t <= 9.85 || t >= 10.1 && t <= 10.55 ...
            || t >= 10.8 && t <= 11.25 || t >= 11.5 && t <= 11.85)
        V_I = 5e6;
 else
        V_I = 0;
 end
 
 % I_alfa
   if(t >= 0 && t <= 1 || t >= liczba_dni_w_cyklu && t <= liczba_dni_w_cyklu+1 ...
            || t >= 2*liczba_dni_w_cyklu && t <= (2*liczba_dni_w_cyklu)+1 ...
            || t >= 3*liczba_dni_w_cyklu && t <= (3*liczba_dni_w_cyklu)+1)
        V_I_alfa = 5;
    else
        V_I_alfa = 0;
   end
 
   % chemioterapia
   V_M = 0;

% równania modelu
dTdt = (a * T *(1 - (b * T))) - (c * N * T) - (D * T) - (K_T * (1 - (exp(-M))) * T) - (c_prim * T * L);
dNdt = (e * C) - (f * N) + (g * ((T^2) / (h + (T^2))) * N) - (p * N * T) - (K_N * (1 - exp(-M)) * N);
dLdt = ((-m) * L) + (jj * ((D^2 * T^2) / (k + (D^2 * T^2))) * L) - (q * L * T) + ...
    (((r1 * N) + (r2 * C)) * T) - (u * N * (L^2)) - (K_L * (1 - exp(-M)) * L) + ...
    ((p_i * L * I) / (g_i)) + V_L;
dCdt = alfa - (beta * C) - (K_C * (1 - exp(-M)) * C);
dMdt = ((-gamma) * M) + V_M;
dIdt = ((-mi_I) * L) - (j_prim * L * I) - (k_prim * T * I) + V_I;
dI_alfadt = V_I_alfa - (g_prim * I_alfa);

rownania = [dTdt; dNdt; dLdt; dCdt; dMdt; dIdt; dI_alfadt; 0]; 
% rownania = [dTdt; dNdt; dLdt; dCdt; dMdt; dIdt; dI_alfadt]; % wektor równañ

end