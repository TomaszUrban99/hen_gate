% IFX007T - current sense

dk_ILIS = [ 15 19.5 24 ] * 10^3;

% Maximum analog sense current,
% Sense current in fault condition
I_ISlim = [ 4.1 5 6.1 ] * 10^(-3);
R_12 = [ 0 0 0 ];

% Max uC input voltage level STM32G4
Vdd = 3.3; % Supply voltage

V_ref_int = [ 1.182 1.212 1.232 ]; % Internal reference voltage

I_max = 10; % Max current [A]

% U = R * I
% 2 V / 6.1 mA 
for i=1:length(R_12)
    R_12(i) = 3/I_ISlim(i);
end


