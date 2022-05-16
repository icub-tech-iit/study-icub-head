function [sys, op] = linearize_roll(model, roll_op_point, options) 

sprintf('Finding operating point for roll=%.1f', roll_op_point)

[op, opreport] = autogen_find_operating_points_roll(model, roll_op_point, options);

% Get the analysis I/Os from the model
io = getlinio(model);

%% Linearize the model
sys = linearize(model, op);

end