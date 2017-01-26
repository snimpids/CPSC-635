clear;

% Setting colormap to 256-grayscale.
scale = 256;
colormap(gray(scale));
img = imread('Z:/CPSC 635/cat.png');

[M,~] = size(img);
cat = im2double(img);

% Obtaining the Haar matrix.
H = haarM(M,3);

% 3 Haar decompositions on the image.
rowsCat = H*cat;
colsCat = H*rowsCat';

N = max(colsCat(:));
n = min(colsCat(:));
R = range(colsCat(:));

% Rescaling the image to the correct grayscale values.
colsCat = scale*(colsCat - n)/(N - n);

% Collecting only the high-frequency (removed) data.
c1 = colsCat(129:end,1:128);
c2 = colsCat(1:128,129:end);
c3 = colsCat(129:end,129:end);

% Finding the min and max of the high-frequency (removed) data.
mx = max([max(c1(:)),max(c2(:)),max(c3(:))]);
mn = min([min(c1(:)),min(c2(:)),min(c3(:))]);

fprintf(['The scaled max of the removed data is ', num2str(mx), '.\n',...
    'The scaled min of the removed data is ', num2str(mn), '.\n',...
    'The range is ', num2str(mx-mn), '.\n']);

% Displaying the Haar decompositions.
image(colsCat);