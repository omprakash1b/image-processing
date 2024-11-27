% Read and convert the image to grayscale
img = imread('rgb.jpeg');
gray_img = double(rgb2gray(img));

% Apply Gaussian blur with a specific sigma
sigma = 2; % Adjust sigma to control the blur amount
blurred_img = imgaussfilt(gray_img, sigma);

% Define the Laplacian kernel
laplacian_kernel = [0 -1 0; -1 4 -1; 0 -1 0];

% Pad the image to handle borders
pad_size = 1;
padded_img = padarray(gray_img, [pad_size, pad_size], 0, 'both');

% Initialize the output image
[M, N] = size(gray_img);
sharpened_img_laplacian = zeros(M, N);

% Apply the Laplacian filter
for i = 1:M
    for j = 1:N
        % Extract the neighborhood
        neighborhood = padded_img(i:i+2, j:j+2);
        
        % Apply the Laplacian kernel
        sharpened_img_laplacian(i, j) = sum(sum(neighborhood .* laplacian_kernel));
    end
end

% Add the Laplacian-filtered image back to the original image for sharpening
sharpened_img = blurred_img - sharpened_img_laplacian;

% Display the result
imshowpair(uint8(blurred_img), uint8(sharpened_img), 'montage');
title('Original Image (Left) vs Laplacian Sharpened Image (Right)');
