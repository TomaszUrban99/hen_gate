% Current limit Analog Devices - LT1158

V_sense = 110 * 10^(-3); % Voltage drop acros sense resistor [V]
I_out = 4; % Current limit [A]

R_sense = V_sense / I_out;
I = V_sense/0.03;

% High rush-in current limit
V_min = 1.2; % Minimum voltage drop across sense resistor [V]

% Rds(on)
Rdson_high = 28.5 * 10^(-3); 
Rdson_low = 17.5 * 10^(-3);

Rdson = Rdson_high + Rdson_low;

I_start = V_min / ( 1.7 * Rdson + 0.03 );

%  Rsense dissipated power
P_rsense = 11.09^2 * 0.03;