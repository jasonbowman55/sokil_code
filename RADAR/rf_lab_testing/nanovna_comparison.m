% Sokil Clinic 2024-2025
% nanonva_comparison
% compares data from 2 different nanovna tests
% data = [freq_avg; mag_avg; phase_avg; mag_SER; phase_SER]

clear all
x1 = 1;
x2 = 6:10;
x3 = 11:13;

data1 = nanovna_data_analysis(x1);
data2 = nanovna_data_analysis(x2);
data3 = nanovna_data_analysis(x3);

figure
subplot(2,1,1);
plot(data1(1,:), sqrt(data1(2,:).^2 + data1(3,:).^2));
hold on;
plot(data1(1,:), sqrt(data2(2,:).^2 + data2(3,:).^2));
plot(data1(1,:), sqrt(data3(2,:).^2 + data3(3,:).^2));
xlabel('Frequency [MHz]');
ylabel('Magnitude |S11|');
legend('Empty Chamber', 'Steel ball', 'Acrylic ball');
title('Magnitude comparison');
hold off;

subplot(2,1,2);
plot(data1(1,:), atan2(data1(3,:),data1(2,:)));
hold on;
plot(data1(1,:), atan2(data2(3,:),data2(2,:)));
plot(data1(1,:), atan2(data3(3,:),data3(2,:)));
xlabel('Frequency [MHz]');
ylabel('Phase [rads]');
legend('Empty Chamber', 'Steel ball', 'Acrylic ball');
title('Phase comparison');