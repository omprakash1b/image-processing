% Read the original image
img = imread('rgb.jpeg');

% Convert the image to grayscale if it is RGB
gray_img = rgb2gray(img);

% Add salt-and-pepper noise to the image
noisy_img = imnoise(gray_img, 'salt & pepper', 0.05); % Noise density: 5%

% Get the size of the noisy image
[rows, cols] = size(noisy_img);

% Median Filter (3x3)
filtered_img_median = noisy_img; % Initialize the filtered image
for i = 2:rows-1
    for j = 2:cols-1
        % Extract 3x3 window
        window = noisy_img(i-1:i+1, j-1:j+1);
        % Apply median filter
        filtered_img_median(i, j) = median(window(:));
    end
end

% Averaging Filter (3x3)
kernel = ones(3, 3) / 9; % 3x3 averaging kernel
filtered_img_avg = conv2(double(noisy_img), kernel, 'same'); % Convolution

% Convert the averaging result to uint8
filtered_img_avg = uint8(filtered_img_avg);

% Display the images
figure;

subplot(2, 2, 1);
imshow(gray_img);
title('Original Image');

subplot(2, 2, 2);
imshow(noisy_img);
title('Image with Salt & Pepper Noise');

subplot(2, 2, 3);
imshow(filtered_img_median);
title('Median Filtered Image');

subplot(2, 2, 4);
imshow(filtered_img_avg);
title('Averaging Filtered Image');
