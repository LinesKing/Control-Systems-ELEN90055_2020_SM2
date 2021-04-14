%% %% Characteristics of first- and second-order systems; Time-domain interpretation of transfer function poles and zeros %% %%
clear all
close all
clc

%% Exercise 1
K = [30 10 2];
tao = [5 2 1];
sys{1} = tf(K(1),[tao(1) 1]);
sys{2} = tf(K(1),[tao(2) 1]);
sys{3} = tf(K(1),[tao(3) 1]);
figure(1)
step(sys{1},'r',sys{2},'g',sys{3},'b');
figure(2)
bode(sys{1},'r',sys{2},'g',sys{3},'b');

fai = [1 0.5 0.2];
wn = [5 2 1];
sys{1} = tf(wn(1)^2,[1 2*fai(3)*wn(1) wn(1)^2]);
sys{2} = tf(wn(2)^2,[1 2*fai(3)*wn(2) wn(2)^2]);
sys{3} = tf(wn(3)^2,[1 2*fai(3)*wn(3) wn(3)^2]);
figure(3)
step(sys{1},'r',sys{2},'g',sys{3},'b');
figure(4)
bode(sys{1},'r',sys{2},'g',sys{3},'b');

a = [5 2 1];
sys{1} = tf([a(1) 1],[1 2 1]);
sys{2} = tf([a(2) 1],[1 2 1]);
sys{3} = tf([a(3) 1],[1 2 1]);
figure(5)
step(sys{1},'r',sys{2},'g',sys{3},'b');
figure(6)
bode(sys{1},'r',sys{2},'g',sys{3},'b');

a = [5 2 1];
sys{1} = tf([-a(1) 1],[1 2 1]);
sys{2} = tf([-a(2) 1],[1 2 1]);
sys{3} = tf([-a(3) 1],[1 2 1]);
figure(7)
step(sys{1},'r',sys{2},'g',sys{3},'b');
figure(8)
bode(sys{1},'r',sys{2},'g',sys{3},'b');

%% Exercise 2
figure(9)
step((s+1)/s/(0.1*s + 1), '--', (-s+1)/s/(0.1*s + 1), 4)
grid on
ylabel('Lateral velocity')
h = findobj(gcf,'type','line');








