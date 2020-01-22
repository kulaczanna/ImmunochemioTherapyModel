function rownania = model_de_Pillis_bez_leczenia(t, x)

T = x(1);
N = x(2);
L = x(3);
C = x(4);

% ustawienie parametrów
a = 4.31e-1;
b = 1.02e-9;
c = 2.9077e-13;
d = 2.34;
e = 2.08e-7;
l = 2.09;
f = 1.25e-2;
jj = 1.245e-2;
k = 2.019e7;
p = 2.794e-13;
s = 3.8e-3;
r1 = 2.9077e-11;
r2 = 5.8467e-13;
alfa = 7.5e8;
beta = 6.3e-3;
q = 3.422e-10;

D = count_D(d, L, T, s, l);

% równania modelu
dTdt = (a * T *(1 - (b * T))) - (c * N * T) - (D * T) ;
dNdt = (e * C) - (f * N) - (p * N * T);
dLdt = (jj*(T/(k+T))*L) - (q * L * T) + (((r1 * N) + (r2 * C)) * T);
dCdt = alfa - (beta * C);

rownania = [dTdt; dNdt; dLdt; dCdt];
end

