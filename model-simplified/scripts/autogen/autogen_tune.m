%% Create system data with slTuner interface
TunedBlocks = {'NECK_TRUTH_ASSEMBLY/Controller/PID Controller'};
AnalysisPoints = {'NECK_TRUTH_ASSEMBLY/Controller/1'; ...
                  'lumped_neck/up/1'; ...
                  'NECK_TRUTH_ASSEMBLY/Encoder pitch/1'; ...
                  'lumped_neck/Joints/1'; ...
                  'NECK_TRUTH_ASSEMBLY/rp/1'};
% The operating point variable is an array, create each element separately.
OperatingPoints(3) = operpoint('NECK_TRUTH_ASSEMBLY');
OperatingPoints(3).Time = 0;
OperatingPoints(3).States(1).x = 0; % NECK_TRUTH_ASSEMBLY/Controller/PID Controller/Filter/Disc. Forward Euler Filter/Filter
OperatingPoints(3).States(2).x = 0; % NECK_TRUTH_ASSEMBLY/Controller/PID Controller/Integrator/Discrete/Integrator
OperatingPoints(3).States(3).x = 0; % NECK_TRUTH_ASSEMBLY/Controller/PID Controller1/Filter/Disc. Forward Euler Filter/Filter
OperatingPoints(3).States(4).x = 0; % NECK_TRUTH_ASSEMBLY/Controller/PID Controller1/Integrator/Discrete/Integrator
OperatingPoints(3).States(5).x = 0; % NECK_TRUTH_ASSEMBLY/Encoder pitch/Unit Delay
OperatingPoints(3).States(6).x = 0; % NECK_TRUTH_ASSEMBLY/Encoder roll/Unit Delay1
OperatingPoints(3).States(7).x = [0;0]; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/Config/Solver Configuration/EVAL_KEY/INPUT_1_1_1
OperatingPoints(3).States(8).x = [0;0]; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/Config/Solver Configuration/EVAL_KEY/INPUT_2_1_1
OperatingPoints(3).States(9).x = 0; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/pitch_revolute
OperatingPoints(3).States(10).x = 0; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/pitch_revolute
OperatingPoints(3).States(11).x = 0; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/roll_revolute
OperatingPoints(3).States(12).x = 0; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/roll_revolute
OperatingPoints(3).Inputs(1).u = 0;
OperatingPoints(2) = operpoint('NECK_TRUTH_ASSEMBLY');
OperatingPoints(2).Time = 0;
OperatingPoints(2).States(1).x = 0; % NECK_TRUTH_ASSEMBLY/Controller/PID Controller/Filter/Disc. Forward Euler Filter/Filter
OperatingPoints(2).States(2).x = 0; % NECK_TRUTH_ASSEMBLY/Controller/PID Controller/Integrator/Discrete/Integrator
OperatingPoints(2).States(3).x = 0; % NECK_TRUTH_ASSEMBLY/Controller/PID Controller1/Filter/Disc. Forward Euler Filter/Filter
OperatingPoints(2).States(4).x = 0; % NECK_TRUTH_ASSEMBLY/Controller/PID Controller1/Integrator/Discrete/Integrator
OperatingPoints(2).States(5).x = 0; % NECK_TRUTH_ASSEMBLY/Encoder pitch/Unit Delay
OperatingPoints(2).States(6).x = 0; % NECK_TRUTH_ASSEMBLY/Encoder roll/Unit Delay1
OperatingPoints(2).States(7).x = [0;0]; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/Config/Solver Configuration/EVAL_KEY/INPUT_1_1_1
OperatingPoints(2).States(8).x = [0;0]; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/Config/Solver Configuration/EVAL_KEY/INPUT_2_1_1
OperatingPoints(2).States(9).x = 0.2618; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/pitch_revolute
OperatingPoints(2).States(10).x = 0; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/pitch_revolute
OperatingPoints(2).States(11).x = 0; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/roll_revolute
OperatingPoints(2).States(12).x = 0; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/roll_revolute
OperatingPoints(2).Inputs(1).u = 0;
OperatingPoints(1) = operpoint('NECK_TRUTH_ASSEMBLY');
OperatingPoints(1).Time = 0;
OperatingPoints(1).States(1).x = 0; % NECK_TRUTH_ASSEMBLY/Controller/PID Controller/Filter/Disc. Forward Euler Filter/Filter
OperatingPoints(1).States(2).x = 0; % NECK_TRUTH_ASSEMBLY/Controller/PID Controller/Integrator/Discrete/Integrator
OperatingPoints(1).States(3).x = 0; % NECK_TRUTH_ASSEMBLY/Controller/PID Controller1/Filter/Disc. Forward Euler Filter/Filter
OperatingPoints(1).States(4).x = 0; % NECK_TRUTH_ASSEMBLY/Controller/PID Controller1/Integrator/Discrete/Integrator
OperatingPoints(1).States(5).x = 0; % NECK_TRUTH_ASSEMBLY/Encoder pitch/Unit Delay
OperatingPoints(1).States(6).x = 0; % NECK_TRUTH_ASSEMBLY/Encoder roll/Unit Delay1
OperatingPoints(1).States(7).x = [0;0]; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/Config/Solver Configuration/EVAL_KEY/INPUT_1_1_1
OperatingPoints(1).States(8).x = [0;0]; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/Config/Solver Configuration/EVAL_KEY/INPUT_2_1_1
OperatingPoints(1).States(9).x = 0.5236; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/pitch_revolute
OperatingPoints(1).States(10).x = 0; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/pitch_revolute
OperatingPoints(1).States(11).x = 0; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/roll_revolute
OperatingPoints(1).States(12).x = 0; % NECK_TRUTH_ASSEMBLY/Model|lumped_neck/Joints/roll_revolute
OperatingPoints(1).Inputs(1).u = 0;
% Specify the custom options
Options = slTunerOptions('RateConversionMethod','tustin',...
                 'AreParamsTunable',true);
% Create the slTuner object
CL0 = slTuner('NECK_TRUTH_ASSEMBLY',TunedBlocks,AnalysisPoints,OperatingPoints,Options);
CL0.Ts = 0.001; % Specify the sample time

%% Create tuning goal to shape how the closed-loop system responds to a specific input signal
% Inputs and outputs
Inputs = {'NECK_TRUTH_ASSEMBLY/rp/1'};
Outputs = {'NECK_TRUTH_ASSEMBLY/Encoder pitch/1'};
% Tuning goal specifications
Tau = 0.2; % Time constant
Overshoot = 20; % Overshoot (%)
% Create tuning goal for step tracking
StepTrackingGoal1 = TuningGoal.StepTracking(Inputs,Outputs,Tau,Overshoot);
StepTrackingGoal1.Name = 'StepTrackingGoal1'; % Tuning goal name

%% Create option set for systune command
Options = systuneOptions();
Options.Display = 'off'; % Tuning display level ('final', 'sub', 'iter', 'off')
Options.RandomStart = 4; % Number of randomized starts

%% Set soft and hard goals
SoftGoals = [];
HardGoals = [ StepTrackingGoal1 ];

%% Tune the parameters with soft and hard goals
[CL1,fSoft,gHard,Info] = systune(CL0,SoftGoals,HardGoals,Options);

%% View tuning results
viewSpec([SoftGoals;HardGoals],CL1);
