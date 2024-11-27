% a. DFT-Domain Low Pass Filtering

% Read the image
img = imread('rgb.jpeg');

% Convert the image to grayscale
gray_img = rgb2gray(img);

% Perform 2D DFT (Discrete Fourier Transform)
F = fft2(double(gray_img)); 

% Shift zero-frequency component to the center (using fftshift)
F_shifted = fftshift(F);

% Get the size of the image
[M, N] = size(gray_img);

% Create a low-pass filter mask
D0 = 50;  % Cutoff frequency (controls the filter's radius)
[u, v] = meshgrid(-floor(N/2):floor(N/2), -floor(M/2):floor(M/2));
D = sqrt(u.^2 + v.^2);  % Distance matrix

% Low-pass filter mask (circular mask)
H = double(D <= D0);

if size(H) ~= size(F_shifted)
    H = imresize(H, size(F_shifted));
end

% Apply the low-pass filter in the DFT domain
F_filtered = F_shifted .* H;

% Shift back the zero-frequency component (inverse fftshift)
F_filtered = ifftshift(F_filtered);

% Inverse DFT to get the filtered image
filtered_img = real(ifft2(F_filtered));

% Display the original and filtered images
figure;
subplot(1, 2, 1);
imshow(gray_img);
title('Original Image');

subplot(1, 2, 2);
imshow(uint8(filtered_img));
title('LPF Image (DFT Domain)');
