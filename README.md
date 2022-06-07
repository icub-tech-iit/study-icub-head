Mathworks-tech-article
===============

Proposed table of contents:

# 1. Scenario
**The iCub Robot**
Very brief history of iCub as a platform and its distribution in the world.
Some details on its joints, sensors, motors, and the neck mechanism
 **Challenges that arise from robot evolution**
Controlling the robot means designing a controller that is capable of both satisfying design requirements and being robust to upgrades that can change its dynamic parameters. 
For example, new actuators that increase performance, or heavier CPUs that change the position of the center of mass of the head. 

# 2. Objective
**Build a digital twin of the iCub head**
Find out how to build the most accurate model possible of the head, starting from the CAD assembly
**Minimize human intervention on controllers tuning**
Automatic tuning procedures are robust and well established as long as the model is realistic enough.
We needed to take advantage of that.
**Leverage matlab's automatic tools**
Praise Mathwork's tooling for its capabilities: simscape modelling, linearization, autotuning, etc

# 3. Workflow
 **Import CAD into simscape**
How we managed the export process of the neck: minimal modification on the CAD assembly, fine tune of the imported Simscape model (refer to https://github.com/icub-tech-iit/ergocub-design-head/blob/sim/neck-mechanism-study/docs/modelling.md)
Talk about reproduction of the tendons circuit (emphasis), mention the modelling of the outer transmission with the timing belt.
**Uncertain system modeling**
Create a simplified model of the neck by merging CAD parts, and use that to linearize the resulting Simscape model in different operating points. The models resulted from the linearization create an uncertain system.
**Autotuning**
Run the automatic tuning procedure after setting the soft and hard goals.

# 4. Tests
A brief overview of the simulation results before and after the retuning process.
Same thing on the robot.

# 5. Conclusions
**Advantages**
Stress the fact that's it's a further step into model-based design. This pipeline allows to build complex models and test them thorougly, in order to build better robots and improve the existing ones.
**Future developments**
Modelling of additional effects and disturbances? Modelling other parts of the robots? speedgoat?

