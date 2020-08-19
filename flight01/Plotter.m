close all
figure
subplot(311), hold on
plot(t_mocap, mocap.X)
plot(t_target, target.X)
subplot(312), hold on
plot(t_mocap, mocap.Y)
plot(t_target, target.Y)
subplot(313), hold on
plot(t_mocap, mocap.Z)
plot(t_target, target.Z)


for i = 1:3
    subplot(3,1,i)
    grid on
    xlabel('Time $[s]$', 'Interpreter','latex')
    xlim([6 9])
end

figure
subplot(311), hold on
plot(t_err, err.X)
plot(t_erd, erd.X)
plot(t_eri, eri.X*ki.X(1))
plot(t_att_in, att_in.Y)
title('Errors on $x$ and $\theta$','Interpreter','latex')
legend('$e_p*k_p$','$e_d*k_d$','$e_i*k_i$','$\theta_{in}$', 'Interpreter', 'latex', 'Location','northwest')
subplot(312), hold on
plot(t_err, err.Y*kp.Y(1))
plot(t_erd, erd.Y*kd.Y(1))
plot(t_eri, eri.Y*ki.Y(1))
plot(t_att_in, att_in.X)
title('Errors on $y$ and $\phi$','Interpreter','latex')
legend('$e_p*k_p$','$e_d*k_d$','$e_i*k_i$','$\phi_{in}$', 'Interpreter', 'latex', 'Location','northwest')
subplot(313), hold on
plot(t_err, err.Z*kp.Z(1))
plot(t_erd, erd.Z*kd.Z(1))
plot(t_eri, eri.Z*ki.Z(1))
plot(t_thrust, thrust)
title('Errors on $z$ and thrust','Interpreter','latex')
legend('$e_p*k_p$','$e_d*k_d$','$e_i*k_i$','$thrust_{in}$', 'Interpreter', 'latex', 'Location','northwest')

for i = 1:3
    subplot(3,1,i)
    grid on
    xlabel('Time $[s]$', 'Interpreter','latex')
    xlim([6 9])
end
