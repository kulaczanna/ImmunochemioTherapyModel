clc; clear all
close all

n = 2; % wyb�r przypadku - 1 st�umienie nowotworu, 2 wzrost nowotworu

switch n
    case 1
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e5;% natural killer cells N(t)
        L_0 = 1e2;% CD8+T cells L(t)
        C_0 = 6e10;% cell C(t)
        I_0 = 0;% concentration of IL-2 I(t)
        I_alfa_0 = 0;% concentration of INF-a Ia(t)
        M_0 = 0;% concentration of chemotherapy drug M(t)
    case 2
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        I_0 = 0;% concentration of IL-2 I(t)
        I_alfa_0 = 0;% concentration of INF-a Ia(t)
        M_0 = 0;% concentration of chemotherapy drug M(t)
end

% I_alfa = I_alfa_0;
% x = [T_0; N_0; L_0; C_0; M_0; I_0; I_alfa_0; I_alfa];

x = [T_0; N_0; L_0; C_0; M_0; I_0; I_alfa_0]; % parametry wej�ciowe  uk�adu r�wna�

[t,y] = ode45(@model_immuno_chemio_therapy, [0 120], x); % rozwi�zanie uk�adu r�wna� r�niczkowych

% wy�wietlenie wykres�w
figure
plot(t, y(:,1), 'b');
legend('Tumor cells');
figure
plot(t, y(:,2), 'g');
legend('Natural killer cells');
figure
plot(t, y(:,3), 'r');
legend('CD8+ T cells');
figure
plot(t, y(:,4), 'c');
legend('Circulating lymphocytes');

% % legend('T');
% hold on
% % subplot(2,2,2)
% plot(t, y(:,2), 'g');
% % legend('N');
% hold on
% % subplot(2,2,3)
% plot(t, y(:,3), 'r');
% % legend('L');
% hold on
% subplot(2,2,4)
% plot(t, y(:,4), 'c');
% legend('C');
% legend({'T'; 'N'; 'L'; 'C'; 'I'; 'Ialfa'; 'M'})


