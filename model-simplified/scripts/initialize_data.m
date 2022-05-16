%% Discrete sampling time
Ts = 1e-3;

%% Define outer transmission parameters
driving_pulley_inertia = 0.021e-6; %kgm^2
driven_pulley_inertia = 0.0913e-6; %kgm^2
harmonic_drive_inertia = 0.3e-6; %kgm^2
head_inertia = 0.21;
motor_b = 1.2407e-4; % mNm/rpm
motor_inertia = 5.7e-7; % gcm^2
mech_filter_k = 200;
mech_filter_b = 20;
timing_belt_ratio = 1.68;
hd_ratio = 100;
Res = 1.9;
K_tv = 13.4e-3;

%% Define neck waypoints
wp = [ 0, 25, 25, -25, -25, -25, -25, 25, 25, 0;
       0, 11, 11,  11,  11, -11, -11, -11, -11, 0];

tp = 0:size(wp, 2)-1;

vel_bounds = zeros(size(wp));
accel_bounds = zeros(size(wp));