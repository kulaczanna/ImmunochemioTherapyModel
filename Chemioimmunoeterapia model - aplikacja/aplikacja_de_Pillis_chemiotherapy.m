clc; clear all
close all

n = 1; % wybór przypadku - 1 chemio dawki co 5 dni, 2 chemio dawki co 10 dni
liczba_dni_w_cyklu = 5;

switch n
    case 1
        T_0 = 6e6;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        M_0 = 0; % chemo concentration
       

    case 2
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        M_0 = 0; % chemo concentration
        n = 2;
end
       

x = [T_0; N_0; L_0; C_0; M_0; liczba_dni_w_cyklu]; % parametry wejœciowe  uk³adu równañ bez sk³adowych leczenia
t = 0 : 1/24 : 120;
[t,y] = ode45(@model_de_Pillis_chemiotherapy, t, x); % rozwi¹zanie uk³adu równañ ró¿niczkowych

% wyœwietlenie wykresów
figure
semilogy(t, y(:,1), 'b');
hold on
semilogy(t, y(:,2), 'g');
legend();
hold on
semilogy(t, y(:,3), 'r');
hold on
semilogy(t, y(:,4), 'c');
axis([0, 120, 10e-1, 10e12])
legend('Komórki nowotworowe', 'Komórki NK', 'Limfocyty T_{CD8+}', 'Kr¹¿¹ce limfocyty');
ylabel('Liczba komórek')
xlabel('Czas [dni]')

figure
plot(t, y(:, 5), 'g');
legend('chemo concentration')
ylabel('Stê¿enie cytostatyku')
xlabel('Czas [dni]')