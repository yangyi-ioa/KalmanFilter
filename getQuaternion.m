function [q] = getQuaternion(w_x, w_y, w_z, dt)

    persistent q_last;
    
    if(isempty(q_last))
       q_last = [1 0 0 0]; 
    end

    q = q_last + dt.*(1/2.*quatmultiply(q_last,[0, w_x, w_y, w_z]));
    q = quatnormalize(q);
    
    q_last = q;

end

