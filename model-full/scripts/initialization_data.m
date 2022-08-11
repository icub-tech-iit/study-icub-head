
%% Define neck Trajectory

pr = 20;
rr = 10;

durations = [ 0,  1,  1,   1,   1, 0.5, 1,  1,  1,   1,   1, 0.5, 1,  1,  1,  1,    1, 0.5, 0.5];

% waypoints [pitch; roll] in degrees
wp = [ 0, pr, pr, -pr, -pr,   0, 0,  0,  0,   0,   0,   0, 0, pr, pr, -pr, -pr,   0,    0;
              0,  0,  0,   0,   0,   0, 0, rr, rr, -rr, -rr,   0, 0, rr, rr, -rr, -rr,   0,   0];

wp = [ 0, 0, 20, 20, -20, -20, 0 , 0, 0,  0, 0, 0, 0;
       0, 0,  0, 0, 0, 0, 0, 0, 10, 10, -10, -10, 0];

% Uncomment this line to add the joint offset to the reference trajectory
% Useful when computing inverse dynamics
% wp = wp + [smiData.RevoluteJoint(3).Rz.Pos; smiData.RevoluteJoint(6).Rz.Pos];

% timepoints
% tp = cumsum(durations);
tp = 0:size(wp, 2)-1;
vel_bounds = zeros(size(wp));
accel_bounds = zeros(size(wp));

% --------------------------------------------------------

%% Model parameters

% Cable pulleys
side_pulley_diam = 30.5; % mm
side_pulley_len = 5; %mm
front_pulley_diam = 31.7; % mm
front_pulley_len = 5; %mm
small_pulley_diam = 11; % mm
small_pulley_len = 1.5; % mm

% Harmonic drive data
harmonic_drive_ratio = 100;

% Lost motion range when accounting for backlash
harmonic_drive_lost_motion = 1 / 60; % degrees

% Multiply by 0.04 to account for lost motion measured at 4% of nominal
% torque by datasheet spec
% harmonic_drive_Tout_nominal = 2.4; % Nm
% harmonic_drive_lost_motion_stiffness = harmonic_drive_Tout_nominal * 0.04 / deg2rad(harmonic_drive_lost_motion_degraded / 2);
harmonic_drive_torsional_stiffness = 2933;  % Nm/rad average of K1 K2 and K3 from datasheet

% --------------------------------------------------------
% Mechanical filter parameters 2nd stage
torsional_filter_spring_stiffness = 200; % Nm/rad
torsional_filter_viscous_friction = 20; % Nm/(rad/s)

% Chain drive parameters
timing_pulley_driving_radius = 11.64 / 2; % mm
timing_pulley_driven_radius = 13.58 / 2; % mm

timing_pulley_stiffness = torsional_filter_spring_stiffness / (timing_pulley_driven_radius / 1000)^2 / harmonic_drive_ratio^2;
timing_pulley_damping = torsional_filter_viscous_friction/ (timing_pulley_driven_radius / 1000)^2 / harmonic_drive_ratio^2;

% --------------------------------------------------------
% Motors parameters
DCMotor.Vcc = 12; % V
DCMotor.R = 1.9; % ohm
DCMotor.L = 65; % uH
DCMotor.kt = 13.4; % mN*m/A
DCMotor.inertia = 5.7; % g*cm2
DCMotor.damping = (DCMotor.inertia * 0.075) / 8100; % mN*m/rpm

LUT.R = repmat(timing_pulley_driven_radius / 1000, 361, 1);
LUT.q = (0:pi/180:2*pi)';

% --------------------------------------------------------
%% Controllers default values
roll_pitch_pid.p = 9;
roll_pitch_pid.i = 3;
roll_pitch_pid.d = 0.2;
roll_pitch_pid.n = 100;
u_min = -100;
u_max = 100;

Cz_pitch.Kp = roll_pitch_pid.p;
Cz_pitch.Ki = roll_pitch_pid.i;
Cz_pitch.Kd = roll_pitch_pid.d;
Cz_pitch.Tf = 1/roll_pitch_pid.n;

Cz_roll.Kp = roll_pitch_pid.p;
Cz_roll.Ki = roll_pitch_pid.i;
Cz_roll.Kd = roll_pitch_pid.d;
Cz_roll.Tf = 1/roll_pitch_pid.n;

yaw_pid.p = 9;
yaw_pid.i = 3;
yaw_pid.u_min = -100;
yaw_pid.u_max = 100;

%% Model corrections

% Base rotation: corresponds to a rotated torso
base_rotation_seq = [-90, 0, 0]; % XYX Rotation


robot_name = 'icub';

if(strcmp(robot_name, 'icub'))
    % iCub
    head_mounting_rotation_seq = [0 90 0]; % XYX Rotation deg
    head_mounting_translation = [21.05 -7.7 0]; % Cartesian mm
else
    % ergoCub
    head_mounting_rotation_seq = [180 90 0]; % XYX Rotation deg
    head_mounting_translation = [70 165.5 -69]; % Cartesian mm
end


%% Impairments

degrading_factors.timing_pulley_stiffness = 1;
degrading_factors.timing_pulley_damping = 1;
degrading_factors.hd_torsional_stiffness = 1;
degrading_factors.hd_lost_motion = 1;
degrading_factors.pid_detune = 1;

slack = 0; % mm

harmonic_drive_lost_motion = degrading_factors.hd_lost_motion * harmonic_drive_lost_motion; % degrees
