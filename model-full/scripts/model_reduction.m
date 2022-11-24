%% Full model reduction
% Interactive script to choose between running the model reduction in the
% MATLAB Model Reducer application or the script. The resulting output
% model is the same.

user_input = input("Please select an option for the model reduction and press ENTER:\n" + ...
    "1 - Open the session file \'ModelReducerSession.mat\' in the GUI application\n" + ...
    "2 - Run the model reduction script\n" + ...
    "0 - Cancel and exit\n\n");

if(user_input == 1)
    modelReducer("../data/ModelReducerSession.mat")
elseif (user_input == 2)
    % Reduce LTI model order using balanced truncation

    load("icub_head_full_model_linearized.mat")

    System = icub_head_full_model_linearized_wrapper.System; % Define System to reduce
    Order = 18;
     
    % Create option set for balred command
    Options = balredOptions();
     
    % Compute reduced order approximation
    icub_head_full_model_linearized_reduced = balred(System,Order,Options);
     
    % Create comparison plot
    bode(System, icub_head_full_model_linearized_reduced);
    grid minor
else
    disp("Operation canceled.")
end
