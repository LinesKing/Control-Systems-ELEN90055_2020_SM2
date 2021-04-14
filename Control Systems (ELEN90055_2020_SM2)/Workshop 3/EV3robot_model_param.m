% LEGO EV3 robot simulink model parameters - ELEN90055 Workshops 3 and 4

Ts = 0.005          % sensor / control sampling time (s)

SqWaveFreq = 1/6    % frequency of test signal and reference repetition (Hz)

Vm = 30             % percentage of supply voltage applied by PWM to motor during tests
                    % to gather data for model parameter identification

Km = 14.72          % V-to-ThetaDot motor model gain parameter (degrees/V.s) 

Tm = 0.028          % V-to-ThetaDot motor model time-constant (s)

To = 2*Ts           % open-loop controller roll-off
Km0 = Km;
Tm0 = Tm;
COL = tf([Tm0 1 0],Km0*[To^2 2*To 1]);  % open-loop controller = approx inverse of Km0/s*(Tm0 s + 1)
COLdisc = c2d(COL,Ts,'tustin');         % time discretization of open-loop controller
[COLnum,COLden] = tfdata(COLdisc,'v');  % discrete transfer fnc numerator and denominator 

ThDotRef = 90 % ThetaDot reference for controller tests

Kc = 3          % feedback controller gain for drive motors

% set(0,'ShowHiddenHandles','on'); set(gcf,'menubar','figure')

figure(1)
for i = -2:2
    Km0 = Km;
    Tm0 = Tm;
    Kmm = Km*2^i;
    Hop = Kmm/Km0*tf([Tm0 1],[Tm*To^2 To^2+2*Tm*To 2*To+Tm 1]);
    step(Hop)
    hold on
end
legend('Km = Km/4','Km = Km/2','Km = Km','Km = 2Km','Km = 4Km');

figure(2)
for i = -2:2
    Tm0 = Tm;
    Km0 = Km;
    Tmm = Tm*2^i;
    Hop = Km/Km0*tf([Tm0 1],[Tmm*To^2 To^2+2*Tmm*To 2*To+Tmm 1]);
    step(Hop)
    hold on
end
legend('Tm = Tm/4','Tm = Tm/2','Tm = Tm','Tm = 2Tm','Tm = 4Tm');

% figure(3)
% F = tf([Tm 1 0],[Km]);
% rlocus(F)

% figure(4)
% Kc = 5;
% for i = -2:2
%     Kc0 = Kc*2^i;
%     Hop = tf([Km],[Tm 1 0]);
%     Hcls = tf([Tm 1 0],[Tm 1 Kc0*Km]);
%     Hcl = Kc0*Km*tf([1],[Tm 1 Kc0*Km]);
%     bode(Hcls)
%     hold on
% end
% legend('Kc = 1.25','Kc = 2.5','Kc = 5','Kc = 10','Kc = 20');

figure(5)
Kc = 5;
ThDotRef = 360;
for i = -2:2
    Kc0 = Kc*2^i;
    Hid = Kc0*ThDotRef*tf([Tm 1],[Tm 1 Kc0*Km]);
    step(Hid)
    hold on
end
legend('Kc = 1.25','Kc = 2.5','Kc = 5','Kc = 10','Kc = 20');

