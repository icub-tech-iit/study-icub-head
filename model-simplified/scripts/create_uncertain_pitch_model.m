%% Specify the model name
model = 'lumped_neck_with_motor_pitch';

pitch_operating_points = [-40, 0, 22]; % degrees

%% Create the operating point specification object.
% Create the options
opt = findopOptions('DisplayReport','iter');

ls = cell(1,length(pitch_operating_points));
op_points_pitch = cell(1,length(pitch_operating_points));
for i = 1:length(pitch_operating_points)
   [ls{i}, op_points_pitch{i}] = linearize_pitch(model, pitch_operating_points(i), opt);
end

%% plot of poles and zeros
figure()
pzmap(ls{:})
grid on

figure()
step(ls{:}, 1)
grid minor
legend({'-40°','0°', '22°'}, 'location', 'northwest')
ylabel('Pitch (deg)')
title('Step response of linearized pitch model at different operating points')
subtitle('from pitch torque to pitch angle')
%% Build uncertain system

% print zpk form
zpk(ls{1})
zpk(ls{2})
zpk(ls{3})

j = 1;
positive_poles_matrix = [];
for idx = 1:length(pitch_operating_points)
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

usp1 = -10.08;
usp2 = -60.44;

uncertain_stable_p1 = ureal('stable_p1', usp1, 'percentage', [-35, 35]);
uncertain_stable_p2 = ureal('stable_p2', usp2, 'percentage', [-35, 35]);
uncertain_unstable_p = ureal('unstable_p', nominal_unstable_pole, 'percentage', [-35, 35]);

s = tf('s'); tfu_pitch = uss(3.0588e06*(s+10)/ ((s+1.587e04)*(s - uncertain_stable_p2)*(s - uncertain_stable_p1) * (s - uncertain_unstable_p)));
