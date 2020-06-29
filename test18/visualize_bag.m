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

x_lims = [0 t_target(end)];


figure(1)
subplot(311), hold on
plot(t_mocap, mocap.x);
plot(t_target, -target.x);
xlim(x_lims)
subplot(312), hold on
plot(t_mocap, mocap.y);
plot(t_target, target.y);
xlim(x_lims)
subplot(313), hold on
plot(t_mocap, mocap.z);
plot(t_target, target.z);
xlim(x_lims)

