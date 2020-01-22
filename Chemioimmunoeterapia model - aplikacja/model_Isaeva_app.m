clc; clear all
close all
format long

        T_0 = 1e8;% tumor cells population T(t)
        L_0 = 9e7;% CD8+T cells L(t)
        M_0 = 0;% concentration of chemotherapy drug M(t)
        I_0 = 2e7;% concentration of IL-2 I(t)
        I_alfa_0 = 1e7;% concentration of IFN-alfa I(t)

x = [T_0; L_0; M_0; I_0; I_alfa_0]; % parametry wejœciowe  uk³adu równañ
[t,y] = ode45(@model_Isaeva, [0 200], x); % rozwi¹zanie uk³adu równañ ró¿niczkowych

% wyœwietlenie wykresów
figure
semilogy(t, y(:,1), 'm');
hold on
semilogy(t, y(:,2), 'r');
hold on
semilogy(t, y(:,3), 'c');
hold on
semilogy(t, y(:,4), 'b');
hold on
semilogy(t, y(:,5), 'w');
hold on
legend('Tumour', 'CD8+ T cells', 'Chemotherapy drug', 'IL2', 'IFN-alfa');
