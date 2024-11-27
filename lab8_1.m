% Read and convert the image to grayscale
img = imread('rgb.jpeg');
gray_img = rgb2gray(img);
gray_img = imnoise(gray_img,'gaussian');


% Define the kernel (e.g., 3x3 averaging filter)
kernel = ones(3, 3) / 9;

% Apply the filter
smoothed_img_mean = conv2(double(gray_img), kernel, 'same');

% Display result
figure,
imshowpair(gray_img, uint8(smoothed_img_mean), 'montage');
title('Original Image vs Mean Filtered Image ');
figure,
% Define the window size
window_size = 3;

% Apply the median filter
smoothed_img_median = medfilt2(gray_img, [window_size window_size]);

% Display result
imshowpair(gray_img, smoothed_img_median, 'montage');
title('Original Image vs Median Filtered Image');

% Define the Gaussian kernel (e.g., 3x3 with standard deviation 1)
sigma = 1;
kernel_size = 3;
[x, y] = meshgrid(-floor(kernel_size/2):floor(kernel_size/2), -floor(kernel_size/2):floor(kernel_size/2));
gaussian_kernel = exp(-(x.^2 + y.^2) / (2 * sigma^2));
gaussian_kernel = gaussian_kernel / sum(gaussian_kernel(:));

% Apply the Gaussian filter
smoothed_img_gaussian = conv2(double(gray_img), gaussian_kernel, 'same');
figure,
% Display result
imshowpair(gray_img, uint8(smoothed_img_gaussian), 'montage');
title('Original Image vs Gaussian Filtered Image');
