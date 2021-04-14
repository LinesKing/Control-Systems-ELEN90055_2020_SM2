% Mobile pendulum simulink model parameters - ELEN90055 Workshops 4

SqWaveFreq = 1/18    % frequency of test signal and reference repetition (Hz)

ThRef = 45         % (rad)

ThDotRef = 90      % (rad/s)

%%%%%%%%%%%%%%%%%%%%%%%
% PARAMETERS TO ADJUST
%%%%%%%%%%%%%%%%%%%%%%%

initcond = [0; -0.05; 0; 0] % inital conditins - theta (rad); phi (rad); thdot (rad/s); phdot (rad/s)

K = 1         % constant gain drive motor controller

pendCnum = 5276.04 * [0.1163 1]  % numerator of pendulum motor controller

pendCden = [0.0095564 1]  % denominator of pendulum motor controller


% num = 0.05;
% den = [1 1.15 -19.85];
% sys=tf(num,den)
% bode(sys)

Kc = 5276.04
tauz = 0.1163;
taup = 0.0095564;
num = 0.05 * Kc *[tauz 1];
den = conv([1 1.15 -19.85],[taup 1]);
sys=tf(num,den)
margin(sys)
