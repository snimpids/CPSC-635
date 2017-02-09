function combined_image = CombIm(img_filepath)

% CombIm.m -- Takes in a multi-channel image and returns a single channel
%             image.
%    Input -- img_filepath: string containing image filepath.

if exist(img_filepath, 'file') == 2
    I = imread(img_filepath);
else
    errorMessage = sprintf('Error: file does not exist:\n%s',...
        img_filepath);
    uiwait(msgbox(errorMessage));
end;

if  size(I,3) ~= 3
    combined_image = I;
elseif size(I,3) == 3
    c = imfuse(I(:,:,1),I(:,:,2),'blend');
    combined_image = imfuse(c,I(:,:,3),'blend');
    combined_image = double(combined_image);
else
    errorMessage = sprintf('Error: file is not an image:\n%s',...
        img_filepath);
    uiwait(msgbox(errorMessage));
end;