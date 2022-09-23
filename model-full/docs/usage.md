Usage
============
This document provides information on how to run the Simulink models of the neck mechanism. The project takes advantage of the Simscape toolbox to accurately simulate the dynamics of the mechanism, from the motors to the tendons driving the pulleys.

## Required Toolboxes
For the Simulink modelling:
- Simscape: Driveline, Electrical, Multibody
- Control System Toolbox

## Launch the provided model
Open up the main MATLAB project located in the root level, called `neck-study-full.prj`. The project file will open the complete Simulink model, called `neck_head_control.slx`. Clicking the *Run* button will compile the model and launch the simulation.

## Appendix: Importing CAD models in Simscape
The Simulink model provided in the repository contains all the components and controllers needed for proper simulation. However, it is possible to create a new Simscape model from the provided CAD assets for further testing.
The `smimport` command will generate a Simscape Multibody model representing the mechanism, together with a `.m` script containing the necessary dynamic and kinematic parameters.
First launch the main MATLAB project. Then, to import the neck mechanism, type in the command window:
```matlab
mdl = smimport('resources_simscape/RC_IIT_023_G_063.xml');
```
To import the head, type in the command window:
```matlab
mdl = smimport('resources_head_icub/ICUB27_HEAD.xml', 'VariableName', 'headData');
```
