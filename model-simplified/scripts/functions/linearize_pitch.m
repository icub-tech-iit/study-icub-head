function [sys, op] = linearize_pitch(model, pitch_op_point, options) 

sprintf('Finding operating point for pitch=%.1f', pitch_op_point)

[op, opreport] = autogen_find_operating_points_pitch(model, pitch_op_point, options);

% Get the analysis I/Os from the model
io = getlinio(model);

%% Linearize the model
sys = linearize(model,io, op);

end