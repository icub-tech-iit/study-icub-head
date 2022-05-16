%% Specify the model name
model = 'lumped_neck_with_motor_roll';

roll_operating_points = [-20, 0, 20]; % degrees

%% Create the operating point specification object.
% Create the options
opt = findopOptions('DisplayReport','iter');

ls = cell(1,length(roll_operating_points));
op_points_roll = cell(1,length(roll_operating_points));
for i = 1:length(roll_operating_points)
   [ls{i}, op_points_roll{i}] = linearize_roll(model, roll_operating_points(i), opt);
end

%% plot of poles and zeros
figure()
pzmap(ls{:})
grid on

figure()
step(ls{:}, 1)
grid minor
legend({'-20°','0°', '20°'}, 'location', 'northwest')
ylabel('Roll (deg)')
title('Step response of linearized pitch model at different operating points')
subtitle('from roll torque to roll angle')
%% Build uncertain system

% print zpk form
zpk(ls{1})
zpk(ls{2})
zpk(ls{3})

j = 1;
positive_poles_matrix = [];
for idx = 1:length(roll_operating_points)
    i = 1;
    l = zpk(ls{idx});
    for p = l.P{1}'
        if p > 0.0
            positive_poles_matrix(i, j) = p;
            i = i + 1;
        end
    end
    j = j + 1;
end

nominal_pole_index = intersect(...
    find(positive_poles_matrix ~=(min(positive_poles_matrix))), ...
    find(positive_poles_matrix ~=(max(positive_poles_matrix)))...
);

nominal_unstable_pole = mean(positive_poles_matrix(nominal_pole_index));

usp1 = -10.05;
usp2 = -72.3;

uncertain_stable_p1 = ureal('stable_p1', usp1, 'percentage', [-35, 35]);
uncertain_stable_p2 = ureal('stable_p2', usp2, 'percentage', [-35, 35]);
uncertain_unstable_p = ureal('unstable_p', nominal_unstable_pole, 'percentage', [-35, 35]);


s = tf('s'); tfu_roll = uss(3.6843e06 * (s+10)/ ((s+1.597e04)*(s - uncertain_stable_p1)*(s - uncertain_stable_p2) * (s - uncertain_unstable_p)));
