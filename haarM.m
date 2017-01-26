function H = haarM(T,N)

%   haarM.m: Takes in variable T, which is the length of the data vector,
%            and variable n, which is the total number of decompositions to 
%            be performed. Returns Haar matrix of size TxT.

HArray = zeros(T,T,N);

% Creating a sequence of Haar matrices, each with smaller Haar parts.
% The size of the Haar part is given by T/(2^n)xT/(2^n).
for n = 1:N
    Hn = HArray(:,:,n);
    for i = 1:T/(2^(n))
        Hn(i, i+i-1) = 0.5;
        Hn(i, i+i) = 0.5;
        Hn(i+T/(2^(n)), i+i-1) = -0.5;
        Hn(i+T/(2^(n)), i+i) = 0.5;
    end;

    % Setting the main diagonal below the Haar part to be the identity.
    for i = T/(2^(n-1))+1:T
        Hn(i,i) = 1;
    end;

    HArray(:,:,n) = Hn;
end;

if N == 1
    H = HArray(:,:,N);          % For a single decomposition.
else
    H = eye(T,T);               % For multiple decompositions.
    for n = 1:N
        % Here H represents multiple decompositions applied consecutively.
        H = HArray(:,:,n)*H;    
    end;
end;