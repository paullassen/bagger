clear
close all
load_bag


st = mocap.time(1);

t_mocap = (mocap.time - st)/1e9;
t_kp = (kp.time - st)/1e9;
t_kd = (kd.time - st)/1e9;
t_ki = (ki.time - st)/1e9;
t_target = (target.time - st)/1e9;
t_thrust = (thrust.time - st)/1e9;
t_health = (health.time - st)/1e9;
t_eri = (eri.time - st)/1e9;
t_attin = (att_in.time -st)/1e9;
x_lims = [0 t_target(end)];


figure(1)
subplot(321), hold on
plot(t_mocap, mocap.x);
plot(t_target, target.x);
title('x-position and target','Interpreter','latex')
ylabel('Position $[m]$', 'Interpreter','latex')
xlabel('Time $[s]$', 'Interpreter', 'latex')
xlim(x_lims)
subplot(322), hold on
plot(t_mocap, mocap.y);
plot(t_target, -target.y);
title('y-position and target','Interpreter','latex')
ylabel('Position $[m]$', 'Interpreter','latex')
xlabel('Time $[s]$', 'Interpreter', 'latex')
xlim(x_lims)
subplot(3,2,[5 6]), hold on
plot(t_mocap, mocap.z);
plot(t_target, target.z);
title('y-position and target','Interpreter','latex')
ylabel('Position $[m]$', 'Interpreter','latex')
xlabel('Time $[s]$', 'Interpreter', 'latex')
xlim(x_lims)

subplot(323)
plot(t_eri, eri.x), hold on
plot(t_attin, -att_in.y)
title('x integrator error', 'Interpreter','latex')
xlabel('Time $[s]$', 'Interpreter', 'latex')
xlim(x_lims)
subplot(324)
plot(t_eri, eri.y), hold on
plot(t_attin, att_in.x)
xlabel('Time $[s]$', 'Interpreter', 'latex')
title('y integrator error', 'Interpreter','latex')
xlim(x_lims)

figure(1)

