% ELEN90055 Control Systems Workshop 2

k1 = 0.5;
k1d = 0.4;
k2 = 0.25;
yQ = 1;
tau = 0.01;

% fig = 1;
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % plant response
% 
% figure(fig)
% fig = fig + 1;
% subplot(2, 1, 1);
% plot(OL_time, OL(:, 1))
% title('Input'); xlabel('Time (s)'); ylabel('Flow rate (m^3s^{-1})');
% grid on
% 
% subplot(2, 1, 2);
% plot(OL_time, OL(:, 2), '-', OL_time, OL(:, 3), 'r--')
% title('Plant response'); xlabel('Time (s)'); ylabel('Water level (m)');
% legend('Nonlinear', 'Linear', 2);
% grid on
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % open-loop control
% 
% figure(fig)
% fig = fig + 1;
% plot(OLC_time, OLC(:, 1), '-', OLC_time, OLC(:, 2), '--', OLC_time, OLC(:, 3), '-.')
% title('Open-loop control with perfect plant model'); xlabel('Time (s)'); ylabel('Water level (m)');
% legend('Ref', 'Linear', 'Nonlinear', 2);
% grid on
% 
% figure(fig)
% fig = fig + 1;
% plot(OLC_time, OLC_d(:, 1), '-', OLC_time, OLC_d(:, 2), '--')
% title('Open-loop control with disturbed plant model'); xlabel('Time (s)'); ylabel('Water level (m)');
% legend('Ref', 'Actual nonlinear', 2);
% grid on
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % closed-loop control
% 
% figure(fig)
% fig = fig + 1;
% plot(CLC_time, CLC(:, 1), '-', CLC_time, CLC(:, 2), '--', CLC_time, CLC(:, 3), '-.')
% title('Closed-loop control'); xlabel('Time (s)'); ylabel('Water level (m)');
% legend('Ref', 'Nonlinear', 'Mismatched nonlinear', 2);
% grid on
% 
% figure(fig)
% fig = fig + 1;
% plot(CLC_n_time, CLC_n(:, 1), '--', CLC_n_time, CLC_n(:, 2), '-')
% title('Closed-loop control with measurement noise'); xlabel('Time (s)'); ylabel('Water level (m)');
% legend('Ref', 'Nonlinear', 2);
% grid on