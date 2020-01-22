clc; clear all
close all

        T_0 = 1e7;% tumor cells population T(t)
        N_0 = 2.5e8;% natural killer cells N(t)
        L_0 = 5.268e5;% CD8+T cells L(t)
        C_0 = 2.25e9;% cell C(t)

x = [T_0; N_0; L_0; C_0]; % parametry wejœciowe  uk³adu równañ bez sk³adowych leczenia

[t,y] = ode45(@model_de_Pillis_bez_leczenia, [0 200], x); % rozwi¹zanie uk³adu równañ ró¿niczkowych

% wyœwietlenie wykresów
figure
semilogy(t, y(:,1), 'm');
hold on
semilogy(t, y(:,2), 'g');
legend();
hold on
semilogy(t, y(:,3), 'r');
hold on
semilogy(t, y(:,4), 'c');
legend('Tumour', 'Natural killer cells', 'CD8+ T cells', 'Circulating lymphocytes');
