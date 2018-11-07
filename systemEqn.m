function [x] = systemEqn(x,u)

dt = 0.01;

% state equation descritized by euler's method
% q_dot = 1/2*q*w
temp = 1/2.*quatmultiply(x',[0, u(1), u(2), u(3)]);
x = x + dt.*temp';
temp = quatnormalize(x');
x = temp';