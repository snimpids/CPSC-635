%% Animating Expansion of DFT

% Setting 256 grayscale colormap for all figures.
set(0,'DefaultFigureColormap',gray(256));

n = 32;

% Square initial function.
img = 64*ones(n);
img(8:24,8:24) = 192;

% Representing the indices of the Fourier domain.
u = ones(n,1)*[0:n/2 - 1, -n/2: -1];
v = repmat([0:n/2 - 1, -n/2: -1]',1,32);

w = abs(u) + abs(v);
wmax = max(w(:));

% Plotting the initial function.
figure(1);
surf(img);

% Computing the DFT.
F = fft2(img);

% Reconstructing the image.
fhat = zeros(n);
figure(2);
for k = 1:wmax
    Fk = F.*(w == k);
    fk = ifft2(Fk);
    
    fhat = fhat + fk;
    view(50,28); surf(fhat); zlim([-64, 192]);
    pause(1);
end;