%% %% Introduction to MATALB and Simulink %% %%
clear all
close all
clc

%% Tank as a transfer function
sys = tf(1,[1,0]);

%% Computing a step response
opt = stepDataOptions('StepAmplitude',4);
step(sys,opt);
[y,t] = step(sys,opt);
figure(2)
plot(t,y+5);

%% Building the step response using a 'for loop'
qin = 5; % Inflow
qout = 1; % Outflow
v(1) = 0; % Initial Condition (n.b. vectors are indexed starting from 1)
for i = 1:1:40 % This means i ranges from 1 to 40 in step of 1
    v(i+1) = v(i) + qin -qout; % Discretization (3) of (1) with T = 1
end
figure(3)
stem([0:1:40],v); % use od plot instead join the dots