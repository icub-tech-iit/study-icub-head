% Simscape(TM) Multibody(TM) version: 7.4

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:headData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
headData.RigidTransform(5).translation = [0.0 0.0 0.0];
headData.RigidTransform(5).angle = 0.0;
headData.RigidTransform(5).axis = [0.0 0.0 0.0];
headData.RigidTransform(5).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
headData.RigidTransform(1).translation = [2.1999999999999997 107.59999999999999 -9.3999999999999986];  % mm
headData.RigidTransform(1).angle = 0;  % rad
headData.RigidTransform(1).axis = [0 0 0];
headData.RigidTransform(1).ID = 'UCS[IC_002_A_001_STDHEAD_SW0002_prt:104610]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
headData.RigidTransform(2).translation = [5.4999999999999627 108.98199999999974 -17.549999999999905];  % mm
headData.RigidTransform(2).angle = 3.1415926535897909;  % rad
headData.RigidTransform(2).axis = [-1.7161197504743736e-15 -0.70710678118654779 0.70710678118654724];
headData.RigidTransform(2).ID = 'UCS[IC_002_A_001_STDHEAD_SW0002_prt:104612]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
headData.RigidTransform(3).translation = [0.0016878364870265528 49 -8.6500000000000057];  % mm
headData.RigidTransform(3).angle = 2.0943951023931953;  % rad
headData.RigidTransform(3).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
headData.RigidTransform(3).ID = 'UCS[IC_002_A_001_STDHEAD_SW0002_prt:104614]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
headData.RigidTransform(4).translation = [0 0 0];  % mm
headData.RigidTransform(4).angle = 0;  % rad
headData.RigidTransform(4).axis = [0 0 0];
headData.RigidTransform(4).ID = 'UCS[IC_002_A_001_STDHEAD_SW0002_prt:104616]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
headData.RigidTransform(5).translation = [92.93667533938509 57.734336898346818 -67.835797803171261];  % mm
headData.RigidTransform(5).angle = 0;  % rad
headData.RigidTransform(5).axis = [0 0 0];
headData.RigidTransform(5).ID = 'SixDofRigidTransform[59]';


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
headData.Solid(1).mass = 0.0;
headData.Solid(1).CoM = [0.0 0.0 0.0];
headData.Solid(1).MoI = [0.0 0.0 0.0];
headData.Solid(1).PoI = [0.0 0.0 0.0];
headData.Solid(1).color = [0.0 0.0 0.0];
headData.Solid(1).opacity = 0.0;
headData.Solid(1).ID = '';

%Inertia Type - Custom
%Visual Properties - Simple
headData.Solid(1).mass = 1.8605600175092207;  % kg
headData.Solid(1).CoM = [0.0074828768161488085 36.280139274461142 -44.069704588599848];  % mm
headData.Solid(1).MoI = [7753.9166983163268 7533.1980804332243 5732.4208084720194];  % kg*mm^2
headData.Solid(1).PoI = [127.38312127405243 -105.96413393165177 30.00306193387091];  % kg*mm^2
headData.Solid(1).color = [0.5 0.5 0.5];
headData.Solid(1).opacity = 1;
headData.Solid(1).ID = 'IC_002_A_001_STDHEAD_SW0002_prt';

