function rownania = model_Isaeva(t, x)

T = x(1);
L = x(2);
M = x(3);
I = x(4);
I_alfa = x(5);

% ustawienie parametrów
a = 0.13;
b = 3e-10;
c = 4.4e-9;
d = 7.3e6;
e = 9.9e-9;
f = 0.33;
g = 1.6e7;
jj = 3.3e-9;
k = 1.8e-8;
l = 3e6;
M_T = 0.9;
M_L = 0.6;
p = 6.4;
q = 1.7;
V_M = 0;
V_I = 0;
V_I_alfa = 0;

% równania modelu
dTdt = -a*T*log((b*T)/a) - c*T*L - M_T*(1-exp(-M))*T;
dLdt = d + e*L*I - f*L - M_L*(1-exp(-M))*L;
dMdt = V_M - p*M;
dIdt = V_I + ((g*T)/(T+l)) - jj*L*I - k*T*I;
dI_alfadt = V_I_alfa - q*I_alfa; 

rownania = [dTdt; dLdt; dMdt; dIdt; dI_alfadt];
end

