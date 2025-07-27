% Gate rise and fall time
% MOSFET: INFINEON IRF44Z
% GATE DRIVER: ANALOG DEVICES LT1158

% Calculation for IRF44z (Low side)
% Based on application note AN 5483

% Data
T_pcbmax = 100; % FR-4 pcb temperature max [C]
T_ambmax = 60; % max ambient temperature [C]
Rth_j_c = 1.5; % junction-case [C/W]

% Thermal resistance
Rth_c_s = 0.5; % Junction to sink [C/W]
Rth_s_a = 11; % Sink to ambient Aavid 7021B-MT
Rth_j_a = Rth_j_c + Rth_c_s + Rth_s_a; % Junction to ambient thermal resistance

I_load = 10; % Maximum expected motor current [A]
V_bat = 24; % Power supply [V]
I_aver = 4; % Average current [A]
f_pwm = 10 * 10^3; % PWM switchin frequency [Hz]
Rdson = 17.5 * 10^(-3); % Rdson mOhm

% MOSFET switching time determination
% (according to LT1158 datasheet);

% Switchin losses - first order estimation
Q_gate = 63 * 10^(-9); % Gate charge [C]
Cg = 2000 * 10^(-12); % Gate Ciss capacitance [C], for 24 V

% Switching time for given Cg
t_rise = 150 * 10 ^ (-9); % Top gate rise time
t_fall = 150 * 10 ^ (-9); % Top gate fall time

% Switching losses [W]
P_switch_loss = V_bat * I_aver * (t_fall + t_rise) * 0.5 * f_pwm;

% Conduction losses [W]
P_cond_loss = I_aver^2 * Rdson;

% Maximum power loss (PCB thermal safety)
P_diss_max = (T_pcbmax - T_ambmax) / (Rth_j_a - Rth_j_c);

% Junction temperature
T_junction = P_diss_max * Rth_j_a + T_ambmax;

% PCB temperature
T_pcb = T_junction - P_diss_max * Rth_j_c;

% Rds(on) max
Rdson_denom = I_load^2 * (Rth_j_a * (T_pcbmax + 125) - Rth_j_c * (125 + T_ambmax));
Rdson_nom = (150 * ( T_pcb - T_ambmax - P_switch_loss * Rth_j_c));
Rdson_max = Rdson_nom / Rdson_denom;

% Conclusion:
% Calculated value of Rdson_max = 33.8 mOhm 
% IRF540z Rdson = 26.5 mOhm