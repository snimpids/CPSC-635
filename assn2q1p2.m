%% Animating Expansion of DFT on an image.
clear;

% Setting 256 grayscale colormap for all figures.
set(0,'DefaultFigureColormap',gray(256));

% img = double(imread('Z:/photographer.jpg'));
img = CombIm('photographer.jpg');
[n, ~] = size(img);

% imagesc(img); axis image

% Representing the indices of the Fourier domain.
u = ones(n,1)*[0:n/2 - 1, -n/2: -1];
v = repmat([0:n/2 - 1, -n/2: -1]',1,n);

w = abs(u) + abs(v);
wmax = max(w(:));

% Computing the DFT.
F = fft2(img);

% Reconstructing the image.
fhat = zeros(n);

for k = 1:wmax
    Fk = F.*(w == k);
    fk = ifft2(Fk);
    
    fhat = fhat + fk;
    
    % Scaling the reconstructed image for the movie.
    fscaled = uint8(255*(fhat - min(fhat(:)))/(max(fhat(:)) - min(fhat(:))));
    
    % Creating the frames of the movie.
    [fscaled, map] = gray2ind(fscaled, 256);
    frame(k) = im2frame(fscaled, map);
    
end;
movie(gcf,frame)