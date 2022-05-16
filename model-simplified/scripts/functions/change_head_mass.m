function [mass, moi] = change_head_mass(cad_data, change_type, value)


    if strcmp(change_type, 'multiplicative')
        mass = cad_data.Solid(5).mass * value;
        moi = cad_data.Solid(5).MoI * value;
    elseif strcmp(change_type, 'additive')
        mass = cad_data.Solid(5).mass + value;
        moi = cad_data.Solid(5).MoI / cad_data.Solid(5).mass * mass;
    else
        sprintf('Change type not accepted. Only multiplicative and additive are allowed.');
    end
end

