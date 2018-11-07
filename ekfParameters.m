% state datarate
Ts = 0.01;

% measurement datarate
Tm = 0.1;

% initial state and covariance
x0 = [0, 1/sqrt(2), 1/sqrt(2), 0];
sigma = 10 * eye(4,4);

% process covariance
Q = 0.2 * eye(4,4);

% measurement covariance
R = 0.5 * eye(4,4);
S = 0.5 * eye(4,4);