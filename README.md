Study iCub Head – Simulations
=============================


This branch contains the material used to model the iCub head in MATLAB Simscape, and design the pitch and roll PID controllers.
It is split into two projects:
- `model-full` contains the full-fledged Simscape Multibody model exported directly from Creo
     - it is used to evaluate the actuators performance and the impact of non linear behaviour on the reference tracking
- `model-simplified` contains a Simscape Multibody model with just the roll and pitch joints, created as lumped components
    - it is used for creating the linearized models upon which the PIDs will be tuned

## Requirements
 - MATLAB  >= R2021b
 - Simulink
 - Control System Toolbox
 - Robust Control Toolbox
 - Simscape Toolbox
 - Simscape Driveline Toolbox
 - Simscape Electrical Toolbox
 - Simscape Multibody Toolbox
 - (optional) Parallel Computing Toolbox

## Usage

### Running `model-full`
Double click on the MATLAB project file `neck-study-full.prj`. Upon opening, the Simulink model `neck_head_control.slx` will be opened and the controllers will be imported.
To run the simulation simply click on `Run`.
### Running `model-simplified`

Double click on the MATLAB project file `neck-study-simplified.prj`. This project contains scripts for running the robust tuning procedure using uncertain models.

To create the uncertain roll and pitch transfer function, run the script `create_uncertain_models.m`.

To run the robust tuning, run the script `launch_autotune.m`. This script assumes that the transfer functions are present in the workspace. If you do not want to run the creation script, you can load the workspace file `model_transfer_functions.mat` by double clicking it or with `load('model_transfer_functions.mat)`.

You can save the controllers with the command
```matlab
save('your-desired-filename.mat', 'Cz_pitch', 'Cz_roll')
```
for future use with the full Simscape model.
