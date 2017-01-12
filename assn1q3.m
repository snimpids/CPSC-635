clear;

t = (0:2*pi/(1024-1):2*pi);
x = (1:1024);
f = @(t) sin(t)+randn(1,1024)/10;

F = f(t);

L = length(F);
d = 1:L/2;

% phi = (f(2*d-1)-f(2*d))/2;

% plot(phi)