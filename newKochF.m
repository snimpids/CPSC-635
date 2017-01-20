function K1 = newKochF(K,n)
[S,~] = size(K);

S = S+3*sum(4.^(n-1));
K1 = zeros(S,2);

K1(1:4:end,:) = K;
K1(2:4:end,:) = (2*K(1:end-1,:) + K(2:end,:))/3;
K1(3:4:end,:) = (K(1:end-1,:) + K(2:end,:))/2 + ...
    sqrt(3)/6*[K(1:end-1,2)-K(2:end,2),K(2:end,1)-K(1:end-1,1)];
K1(4:4:end,:) = (K(1:end-1,:) + 2*K(2:end,:))/3;