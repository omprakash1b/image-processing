% Read the input image
img = imread('rgb.jpeg');

% Convert the image to grayscale if it is RGB
gray_img = rgb2gray(img);

% Convert the image to double for calculations
gray_img = double(gray_img);

% Get the size of the image
[rows, cols] = size(gray_img);

% Sobel Operator Kernels
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];

% Prewitt Operator Kernels
prewitt_x = [-1 0 1; -1 0 1; -1 0 1];
prewitt_y = [-1 -1 -1; 0 0 0; 1 1 1];

% Roberts Operator Kernels
roberts_x = [1 0; 0 -1];
roberts_y = [0 1; -1 0];

% Initialize edge detection outputs
sobel_edges = zeros(rows, cols);
prewitt_edges = zeros(rows, cols);
roberts_edges = zeros(rows, cols);

% Padding the image for boundary handling
padded_img = padarray(gray_img, [1 1], 'replicate');

% Sobel and Prewitt Convolution (3x3 Kernels)
for i = 2:rows+1
    for j = 2:cols+1
        % Extract the 3x3 region
        region = padded_img(i-1:i+1, j-1:j+1);
        
        % Sobel Gradient
        Gx_sobel = sum(sum(region .* sobel_x));
        Gy_sobel = sum(sum(region .* sobel_y));
        sobel_edges(i-1, j-1) = sqrt(Gx_sobel^2 + Gy_sobel^2);
        
        % Prewitt Gradient
        Gx_prewitt = sum(sum(region .* prewitt_x));
        Gy_prewitt = sum(sum(region .* prewitt_y));
        prewitt_edges(i-1, j-1) = sqrt(Gx_prewitt^2 + Gy_prewitt^2);
    end
end

% Roberts Convolution (2x2 Kernels)
padded_img_roberts = padarray(gray_img, [1 1], 'replicate');
for i = 1:rows
    for j = 1:cols
        % Extract the 2x2 region
        region = padded_img_roberts(i:i+1, j:j+1);
        
        % Roberts Gradient
        Gx_roberts = sum(sum(region .* roberts_x));
        Gy_roberts = sum(sum(region .* roberts_y));
        roberts_edges(i, j) = sqrt(Gx_roberts^2 + Gy_roberts^2);
    end
end

% Normalize the results to the range [0, 255]
sobel_edges = uint8(255 * mat2gray(sobel_edges));
prewitt_edges = uint8(255 * mat2gray(prewitt_edges));
roberts_edges = uint8(255 * mat2gray(roberts_edges));

% Display the results
figure;

subplot(2, 2, 1);
imshow(uint8(gray_img));
title('Original Grayscale Image');

subplot(2, 2, 2);
imshow(sobel_edges);
title('Sobel Operator');

subplot(2, 2, 3);
imshow(prewitt_edges);
title('Prewitt Operator');

subplot(2, 2, 4);
imshow(roberts_edges);
title('Roberts Operator');
