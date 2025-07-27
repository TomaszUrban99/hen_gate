% LT1158ISW bootstrap calculation
% MOSFET: INFINEON IRF540z
%
% Based on: Bootstrap components selection by Texas Industries
% 
% Sized to have enough energy to drive the gate of the high-side MOSFET
% without being depleted more than 10%
% 
% Boostrap capacitor should be at least 10 times greater than the gate
% capacitance of the high side FET

% Data
Qg = 63 * 10^(-9); % Total gate charge

Vdd = 24; % Supply voltage
Vforwad_bootstrap = 0.6; % Forward voltage drop - bootstrap diode
Vg = Vdd - Vforwad_bootstrap; 

Cg = Qg / Vg; % Gate capacitance

% Required bootstrap capacitance
Cbootstrap_req = Cg * 10;

% In project (example application LT1158)
% Remeber to take cap with voltage rate above 2*Vdd
Cboot = 0.1 * 10^(-6);

% Peak current - bootstrap diode
dV = 34; % Voltage change
f_pwm = 10 * 10^(3); % PWM frequency
T = 1/f_pwm; % Period

% Peak diode current [A]
Ipeak = Cboot * (dV/T);

% LT1158 supply current
Idc = 18 * 10^(-3); % DC supply current

Isup = Idc + (Qg/(T)) * 2; % Supply current calculated fro
R = 110;    % Thermal resistance
Ta = 70; % Ambient temperature (maximum value for LT1158C)

% Junction temperature (TAKE LT1158ISW)
Tj = Ta + (Isup * Vdd * R);