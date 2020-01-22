clc; clear all
close all
format long

T_0 = 1e8;% tumor cells population T(t)
L_0 = 9e7;% CD8+T cells L(t)

x = [T_0; L_0]; % parametry wejœciowe  uk³adu równañ
[t,y] = ode45(@model_Isaeva_bez_leczenia, [0 160], x); % rozwi¹zanie uk³adu równañ ró¿niczkowych

% wyœwietlenie wykresów
figure
semilogy(t, y(:,1), 'm');
hold on
semilogy(t, y(:,2), 'r');
hold on
legend('Tumour', 'CD8+ T cells');
