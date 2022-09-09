function den = process_tf_element(p, threshold, par_prefix, uncertain_range)
% checks if a list of linear system parameter is the same in the array 
% according to threshold; if true add it as a polynomial root, otherwise
% create an uncertain parameter and add it as a polynomial root
% If the parameter is a static gain add it as a multiplicative factor
    j = 1;
    s = tf('s'); 
    den = tf(1);
    for i=1:size(p, 1)
        if any((abs(p(i, :) - p(1)) > threshold))
                    nominal_root_index = intersect(find(p(i, :) ~=(min(p(i, :)))), ...
                                       find(p(i, :) ~=(max(p(i, :)))) ...
                                       );
            r = ureal(sprintf('%s_%d',par_prefix, j), mean(p(i, nominal_root_index)), 'percentage', uncertain_range);
            j = j + 1;
        else
            r = p(i, 1);
        end

        if(strcmp(par_prefix,'gain') || strcmp(par_prefix, 'k'))
             den = r;
        else
             den = den *  (s - r);
        end
    end
end