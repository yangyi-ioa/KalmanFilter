clear all
format compact

accel_raw = load("Accelerometer.csv");
gyro_raw = load("Gyroscope.csv");
mag = load("Compass.csv");
length = 3062;

gyro_raw(2:4) = gyro_raw(2:4).*(pi / 180);
gyro_raw(:,1) = gyro_raw(:,1)./1000;
accel_raw(:,1) = accel_raw(:,1)./1000;

[accel_calib, gyro_calib] = calibration(accel_raw, gyro_raw, length);

accel_std = std(accel_calib(:,2:4));
gyro_std = std(gyro_calib(:,2:4));

% d = fdesign.lowpass('Fp,Fst,Ap,Ast',3,5,0.5,20,100);
%d2 = fdesign.lowpass('Fp,Fst,Ap,Ast',3,5,0.5,30,100);
% Hd = design(d,'equiripple');
%Hd2 = design(d2,'equiripple');
% accel_filtered = [accel_calib(:,1), filter(Hd,accel_calib(:,2:4))];
% gyro_filtered = [gyro_calib(:,1), filter(Hd,gyro_calib(:,2:4))];

ahrsEKF = extendedKalmanFilter(@systemEqn, @measurementEqn2, [1; 0; 0; 0]);
ahrsEKF.ProcessNoise = diag([0 gyro_std]);
ahrsEKF.MeasurementNoise = 10.*diag([0 0.75 0.75 0.75]);


orientation = ahrs(gyro_calib, length);
% orientation2 = ahrs(gyro_filtered, length);

stdev = std(orientation);
avg = mean(orientation);
% stdev2 = std(orientation2');
% avg2 = mean(orientation2');

[position, velocity] = eulers_method(accel_calib, orientation, length);

for j = 1:600
   
    if(j == 1)
        
        [state, covariance] = predict(ahrsEKF,gyro_calib(j,2:4));
        
    end
    
    if(mod(j,10) == 1)
        
        j
        [state, covariance] = correct(ahrsEKF,[0 mag((j-1)/10 + 1, 2:4)]);
%         state(j,:) = quatnormalize(state(j,:));
%         state(j,:) = temp';
%         state = quatmultiply(state')
        
    end
    
    [state, covariance] = predict(ahrsEKF,gyro_calib(j,2:4));
    state'
    
end

figure
subplot(3,1,1);
hold on
plot(accel_calib(:,1),accel_calib(:,2));
% plot(accel_calib(:,1),accel_filtered(:,2), 'g');
plot(accel_calib(:,1),accel_std(1)*ones(length,1), 'r');
plot(accel_calib(:,1),-accel_std(1)*ones(length,1), 'r');
title('X Acceleration');

subplot(3,1,2);
hold on
plot(accel_calib(:,1),accel_calib(:,3));
% plot(accel_calib(:,1),accel_filtered(:,3), 'g');
plot(accel_calib(:,1),accel_std(2)*ones(length,1), 'r');
plot(accel_calib(:,1),-accel_std(2)*ones(length,1), 'r');
title('Y Acceleration');

subplot(3,1,3);
hold on
plot(accel_calib(:,1),accel_calib(:,4));
% plot(accel_calib(:,1),accel_filtered(:,4), 'g');
plot(accel_calib(:,1),(9.8066+accel_std(3))*ones(length,1), 'r');
plot(accel_calib(:,1),(9.8066-accel_std(3))*ones(length,1), 'r');
title('Z Acceleration');

figure
subplot(3,1,1);
hold on
plot(gyro_calib(:,1),gyro_calib(:,2));
% plot(gyro_calib(:,1),gyro_filtered(:,2), 'g');
plot(gyro_calib(:,1),gyro_std(1)*ones(length,1), 'r');
plot(gyro_calib(:,1),-gyro_std(1)*ones(length,1), 'r');
title('X Gyro');

subplot(3,1,2);
hold on
plot(gyro_calib(:,1),gyro_calib(:,3));
% plot(gyro_calib(:,1),gyro_filtered(:,3), 'g');
plot(gyro_calib(:,1),gyro_std(2)*ones(length,1), 'r');
plot(gyro_calib(:,1),-gyro_std(2)*ones(length,1), 'r');
title('Y Gyro');

subplot(3,1,3);
hold on
plot(gyro_calib(:,1),gyro_calib(:,4));
% plot(gyro_calib(:,1),gyro_filtered(:,4), 'g');
plot(gyro_calib(:,1),gyro_std(3)*ones(length,1), 'r');
plot(gyro_calib(:,1),-gyro_std(3)*ones(length,1), 'r');
title('Z Gyro');

figure
subplot(4,1,1);
hold on
plot(gyro_calib(:,1),orientation(:,1));
% plot(gyro_calib(:,1),state(:,1), 'g');
plot(gyro_calib(:,1),avg(1)*ones(length,1), 'k');
plot(gyro_calib(:,1),(avg(1) + stdev(1))*ones(length,1), 'r');
plot(gyro_calib(:,1),(avg(1) - stdev(1))*ones(length,1), 'r');
title('Quaternion 1');

subplot(4,1,2);
hold on
plot(gyro_calib(:,1),orientation(:,2));
% plot(gyro_calib(:,1),state(:,2), 'g');
plot(gyro_calib(:,1),avg(2)*ones(length,1), 'k');
plot(gyro_calib(:,1),(avg(2) + stdev(2))*ones(length,1), 'r');
plot(gyro_calib(:,1),(avg(2) - stdev(2))*ones(length,1), 'r');
title('Quaternion 2');

subplot(4,1,3);
hold on
plot(gyro_calib(:,1),orientation(:,3));
% plot(gyro_calib(:,1),state(:,3), 'g');
plot(gyro_calib(:,1),avg(3)*ones(length,1), 'k');
plot(gyro_calib(:,1),(avg(3) + stdev(3))*ones(length,1), 'r');
plot(gyro_calib(:,1),(avg(3) - stdev(3))*ones(length,1), 'r');
title('Quaternion 3');

subplot(4,1,4);
hold on
plot(gyro_calib(:,1),orientation(:,4));
% plot(gyro_calib(:,1),state(:,4), 'g');
plot(gyro_calib(:,1),avg(4)*ones(length,1), 'k');
plot(gyro_calib(:,1),(avg(4) + stdev(4))*ones(length,1), 'r');
plot(gyro_calib(:,1),(avg(4) - stdev(4))*ones(length,1), 'r');
title('Quaternion 4');

figure
subplot(3,1,1);
hold on
plot(accel_calib(:,1),position(:,1));
%plot(accel_calib(:,1),accel_std(1)*ones(length,1), 'r');
%plot(accel_calib(:,1),-accel_std(1)*ones(length,1), 'r');
title('X Position');

subplot(3,1,2);
hold on
plot(accel_calib(:,1),position(:,2));
%plot(accel_calib(:,1),accel_std(2)*ones(length,1), 'r');
%plot(accel_calib(:,1),-accel_std(2)*ones(length,1), 'r');
title('Y Position');

subplot(3,1,3);
hold on
plot(accel_calib(:,1),position(:,3));
%plot(accel_calib(:,1),9.8066+accel_std(3)*ones(length,1), 'r');
%plot(accel_calib(:,1),9.8066-accel_std(3)*ones(length,1), 'r');
title('Z Position');

figure
subplot(3,1,1);
hold on
plot(accel_calib(:,1),velocity(:,1));
%plot(accel_calib(:,1),accel_std(1)*ones(length,1), 'r');
%plot(accel_calib(:,1),-accel_std(1)*ones(length,1), 'r');
title('X Velocity');

subplot(3,1,2);
hold on
plot(accel_calib(:,1),velocity(:,2));
%plot(accel_calib(:,1),accel_std(2)*ones(length,1), 'r');
%plot(accel_calib(:,1),-accel_std(2)*ones(length,1), 'r');
title('Y Velocity');

subplot(3,1,3);
hold on
plot(accel_calib(:,1),velocity(:,3));
%plot(accel_calib(:,1),9.8066+accel_std(3)*ones(length,1), 'r');
%plot(accel_calib(:,1),9.8066-accel_std(3)*ones(length,1), 'r');
title('Z Velocity');