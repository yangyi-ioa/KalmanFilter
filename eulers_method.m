function [position, velocity] = eulers_method(accel, orientation, length)

velocity = zeros(length,3);
position = zeros(length,3);

for i = 2:length
    
    dt = accel(i,1) - accel(i-1,1);
    
%     a = quatmult(quatmult(orientation(:,i), [0, accel(i,2:4)]),[orientation(1,i); -orientation(2,i); -orientation(3,i); -orientation(4,i)]);
%     accel(i,2:4) = a(2:4)';
     
%     accel(2:4) = quatrotate(orientation(i,:),accel(i,2:4));
% 
%     velocity(i,:) = velocity(i-1,:) + dt*(accel(i,2:4) - [0 0 9.8066]);
%     position(i,:) = position(i-1,:) + dt*velocity(i-1,:) + 0.5*dt^2*(accel(i,2:4) - [0 0 9.8066]);

    [position(i,:), velocity(i,:)] = getLinear(orientation(i,:), accel(i,2), accel(i,3), accel(i,4), dt);
    
end

% figure
% subplot(3,1,1)
% hold on
% plot(accel(:,1),accel(:,2));
% title('Global Accel X');
% 
% subplot(3,1,2)
% hold on
% plot(accel(:,1),accel(:,3));
% title('Global Accel Y');
% 
% subplot(3,1,3)
% hold on
% plot(accel(:,1),accel(:,4));
% title('Global Accel Z');

end

