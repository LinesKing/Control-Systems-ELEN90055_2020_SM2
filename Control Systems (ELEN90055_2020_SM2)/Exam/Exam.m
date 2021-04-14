%%%% %%%%
clc
clear
close all
%% Transfer Function tf
num = conv([1],[14142*sqrt(10)*10^15])
den = conv(conv([1 1.1*10^7 1*10^13 1*10^15],[1]),[1])
Lambda = tf([num],[den],'InputDelay',0)
T = Lambda/(1+Lambda)

%% Transfer Function zpk
Lambda = zpk([],[-1000 -10000],100,'InputDelay',0)
T = Lambda/(1+Lambda)

%% Bode Diagram with Margin
margin(Lambda)

%% Nyquist Diagram
nyquist(Lambda)

%% Step Response
step(T)
stepinfo(T)

%% Root Locus Diagram
rlocus(Lambda)