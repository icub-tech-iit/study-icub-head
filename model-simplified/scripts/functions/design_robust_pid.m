function [C, T, Sc] = design_robust_pid(usys, OutputName, Ts,  SoftGoals, HardGoals)
  
    %% define the tunable controller
    C = tunablePID('C', 'PID');
    C.Kp.Minimum = 0;    C.Kp.Maximum = inf;
    C.Ki.Minimum = 0;    C.Ki.Maximum = inf;
    C.Kd.Minimum = 0;    C.Kd.Maximum = inf;
    C.Tf.Minimum = 10 * Ts;   C.Tf.Maximum = 20 * Ts;    % N = 1/Tf
    C.TimeUnit = 'seconds';
    C.InputName = 'e';
    C.OutputName = 'tau';

    %% Create uncertain loop
    usys.InputName = 'tau';
    usys.OutputName = OutputName;
    sumblkstring = append('e = r - ', OutputName);
    Sum = sumblk(sumblkstring);
    T = connect(usys, C, Sum,'r', OutputName, 'tau');
    
    %% Tune system
    tuneopts = systuneOptions('RandomStart', 5, 'UseParallel', true);
    
    Gcl = systune(T, SoftGoals, HardGoals, tuneopts);
    
    tunedValue = getTunedValue(Gcl);
    C = tunedValue.C;
    C.InputName = 'e';
    C.Outputname = 'tau';

    T = connect(usys, C, Sum,'r', OutputName, 'tau');
    Sc = getIOTransfer(T,'tau', OutputName);
end
