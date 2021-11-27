% Parameters
Dbuoy = 2.5; % buoy diameter, in m
wchain = 800; % chain weighing, in N/m
p = 1025; % seawater density, in kg/m^3
Cd = 0.9; % drag coefficient
Uc = 3; % current speed, in m/s
Tbuoy = 10; % draf of buoy, in m/s

% a) Horizontal Wave Force per Unit Length
horizontal_force_per_unit_length = 0.5 * Cd * p * Tbuoy * Uc^2; % N/m

% b) Total Horizontal Wave Force
total_horizontal_force = horizontal_force_per_unit_length * Dbuoy; % N

% c) Minimum Chain Length
fairlead_angle = pi / 4; % 45 degrees
minimum_chain_length = tan(fairlead_angle) * total_horizontal_force / wchain; % m
horizontal_distance_from_touchdown = (total_horizontal_force / wchain) * asinh(minimum_chain_length * wchain / total_horizontal_force); % m
tension_at_buoy = total_horizontal_force / cos(fairlead_angle); % N/m^2

% d) Horizontal Distance with axial stiffness
stifness = 3240 * 10^3; % N
horizontal_distance_from_touchdown_elastic = horizontal_distance_from_touchdown + total_horizontal_force * minimum_chain_length / stifness;

% e) Total Buoy Mass
g = 9.81; % gravitational accelarition at the earth surface, in kg*m/s^2
total_buoy_mass = 10^-3 * (p / 4 * g * Tbuoy * pi * Dbuoy^2 - wchain * minimum_chain_length) / g; % ton
