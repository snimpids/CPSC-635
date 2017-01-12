%% Warming up with images
clear;

tic;
% Setting colormap and scale factor.
scale = 256;
colormap(gray(scale));

% Setting the length of the initial array. 
N = 50;

% Creating the first gradient array.
x = [zeros(1,25),((26:N)-25)/25];
x = x.^2;

% Creating the 100-element array by concatentating the negated, reversed 
% first array.
X = [x,-x(end:-1:1)];

% Now we scale the data to ensure that the image displays correctly.
X = scale*(X - min(X))/(max(X) - min(X));

% Creating the 50x100 matrix and displaying it as an image.
xMatrix = repmat(X,N,1);
image(xMatrix)
toc