clc; clear; close all;

%% 1. Parâmetros Reais do Motor EMRAX 208 (HV LC)
P     = 10;            % Número de pares de polos
Rs    = 25.68e-3;      % Resistência estatórica por fase (Ohms)
Ld    = 220e-6;        % Indutância de eixo d (Henry)
Lq    = 230e-6;        % Indutância de eixo q (Henry)
L     = (Ld + Lq) / 2; % Indutância média equivalente (Henry)
phi_m = 0.05867;       % Fluxo magnético dos ímãs permanentes (Wb ou V.s)

%% 2. Parâmetros Mecânicos
J = 0.0239;            % Inércia rotacional (kg.m^2)
D = 5e-5;              % Atrito viscoso (N.m.s/rad)

%% 3. Condições de Operação e Carga
TL_step    = 20;       % Degrau de torque de carga (Nm)
w_ref      = 600;      % Velocidade angular de referência (rad/s)
t_ramp     = 0.5;      % Tempo de rampa de partida (s)
slope_w    = w_ref / t_ramp; % Rampa de aceleração suave (600 rad/s^2)

%% 4. Parâmetros do Inversor e SVPWM
Vdc   = 400;           % Tensão nominal de barramento HV (V)
V_max = Vdc / sqrt(3); % Limite do hexágono linear (~230.94 V)
f_sw  = 10000;         % Frequência de chaveamento do SVPWM (10 kHz)
Tpwm  = 1 / f_sw;      % Período de modulação (100 µs = 1e-4 s)
T_sw  = Tpwm;          % Alias de período
T_s = 1e-4;

%% 5. Ganhos dos Controladores PI
% Malhas Internas de Corrente (Eixos d e q) - Cancelamento Polo-Zero
wb_i = 2 * pi * 400;   % Banda passante da malha de corrente (400 Hz)
Kp_i = 1.5;            % Ganho proporcional de corrente
Ki_i = 150.0;          % Ganho integral de corrente

% Malha Externa de Velocidade   
Kp_w = 2.0;            % Ganho proporcional de velocidade
Ki_w = 10.0;           % Ganho integral de velocidade

% Limites de Saturação
I_max = 100;           % Corrente máxima de quadratura (A)

disp('Parâmetros carregados com sucesso no Workspace!');