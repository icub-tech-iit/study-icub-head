%% Model parameters

% Cable pulleys
side_pulley_diam = 30.5; % mm
side_pulley_len = 5; %mm
front_pulley_diam = 31.7; % mm
front_pulley_len = 5; %mm
small_pulley_diam = 11; % mm
small_pulley_len = 1.5; % mm

% altezza_tra_pitch_e_roll = 9.5; % mm
% altezza_tra_roll_e_small = 22.5; %mm
% distanza_tra_small_orizzontale = 22; %mm
% distanza_tra_asse_pitch_e_small_orizzontale = 17; % mm
% distanza_tra_pitch_e_front_e_rear_orizzontale = 17.8; % mm

%% Define neck Trajectory

% waypoints [pitch; roll] in degrees
wp = [ 0, 22, 22, -40, -40, 0;
       0, 20, 20, -20, -20, 0];

% Uncomment this line to add the joint offset to the reference trajectory
% Useful when computing inverse dynamics
% wp = wp + [smiData.RevoluteJoint(3).Rz.Pos; smiData.RevoluteJoint(6).Rz.Pos];

% timepoints
%tp = [0, 0.5, 1.5, 0.5, 1.5, 0.5, 1.5, 0.5, 1.5, 0.5, 1.5, 0.5, 1.5, 0.5, 1.5, 0.5, 1.5, 0.5, 1.5, 0.5, 1.5];
%tp = cumsum(tp);
tp = 0:size(wp, 2)-1;
vel_bounds = zeros(size(wp));
accel_bounds = zeros(size(wp));

% --------------------------------------------------------
%% Parameters
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
%% Controllers
roll_pitch_pid.p = 9;
roll_pitch_pid.i = 3;
roll_pitch_pid.d = 0.2;
roll_pitch_pid.n = 100;
roll_pitch_pid.u_min = -100;
roll_pitch_pid.u_max = 100;

yaw_pid.p = 10;
yaw_pid.i = 5;
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
