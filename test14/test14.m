st = bagfiletestmocap.time(1);
tm = (bagfiletestmocap.time-st)/1e9;
tt = (bagfiletesttarget.time-st)/1e9;
tai = (bagfiletestattin.time-st)/1e9;
ta = (bagfiletestattitude.time-st)/1e9;
te = (bagfiletesterr.time-st)/1e9;
ted = (bagfiletesterd.time-st)/1e9;
tei = (bagfiletesteri.time-st)/1e9;

quat = quaternion(bagfiletestmocap.fieldposeorientationw,...
                  bagfiletestmocap.fieldposeorientationx,...
                  bagfiletestmocap.fieldposeorientationy,...
                  bagfiletestmocap.fieldposeorientationz);
eul = quat2eul(quat);
figure(1)
subplot(321), hold off
plot(tm, bagfiletestmocap.fieldposepositionx)
hold on
plot(tt, bagfiletesttarget.fieldx)
plot(te, bagfiletesterr.fieldpointx)
subplot(323), hold off
plot(tm, -bagfiletestmocap.fieldposepositiony)
hold on
plot(tt, bagfiletesttarget.fieldy)
plot(te, bagfiletesterr.fieldpointy)
subplot(325), hold off
plot(tm, bagfiletestmocap.fieldposepositionz)
hold on
plot(tt, bagfiletesttarget.fieldz)
subplot(322), hold off
plot(ted, bagfiletesterd.fieldpointx),hold on
plot(ted, -kx*sind(-30) + ky*cosd(30))
subplot(324), hold off
plot(ted, bagfiletesterd.fieldpointy),hold on
plot(ted, -kx*cosd(-30) + ky*sind(30))

subplot(326), hold off
plot(ted, kx)
hold on
plot(ted, ky)
plot(ted, -kx*cosd(-30) + ky*sind(30))
plot(ted, -kx*sind(-30) + ky*cosd(30))
for i = 1:6
    subplot(3,2,i)
    xlim([300 460])
end