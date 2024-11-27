% Read the image and convert it to grayscale
img = imread('rgb.jpeg');
gray_img = rgb2gray(img);  % If the image is in color
%gray_img = ~imbinarize(gray_img);

% Perform 2D DCT
dct_img = dct2(double(gray_img));

% Get the dimensions of the image
[rows, cols] = size(dct_img);

% Retain top 25% of the coefficients (low frequencies)
retain_rows = round(0.5 * rows);
retain_cols = round(0.5 * cols);

% Zero out the remaining coefficients
dct_img(retain_rows:end, retain_cols:end) = 0;

% Perform inverse DCT to reconstruct the image
reconstructed_img = idct2(dct_img);

% Display the original and reconstructed images
figure,
subplot(1,2,1);
imshow(gray_img);
title('Original Image');
subplot(1,2,2);
imshow(uint8(reconstructed_img));
title('Reconstructed Image');


%imshowpair(gray_img, uint8(reconstructed_img), 'montage');
%title('Original Image (Left) vs Reconstructed Image (Right)');
