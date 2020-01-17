clc; clear all
close all
format long

n = 1; % wybór przypadku - 1 st³umienie nowotworu, 2 wzrost nowotworu

switch n
    case 1
        T_0 = 1e7;% tumor cells population T(t)
        N_0 = 2.5e8;% natural killer cells N(t)
        L_0 = 5.268e5;% CD8+T cells L(t)
        C_0 = 2.25e9;% cell C(t)
        I_0 = 1073;% concentration of IL-2 I(t)
%         I_alfa_0 = 0;% concentration of INF-a Ia(t)
        M_0 = 0;% concentration of chemotherapy drug M(t)
    case 2
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
%         I_0 = 0;% concentration of IL-2 I(t)
%         I_alfa_0 = 0;% concentration of INF-a Ia(t)
%         M_0 = 0;% concentration of chemotherapy drug M(t)
end

% I_alfa = I_alfa_0;
% x = [T_0; N_0; L_0; C_0; M_0; I_0; I_alfa_0; I_alfa];

x = [T_0; N_0; L_0; C_0; M_0; I_0]; % parametry wejœciowe  uk³adu równañ
% x = [T_0; N_0; L_0; C_0]; % parametry wejœciowe  uk³adu równañ bez sk³adowych leczenia

[t,y] = ode45(@model_de_Pillis, [0 120], x); % rozwi¹zanie uk³adu równañ ró¿niczkowych

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
hold on
semilogy(t, y(:,6), 'b');
legend('Tumor cells', 'Natural killer cells', 'CD8+ T cells', 'Circulating lymphocytes', 'IL2');
