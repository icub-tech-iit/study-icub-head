%% Design of the first stage filter as a chain drive

s = tf('s');
eta = 100;
J1 = 0.0913 * 1e-6; % convert inertia from kgmm^2 to kgm^2
J2 = (2/5 * 0.12^2 + 0.07865^2) * headData(1).Solid.mass;

Rsq = (timing_pulley_driven_radius / 1000)^2;
% tunable parameters
k = 200 / Rsq;
b = 20 / Rsq;

% torsional spring-damper-inertia model with inertia J2 after the gearbox
sys_1st = (b * Rsq * s + k * Rsq) / ((J1 + J2/eta^2) * s^2 + b *Rsq * s + k * Rsq);
bw_1st = bandwidth(sys_1st) / (2 * pi);

bprime = b / eta^2;
kprime = k / eta^2;

sys_1st_prime = (bprime * Rsq * s + kprime * Rsq) / ((J1 + J2/eta^2) * s^2 + bprime *Rsq * s + kprime * Rsq);
bw_1st_prime = bandwidth(sys_1st_prime) / (2 * pi);

sprintf('bandwidth of 1st stage: %fHz - bandwidth of 1st stage prime: %fHz', bw_1st, bw_1st_prime)

%% Design of the second stage filter

k = 200;
b = 20;
% torsional spring-damper-inertia model
sys_2nd = (b * s + k) / (J2 * s^2 + b * s + k);
bw_2nd = bandwidth(sys_2nd) / (2 * pi);

sprintf('bandwidth of 2nd stage: %fHz', bw_2nd)

%% Plot filters bode diagrams

opts = bodeoptions;
opts.FreqUnits = 'Hz';
opts.Title.FontSize = 13;
opts.XLabel.FontSize = 11;
opts.YLabel.FontSize = 11;
opts.Grid = 'on';
opts.Title.String = 'Bode diagram of filtering stages';

bodeplot(sys_1st, sys_1st_prime, sys_2nd, opts)


legend({'1^{st} stage', '1^{st} stage detuned', '2^{nd} stage'});
