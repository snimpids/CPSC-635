function K1 = koch(K,n)
% koch.m:       Takes in a line segment or series of line segments and
%               returns the resulting Koch curve.
% K := line segment or set of line segments (in Sx2 matrix form)
% n := nth iteration, used in defining the size of the solution set.

[S,~] = size(K);

S = S+3*sum(4.^(n-1));  % Calculate number of rows in next solution set.
K1 = zeros(S,2);        % Define next solution set.

% Computing the next solution set and slicing in solution values.
K1(1:4:end,:) = K;
K1(2:4:end,:) = (2*K(1:end-1,:) + K(2:end,:))/3;
K1(3:4:end,:) = (K(1:end-1,:) + K(2:end,:))/2 + ...
    sqrt(3)/6*[K(1:end-1,2)-K(2:end,2),K(2:end,1)-K(1:end-1,1)];
K1(4:4:end,:) = (K(1:end-1,:) + 2*K(2:end,:))/3;