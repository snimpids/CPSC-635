clear;

T = 1024;

k = 1:T;

t = (0:2*pi/(T-1):2*pi);
x = (1:T);
f = @(t) sin(t)+randn(1,T)/10;

F = f(t);

% M = 0.5*[1,1,0,0;0,0,1,1;-1,1,0,0;0,0,-1,1];
% 
% H = repmat(M,3)
H = zeros(16,16);

for j = 1:2:16
    for i = 1:8
        if j == i+1 || i == j
            H(i,j) = 1
        end;
    end;
end;