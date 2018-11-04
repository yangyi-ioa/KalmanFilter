function [q] = ahrs(gyro_data, length)

q = zeros(length,4);
q(1,:) = [1 0 0 0];
q(1,:) = quatnormalize(q(1,:));

for i = 2:length
   
    dt = gyro_data(i,1) - gyro_data(i-1,1);
    % q_dot = 1/2*q*w
%     q(i,:) = q(i-1,:) + dt.*(1/2.*quatmultiply(q(i-1,:),[0, gyro_data(i,2:4)]));
%     q(i,:) = quatnormalize(q(i,:));
  
      q(i,:) = getQuaternion(gyro_data(i,2),gyro_data(i,3),gyro_data(i,4),dt);
end


end

