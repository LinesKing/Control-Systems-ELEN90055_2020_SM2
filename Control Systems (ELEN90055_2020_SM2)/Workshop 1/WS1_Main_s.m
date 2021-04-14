% ELEN90055 2011 Workshop 1

clear all

s = tf([1 0], 1);
fig = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% tf: K/(tau*s + 1)

K = [2, 10, 30];
tau = [1, 2, 5];

for i = 1:length(K)
    sys{i} = K(i)/(s + 1);
end

figure(fig)
fig = fig + 1;
step(sys{1}, sys{2}, sys{3})
grid on

figure(fig)
fig = fig + 1;
bode(sys{1}, sys{2}, sys{3})
grid on

for i = 1:length(tau)
    sys{i} = 1/(tau(i)*s + 1);
end

figure(fig)
fig = fig + 1;
step(sys{1}, sys{2}, sys{3})
grid on

figure(fig)
fig = fig + 1;
bode(sys{1}, sys{2}, sys{3})
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% tf: omg^2/(s^2 + 2*\psi*omg*s + omg^2)


psi = [0.01, 0.1, 0.9];
omg = [10, 12, 15];

for i = 1:length(psi)
    sys{i} = 1/(s^2 + 2*psi(i)*s + 1);
end

figure(fig)
fig = fig + 1;
step(sys{1}, sys{2}, sys{3}, 20)
grid on

figure(fig)
fig = fig + 1;
bode(sys{1}, sys{2}, sys{3})
grid on

for i = 1:length(omg)
    sys{i} = omg(i)^2/(s^2 + 2*0.02*omg(i)*s + omg(i)^2);
end

figure(fig)
fig = fig + 1;
step(sys{1}, sys{2}, sys{3}, 2)
grid on

figure(fig)
fig = fig + 1;
bode(sys{1}, sys{2}, sys{3})
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% tf: (a*s + 1)/(s + 1)^2

a = [0.1, 2, 10];

for i = 1:length(a)
    sys{i} = (a(i)*s + 1)/(s + 1)^2;
end

figure(fig)
fig = fig + 1;
step(sys{1}, sys{2}, sys{3})
grid on

figure(fig)
fig = fig + 1;
bode(sys{1}, sys{2}, sys{3})
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% tf: (-a*s + 1)/(s + 1)^2

a = [0.1, 1, 10];

for i = 1:length(a)
    sys{i} = (-a(i)*s + 1)/(s + 1)^2;
end

figure(fig)
fig = fig + 1;
step(sys{1}, sys{2}, sys{3})
grid on

figure(fig)
fig = fig + 1;
bode(sys{1}, sys{2}, sys{3})
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Step response of forward- and reverse-driving vehicle steering system

figure(fig)
fig = fig + 1;
step((s+1)/s/(0.1*s + 1), '--', (-s+1)/s/(0.1*s + 1), 4)
grid on
ylabel('Lateral velocity')
h = findobj(gcf,'type','line');