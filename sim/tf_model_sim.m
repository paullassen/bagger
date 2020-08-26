clear

%% Simulation Variables
% Time Vars
step_size = 1e-4;
end_time = 10;

% Drone Vars
per_n = 0.33;
freq_n = 1/per_n;
omega_n = 2*pi*freq_n;
zeta = 0.2;
pl = 9;
% Transfer Function created by multiplying to 2nd Order tf w/ a 1st Order tf
pitch_tf = tf([omega_n^2], [1 2*zeta*omega_n omega_n^2])*tf([pl],[1 pl],'InputDelay',0.09);
m = 1.89; %kg
g = 9.81; %m*s^⁻2
Ax = 0;
A = diag([Ax Ax Ax]);

% Input Vars
Ts = 0.01;
t_inp = 0:Ts:end_time;

in_t = 0.2305*double(t_inp>0);
in_r = (double((t_inp > 1) & (t_inp < 3)) - double((t_inp > 4) & (t_inp < 6)))*2*pi/180;
in_p = (double((t_inp > 2) & (t_inp < 4)) - double((t_inp > 5) & (t_inp < 7)))*2*pi/180;
in_y = double(t_inp < 0);

inp = [t_inp' in_t' in_r' in_p' in_y'];
%% Simulate
sim('tf_hex.slx', end_time, [], inp);
%% Plot
figure(1)
subplot(311)
plot(tout, yout.signals(1).values);
xlabel('Time $[s]$', 'Interpreter', 'latex')
ylabel('Position $[m]$')
legend('$x$', '$y$', '$z$', 'Interpreter', 'latex', 'Location', 'northwest')
title('Position (World Coordinates)', 'Interpreter', 'latex')
subplot(312)
plot(tout, yout.signals(2).values);
xlabel('Time $[s]$', 'Interpreter', 'latex')
title('Velocity (World Coordinates)', 'Interpreter', 'latex')
ylabel('Velocity $[m s^{-1}]$', 'Interpreter','latex')
legend('$x$', '$y$', '$z$', 'Interpreter', 'latex', 'Location', 'northwest')
subplot(313)
plot(tout, yout.signals(3).values);
xlabel('Time $[s]$', 'Interpreter', 'latex')
title('Acceleration (World Coordinates)', 'Interpreter', 'latex')
ylabel('Acceleration $[m s^{-2}]$', 'Interpreter','latex')
legend('$x$', '$y$', '$z$', 'Interpreter', 'latex', 'Location', 'northwest')
xlim([2*Ts end_time])
sgtitle('Attitude Controller Response', 'Interpreter', 'latex')

figure(2)
subplot(211), hold off
plot(tout, yout.signals(4).values(:,1)), hold on
plot(tout, yout.signals(6).values(:,1))
xlabel('Time $[s]$', 'Interpreter', 'latex')
ylabel('$\phi$ $[rad]$')
title('Roll Angle (World Coordinates)', 'Interpreter', 'latex')

subplot(212), hold off
plot(tout, yout.signals(4).values(:,2)), hold on
plot(tout, yout.signals(6).values(:,2))
xlabel('Time $[s]$', 'Interpreter', 'latex')
ylabel('$\theta$ $[rad]$')
title('Pitch Angle (World Coordinates)', 'Interpreter', 'latex')
sgtitle('Attitude Controller Response', 'Interpreter', 'latex')



