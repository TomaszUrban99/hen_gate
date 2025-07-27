% Calculations based on AN5483 application guide
% Transistor IRF1405PbF (INFINEON)

fpwm = 20 * 10 ^3; % [Hz]
Vs = 24; % [V]

Ciss = 5480 * 10^(-12); % [F]
Crss = 280 * 10^(-12); % [F] Reverse transfer capacitance

Vghxh = Vs + 12; % [V]
Vglxh = Vs + 12; % [V]

% High side
Icp_hs = Ciss * ( Vghxh - Vs ) * fpwm;

% Low side
Icp_ls = ( Ciss * ( Vghxh - Vs) + Ciss * Vglxh + Crss * Vs) * fpwm;

% Instantaneous gate drive current