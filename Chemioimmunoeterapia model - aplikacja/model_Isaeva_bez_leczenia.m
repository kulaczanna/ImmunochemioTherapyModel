function rownania = model_Isaeva(t, x)

T = x(1);
L = x(2);

% ustawienie parametr�w
a = 0.13;
b = 3e-10;
c = 4.4e-9;
d = 7.3e6;
f = 0.33;

% r�wnania modelu
dTdt = -a*T*log((b*T)/a) - c*T*L;
dLdt = d - f*L;

rownania = [dTdt; dLdt];
end

