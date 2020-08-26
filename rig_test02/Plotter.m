figure(1)
subplot(311), hold off
plot(t_mocap, mocap.X), hold on
plot(t_target, target.X)
ylabel('$x$ position $[m]$','Interpreter','latex')
legend('$x_{position}$','$x_{target}$','Interpreter','latex','Location','northwest')
subplot(312), hold off
plot(t_mocap, mocap.Y), hold on
plot(t_target, target.Y)
ylabel('$y$ position $[m]$','Interpreter','latex')
legend('$y_{position}$','$y_{target}$','Interpreter','latex','Location','northwest')
subplot(313), hold off
plot(t_mocap, mocap.Z), hold on
plot(t_target, target.Z)
ylabel('$z$ position $[m]$','Interpreter','latex')
legend('$z_{position}$','$z_{target}$','Interpreter','latex','Location','northwest')
sgtitle('Position and Targets in World Coordinates', 'Interpreter', 'latex')

figure(2)
subplot(3,1,1), hold off
plot(t_err, err.X*kp.X(1)), hold on
plot(t_erd, erd.X*kd.X(1))
plot(t_eri, eri.X*ki.X(1))
ylabel('$x$ error magnitude','Interpreter','latex')
legend('$e_p*k_p$','$e_d*k_d$','$e_i*k_i$','Interpreter','latex','Location','northwest')
subplot(3,1,2), hold off
plot(t_err, err.Y*kp.Y(1)), hold on
plot(t_erd, erd.Y*kd.Y(1))
plot(t_eri, eri.Y*ki.Y(1))
ylabel('$y$ error magnitude','Interpreter','latex')
legend('$e_p*k_p$','$e_d*k_d$','$e_i*k_i$','Interpreter','latex','Location','northwest')
subplot(3,1,3), hold off
plot(t_err, err.Z*kp.Z(1)), hold on
plot(t_erd, erd.Z*kd.Z(1))
plot(t_eri, eri.Z*ki.Z(1))
ylabel('$z$ error magnitude','Interpreter','latex')
legend('$e_p*k_p$','$e_d*k_d$','$e_i*k_i$','Interpreter','latex','Location','northwest')
sgtitle('Errors in Drone Coordinates', 'Interpreter', 'latex')


figure(3)
subplot(311), hold off
plot(t_att_in, att_in.X), hold on
plot(t_mocap_att, mocap_att.X * 180/pi)
subplot(312), hold off
plot(t_att_in, att_in.Y), hold on
plot(t_mocap_att, mocap_att.Y * 180/pi - 9.5)
subplot(313), hold off
m = 1.89;
g = 9.81;
plot(t_att_in, m*g*sind(att_in.X)), hold on
plot(t_erd(2:end), m*diff(erd.Y))
sgtitle('Pitch and Roll of Drone', 'Interpreter', 'latex')

for j = 1:3
    for i = 1:3 
        figure(j)
        subplot(3,1,i)
        grid on
        xlabel('Time $[s]$', 'Interpreter','latex')
        xlim([10 25])
    end
end
%%
per_n = 0.33;
freq_n = 1/per_n;
omega_n = 2*pi*freq_n
zeta = 0.2;
pl = 9
figure(4)
subplot(211), hold off
pitch_tf = tf([omega_n^2*pl], [1 2*zeta*omega_n omega_n^2])*tf([1],[1 pl],'InputDelay',0.09)
[y_n, t_n] = step(pitch_tf, [0:0.001:2]);
plot(t_n, 25*y_n - 25), hold on
title(['Overshoot = ', num2str(max(y_n))])
t_p = (t_mocap_att>=14.15) & (t_mocap_att<16.15);
plot(t_mocap_att(t_p)-14.15, mocap_att.Y(t_p)*180/pi - 9.5)

subplot(212), hold off
[y_s] = lsim(pitch_tf, att_in.Y, linspace(t_att_in(1),t_att_in(end),length(t_att_in)));
plot(t_att_in, att_in.Y), hold on
plot(t_mocap_att, mocap_att.Y * 180/pi - 9.5)
plot(t_att_in, y_s)
xlim([10 25])
