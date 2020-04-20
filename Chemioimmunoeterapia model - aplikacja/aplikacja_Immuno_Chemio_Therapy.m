clc; clear all
close all
format long

n = 3; % wyb�r przypadku - 1 st�umienie nowotworu, 2 wzrost nowotworu

switch n
    case 1
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e5;% natural killer cells N(t)
        L_0 = 1e2;% CD8+T cells L(t)
        C_0 = 6e10;% cell C(t)
        I_0 = 0;% concentration of IL-2 I(t)
        I_alfa_0 = 10;% concentration of INF-a Ia(t)
        M_0 = 0;% concentration of chemotherapy drug M(t)
        liczba_dni_w_cyklu = 10;
   
    case 2
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        I_0 = 0;% concentration of IL-2 I(t)
        I_alfa_0 = 0;% concentration of INF-a Ia(t)
        M_0 = 0;% concentration of chemotherapy drug M(t)
        liczba_dni_w_cyklu = 10;
    
    case 3 
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e5;% natural killer cells N(t)
        L_0 = 1e2;% CD8+T cells L(t)
        C_0 = 6e10;% cell C(t)
        I_0 = 0;% concentration of IL-2 I(t)
        I_alfa_0 = 0;% concentration of INF-a Ia(t)
        M_0 = 0;% concentration of chemotherapy drug M(t)
        liczba_dni_w_cyklu = 10;
        
    case 4 
        T_0 = 7e6;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        I_0 = 0;% concentration of IL-2 I(t)
        I_alfa_0 = 0;% concentration of INF-a Ia(t)
        M_0 = 0;% concentration of chemotherapy drug M(t)
        liczba_dni_w_cyklu = 10;
end

x = [T_0; N_0; L_0; C_0; M_0; I_0; I_alfa_0; liczba_dni_w_cyklu]; % parametry wej�ciowe  uk�adu r�wna�

[t,y] = ode45(@model_Immuno_Chemio_Therapy, [0 120], x); % rozwi�zanie uk�adu r�wna� r�niczkowych

% wy�wietlenie wykres�w
figure
semilogy(t, y(:,1), 'b');
hold on
semilogy(t, y(:,2), 'g');
hold on
semilogy(t, y(:,3), 'r');
hold on
semilogy(t, y(:,4), 'c');
hold on
semilogy(t, y(:,5), 'k');
hold on
semilogy(t, y(:,6), 'k');
hold on
semilogy(t, y(:,7), 'y');
axis([0, 120, 10e-1, 10e12])
legend('Tumour', 'Natural killer cells', 'CD8+ T cells', 'Circulating lymphocytes', 'Chemotherapy drug', 'IL2', 'IFN-alfa');
