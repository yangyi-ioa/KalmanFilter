function [z] = measurementEqn2(x)

mag_x = -6.565515094;
mag_y = -5.953721888;
mag_z = -36.49581319;


% accelerometer measurement equation
z = quatmultiply(quatconj(x'),quatmultiply([0, mag_x, mag_y, mag_z],x'));
% z = temp';