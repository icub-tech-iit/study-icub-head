%% Initialization model parameters

Ts = 1e-3; % Sampling time

% outer transmission and actuators
driving_pulley_inertia = 0.021e-6; %kgm^2
driven_pulley_inertia = 0.0913e-6; %kgm^2
harmonic_drive_inertia = 0.3e-6; %kgm^2
head_inertia = 0.21;  % Kgcm2
motor_b = 1.2407e-4; % mNm/rpm
motor_inertia = 5.7e-7; % gcm^2
mech_filter_k = 200;    % Nm / rad
mech_filter_b = 20; % Nm / rad/s
timing_belt_ratio = 1.68;
hd_ratio = 100;
Res = 1.9;   % Ohm
K_tv = 13.4e-3;

%% Create uncertain system for Pitch model

pitch_operating_points = [-40, 0, 22]; % degrees

opt = findopOptions('DisplayReport','off');

ls_pitch = cell(1,length(pitch_operating_points));
op_points_pitch = cell(1,length(pitch_operating_points));
for i = 1:length(pitch_operating_points)
   [ls_pitch{i}, op_points_pitch{i}] = linearize_pitch('lumped_neck_with_motor_pitch', pitch_operating_points(i), opt);
end

tfu_pitch = build_uncertain_tf(ls_pitch);

%% Create uncertain system for Roll model

roll_operating_points = [-20, 0, 20]; % degrees

opt = findopOptions('DisplayReport','off');

ls_roll = cell(1,length(roll_operating_points));
op_points_roll = cell(1,length(roll_operating_points));
for i = 1:length(roll_operating_points)
   [ls_roll{i}, op_points_roll{i}] = linearize_roll('lumped_neck_with_motor_roll', roll_operating_points(i), opt);
end

tfu_roll = build_uncertain_tf(ls_roll);

%% plot of poles and zeros
figure()
pzmap(ls_pitch{:})
grid minor
title('Pole-zero map of uncertain pitch model')

figure()
pzmap(ls_roll{:})
grid minor
title('Pole-zero map of uncertain roll model')

subplot(2,2, 1)
step(ls_pitch{:}, 1)
grid minor
legend({'-40°','0°', '22°'}, 'location', 'northwest')
ylabel('Pitch (deg)')
title('Step response of linearized pitch model at different operating points')
subtitle('from pitch torque to pitch angle')

subplot(2,2, 2)
step(tfu_pitch, 1)
grid minor
ylabel('Pitch (deg)')
title('Uncertain pitch model response')
subtitle('from pitch torque to pitch angle')

subplot(2,2, 3)
step(ls_roll{:}, 1)
grid minor
legend({'-20°','0°', '20°'}, 'location', 'northwest')
ylabel('Roll (deg)')
title('Step response of linearized roll model at different operating points')
subtitle('from roll torque to roll angle')

subplot(2,2, 4)
step(tfu_roll, 1)
grid minor
ylabel('Roll (deg)')
title('Uncertain roll model response')
subtitle('from roll torque to roll angle')