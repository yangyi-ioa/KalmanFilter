function [accel_calibrated,gyro_calibrated] = calibration(accel_raw, gyro_raw, length)

accel_avg = mean(accel_raw(1:500,2:4));
gyro_avg = mean(gyro_raw(1:500,2:4));

accel_bias = accel_avg - [0 0 9.8066];
gyro_bias = gyro_avg;

accel_calibrated = zeros(length,4);
gyro_calibrated = zeros(length,4);

for i = 1:length
    accel_calibrated(i,:) = accel_raw(i,:) - [0, accel_bias];
    gyro_calibrated(i,:) = gyro_raw(i,:) - [0, gyro_bias];
end

end

