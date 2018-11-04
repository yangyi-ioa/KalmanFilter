function [position, velocity] = getLinear(q, accel_x, accel_y, accel_z, dt)

    persistent velocity_last;
    persistent position_last;
    
    if(isempty(velocity_last))
        velocity_last = [0 0 0];
        position_last = [0 0 0];
    end

%     accel = quatrotate(q,[accel_x, accel_y, accel_z]);
    accel = quatmultiply(quatconj(q),quatmultiply([0, accel_x, accel_y, accel_z],q)); 

    velocity = velocity_last + dt*(accel(2:4) - [0 0 9.8066]);
    position = position_last + dt*velocity_last + 0.5*dt^2*(accel(2:4) - [0 0 9.8066]);
    
    velocity_last = velocity;
    position_last = position;

end