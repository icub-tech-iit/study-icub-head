Study iCub Head – Simulations
=============================

This branch contains the material used to model the iCub head in MATLAB Simscape, and design the pitch and roll PID controllers.
It is split into two projects:
- `model-full` contains the full-fledged Simscape Multibody model exported directly from Creo
     - it is used to the actuators performance and the impact of non linear behaviour on the reference tracking
- `model-simplified` contains a Simscape Multibody model with just the roll and pitch joints, created as lumped components
    - it is used for creating the linearized models upon which the PIDs will be tuned