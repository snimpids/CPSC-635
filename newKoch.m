clear;

K0 = [0,0;1,0];

for n = 1:10
    K = newKochF(K0,n);
    K0 = K;
end;

plot(K(:,1),K(:,2));axis equal