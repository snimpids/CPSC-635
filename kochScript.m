clear;

% Setting number of iterations and initial endpoints.
N = 10;
K0 = [0,0;1,0];

% Performing iterations.
for n = 1:N
    K = koch(K0,n);
    K0 = K;
end;

plot(K(:,1),K(:,2));axis equal
title('Koch curve with N=10 iterations');