% POWER DISSIPATION
%

% Data
Vs = 12; % Supply voltage (added 2V margin) [V]
Iout = 10; % Output current [A]
f_pwm = 20 * 10^3; % PWM frequency [Hz]
DC = 0.8; % Duty cycle
T_amb_max = 50; % Max ambient temperature

% HIGH SIDE
R_ds_on_hs = 6.5 * 10^(-3); % Rds_on [Ohm] for High Side Mosfet (P-Channel)
R_th_j_a = 10;

% Rising and falling time data
t_f_hs = 0.7 * 10^(-6); % Falling time high side switch
t_r_hs = 0.8 * 10^(-6); % Rising time high side switch
t_f_ls = 0.4 * 10^(-6); % Falling time low side switch
t_r_ls = 0.4 * 10^(-6); % Rising time low side switch

% Switching times
t_hs_off = t_f_hs * 2;
t_hs_on = t_r_hs * 2;
t_ls_off = t_f_ls * 2;
t_ls_on = t_r_ls * 2;

% ON time - high side
T_pwm = 1/f_pwm; % PWM period
t_on_hs = T_pwm * DC - t_hs_off; 

% H - Bridge
% Actuator mosfet (HIGH SIDE)
P_HS = (Vs * Iout * t_hs_on * 0.5 + Vs * Iout * t_hs_off * 0.5 + Iout^2 * t_on_hs * R_ds_on_hs) * f_pwm;

% Junction temperature
T_j = P_HS * R_th_j_a + T_amb_max;