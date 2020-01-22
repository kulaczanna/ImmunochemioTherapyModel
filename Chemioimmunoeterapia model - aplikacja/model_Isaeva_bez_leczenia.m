function rownania = model_Isaeva(t, x)

T = x(1);
L = x(2);

% ustawienie parametrów
a = 0.13;
b = 3e-10;
c = 4.4e-9;
d = 7.3e6;
f = 0.33;

% równania modelu
dTdt = -a*T*log((b*T)/a) - c*T*L;
dLdt = d - f*L;

rownania = [dTdt; dLdt];
end

