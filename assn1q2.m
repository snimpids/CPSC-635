% Plotting Koch curves up to N = 10.
clear;

x0 = [0,0];
x1 = [1,0];

x2 = 2/3*x0 + 1/3*x1;
x3 = 1/2*x0 + 1/2*x1 + sqrt(3)/6*[x0(2) - x1(2),x1(1) - x0(1)];
x4 = 1/3*x0 + 2/3*x1;

K = [x0;x2;x3;x4;x1];
[m, n] = size(K);

for j = 1:100
    x0 = K(j,:);
    x1 = K(j+1,:);

    x2 = 2/3*x0 + 1/3*x1;
    x3 = 1/2*x0 + 1/2*x1 + sqrt(3)/6*[x0(2) - x1(2),x1(1) - x0(1)];
    x4 = 1/3*x0 + 2/3*x1;

    K = [K;x0;x2;x3;x4;x1];
end;

figure
plot(K(:,1),K(:,2))
axis equal