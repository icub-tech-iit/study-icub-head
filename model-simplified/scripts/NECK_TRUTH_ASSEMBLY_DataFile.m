% Simscape(TM) Multibody(TM) version: 7.3

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(9).translation = [0.0 0.0 0.0];
smiData.RigidTransform(9).angle = 0.0;
smiData.RigidTransform(9).axis = [0.0 0.0 0.0];
smiData.RigidTransform(9).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 44.131100468876376 0];  % mm
smiData.RigidTransform(1).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(1).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(1).ID = 'B[61:-:64]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [44.131100468876376 0 0];  % mm
smiData.RigidTransform(2).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(2).axis = [-0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(2).ID = 'F[61:-:64]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [2.3886912952514935e-15 -9.5 -21.050000000000001];  % mm
smiData.RigidTransform(3).angle = 1.2246063538223775e-16;  % rad
smiData.RigidTransform(3).axis = [0 1 0];
smiData.RigidTransform(3).ID = 'B[64:-:65]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [3.5527136788005009e-15 -9.4999999999999911 -21.049999999999997];  % mm
smiData.RigidTransform(4).angle = 2.8305244335018379e-16;  % rad
smiData.RigidTransform(4).axis = [0.19611613513818379 0.98058067569092022 2.7216581091363795e-17];
smiData.RigidTransform(4).ID = 'F[64:-:65]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0 0 0];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = 'B[65:-:66]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [-6.3108872417680944e-30 -2.1038422591447859e-15 1.4512583872714145e-14];  % mm
smiData.RigidTransform(6).angle = 0;  % rad
smiData.RigidTransform(6).axis = [0 0 0];
smiData.RigidTransform(6).ID = 'F[65:-:66]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [0 0 0];  % mm
smiData.RigidTransform(7).angle = 0;  % rad
smiData.RigidTransform(7).axis = [0 0 0];
smiData.RigidTransform(7).ID = 'B[66:-:69]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [-2.734068864061101e-15 -1.4210854715202007e-14 2.5084101462624631e-14];  % mm
smiData.RigidTransform(8).angle = 0;  % rad
smiData.RigidTransform(8).axis = [0 0 0];
smiData.RigidTransform(8).ID = 'F[66:-:69]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(9).translation = [0 0 0];  % mm
smiData.RigidTransform(9).angle = 0;  % rad
smiData.RigidTransform(9).axis = [0 0 0];
smiData.RigidTransform(9).ID = 'SixDofRigidTransform[61]';


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(5).mass = 0.0;
smiData.Solid(5).CoM = [0.0 0.0 0.0];
smiData.Solid(5).MoI = [0.0 0.0 0.0];
smiData.Solid(5).PoI = [0.0 0.0 0.0];
smiData.Solid(5).color = [0.0 0.0 0.0];
smiData.Solid(5).opacity = 0.0;
smiData.Solid(5).ID = '';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0;  % kg
smiData.Solid(1).CoM = [0 0 0];  % mm
smiData.Solid(1).MoI = [0 0 0];  % kg*mm^2
smiData.Solid(1).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(1).color = [0 0.59999999999999998 0.79999999999999993];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'NECK_TRUTH_SKEL_prt';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.1253903781893968;  % kg
smiData.Solid(2).CoM = [-0.036355144844804309 -6.6192618216329544 -6.3818807777693589];  % mm
smiData.Solid(2).MoI = [40.518061490514512 38.650241626769315 47.36315111962216];  % kg*mm^2
smiData.Solid(2).PoI = [-9.3794733906722616 0.099986257475236817 0.059058798671637561];  % kg*mm^2
smiData.Solid(2).color = [0.5 0.5 0.5];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'SIM_HEAD_NECK_2_PITCH_prt';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.1899993877889532;  % kg
smiData.Solid(3).CoM = [0.082423519908561005 -45.598463224488782 1.2660800871583167];  % mm
smiData.Solid(3).MoI = [123.73579888297436 41.27687799077885 110.66755036740636];  % kg*mm^2
smiData.Solid(3).PoI = [-10.314035714790887 -0.37225329416436609 -0.54134805469553138];  % kg*mm^2
smiData.Solid(3).color = [0.5 0.5 0.5];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = 'SIM_HEAD_NECK_3_ROLL_prt';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.029541890153943335;  % kg
smiData.Solid(4).CoM = [-0.00068015082641543307 -69.25200203753657 0.53566425745050206];  % mm
smiData.Solid(4).MoI = [2.5704577324427111 2.0715345067875139 2.5367140520662947];  % kg*mm^2
smiData.Solid(4).PoI = [0.16133341384736455 0 0.00025913077676866067];  % kg*mm^2
smiData.Solid(4).color = [0.5 0.5 0.5];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = 'SIM_HEAD_NECK_4_YAW_prt';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(5).mass = 1.9178695249913225;  % kg
smiData.Solid(5).CoM = [0.012492365855028926 -107.10359851097159 -14.802582145980809];  % mm
smiData.Solid(5).MoI = [11921.802442228563 12787.409129055259 10368.330175673053];  % kg*mm^2
smiData.Solid(5).PoI = [-35.482509008400939 0.17432139015045151 -0.29525196582062341];  % kg*mm^2
smiData.Solid(5).color = [0.5 0.5 0.5];
smiData.Solid(5).opacity = 1;
smiData.Solid(5).ID = 'SIM_HEAD_HEAD_2_prt';


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(2).Rz.Pos = 0.0;
smiData.RevoluteJoint(2).ID = '';

smiData.RevoluteJoint(1).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(1).ID = '[61:-:64]';

smiData.RevoluteJoint(2).Rz.Pos = -2.8624992133171654e-14;  % deg
smiData.RevoluteJoint(2).ID = '[64:-:65]';

