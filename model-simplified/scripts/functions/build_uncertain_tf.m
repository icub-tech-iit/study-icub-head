function [tfu] = build_uncertain_tf(linear_systems)
% BUILD_UNCERTAIN_TF: Creates an transfer function with uncertain
% parameters according to the cell array of linear systems in input
    p = [];
    z = [];
    k = [];
    i = 1;
    for l = linear_systems
        p(:, i) = zpk(l{1}).P{1};
        z(:, i) = zpk(l{1}).Z{1};
        k(i) = zpk(l{1}).K;
        i = i + 1;
    end
    
    denominator = process_tf_element(p, 1e-3, 'pole', [-35, 35]);
    numerator = process_tf_element(z, 1e-3, 'zero', [-35, 35]);
    static_gain = process_tf_element(k, 1e-3, 'gain', [-35, 35]);
    
    tfu = static_gain * numerator / denominator;

end

