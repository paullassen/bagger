clear
close all
load_bag

x_lims = [0 165];

st = mocap.time(1);

t_mocap = (mocap.time - st)/1e9;
t_kp = (kp.time - st)/1e9;
t_kd = (kd.time - st)/1e9;
t_ki = (ki.time - st)/1e9;
t_target = (target.time - st)/1e9;
t_thrust = (thrust.time - st)/1e9;
t_health = (health.time - st)/1e9;

figure(1)
subplot(311), hold on
plot(t_mocap, mocap.x);
plot(t_target, target.x);
xlim(x_lims)
subplot(312), hold on
plot(t_mocap, mocap.y);
plot(t_target, target.y);
xlim(x_lims)
subplot(313), hold on
plot(t_mocap, mocap.z);
plot(t_target, target.z);
xlim(x_lims)
%
%figure(3)
%subplot(321), hold on
%plot(t_thrust, thrust.data)
%plot(t_thrust, sqrt(thrust.data))
%legend({'Thrust', '$\sqrt{Thrust}$'}, 'Location', 'east')
%grid on
%title('Thrust Input')
%xlabel('Time $[sec]$')
%ylabel('Thrust $[0-1]$')
%xlim(x_lims)

%subplot(322)
%plot(t_health, health.battery)
%grid on
%title('Battery Voltage')
%xlabel('Time $[sec]$')
%ylabel('Voltage $[V]$')
%xlim(x_lims)
%
%subplot(3,2,[3 4]), hold on
%plot(t_thrust, (thrust.data-0.263)/(0.355 - 0.263))
%plot(t_thrust, (sqrt(thrust.data)-0.5126)/(0.5967 - 0.5126))
%
%plot(t_health, 1 - (health.battery-13.89)/(16.1-13.89))
%plot(t_health, (health.battery-13.89)/(16.1-13.89))
%
%grid on
%title('Normalized Thrust and Battery')
%xlabel('Time $[sec]$')
%legend({'Thrust', '$\sqrt{Thrust}$', '1-Battery', 'Battery'}, 'Location', 'east')
%xlim(x_lims)
%
%subplot(3,2,[5 6]), hold on
%plot(t_thrust(2:end), thrust.data(2:end).*health.battery(8:end))
%plot(t_thrust(2:end), sqrt(thrust.data(2:end)).*health.battery(8:end))
%grid on
%legend({'$Thrust*Battery$', '$\sqrt{Thrust}*Battery$'}, 'Location', 'east')
%
%xlim(x_lims)
