function y = qdotwmr(u)
% Part of simulink model EV3robot_SIMmodel.slx
%
% Differential vector field for the robot state dynamics.
% 
% INPUT u:
% ************************************
% * states (generalized co-orindates)*
% ************************************
% (xp,yp) - position of mid wheel axel in the plane (m)
% phi - heading (rad)
% (thr, thl) - angle of right and left wheels (rad)
% (thrdot,thldot) - speed of right and left wheels (rad/s)
% *****************
% * system inputs *
% *****************
% (taur,taul) -- right and left wheel torques (Nm)
%
% OUTPUT y:
% Time derivative of the state (for integration in simulink model)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by M.Cantoni on 23 June 2020
%
% Updated by M.Cantoni on 20 August 2020
%         Changed fn name; added more comments; adjusted r.
%
% Updated by XXXX on DATE
%         YYYY.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% model parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mc = 1; % body mass in kg
alph = 0.1; % body c.o.m angular offset in radians
mw = 0.01; % wheel mass in kg
mm = mc+2*mw; % total mass in kg
d = 0.1; % distance body c.o.m from mid axel in m
b = 0.05; % distance from mid axel to wheels in m
r = 0.02; %0.01; % right and left wheel radius in m
II = mc*(b^2+d*(1-b^2)*cos(alph)-d^2) + mc*d^2 ... 
     + 2*mw*b^2 + 2*mw*(r/4)^2; %kg m^2
%II = 0.025 + mc*d^2 + 2*mw*b^2 + 2*0.0001; % kg m^2
Jl = mw*(r/2)^2; % moment of inertia of left wheel about centre in kg m^2
Jr = Jl; % moment of inertia of left wheel about centre in kg m^2
gl = 0.001; % viscous damping coeff for gear box loss left motor
gr = gl; % viscous damping coeff for gear box loss right motor
gf = 0.001; % viscous damping coeff for friction from front ball wheel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% unpack u into state components and system inputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generalized state co-ordinates
xp = u(1);
yp = u(2);
phi = u(3);
thr = u(4);
thl = u(5);
thrdot = u(6);
thldot = u(7);
% torque input for drive wheels
tau = [u(8); u(9)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute state derivatives
%%%%%%%%%%%%%%%%%%%%%%%%%%%
sphal = sin(phi-alph);
cphal = cos(phi-alph);

sph = sin(phi);
cph = cos(phi);

phdot = (r/(2*b))*(thrdot - thldot);

Mq = [ mm, 0, -mc*d*sphal, 0, 0; ...
       0, mm,  mc*d*cphal, 0, 0; ...
       -mc*d*sphal, mc*d*cphal, II, 0, 0; ...
       0, 0, 0, Jr, 0; ...
       0, 0, 0, 0, Jl];
   
Sq = [ r*cph/2, r*cph/2; ...
       r*sph/2, r*sph/2; ...
       r/(2*b), -r/(2*b); ...
       1, 0; ...
       0, 1];
   
Sqdot = [ -r*phdot*sph/2, -r*phdot*sph/2; ... 
          r*phdot*cph/2, r*phdot*cph/2; ... 
          0, 0; ...
          0, 0; ...
          0, 0];
      
Vqqd = [ -mc*d*(phdot^2)*cphal; ...
         -mc*d*(phdot^2)*sphal; ...
         gf*phdot; ...
         gr*thrdot; ...
         gl*thldot];
     
E = [ 0, 0; 0, 0; 0, 0; 1, 0; 0, 1 ];

qdot = Sq * [thrdot; thldot];
thddot = (Sq'*Mq*Sq)\Sq'*(E*tau - Mq*Sqdot*[thrdot; thldot] - Vqqd);

% output state derivatives
y = [qdot; thddot];
     
end