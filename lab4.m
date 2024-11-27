% Read the grayscale image
image = imread('rgb.jpeg');

% Ensure the image is grayscale (if not, convert it)
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Display the original grayscale image
figure;
subplot(3, 4, 1);
imshow(image);
title('Original Image');

% Initialize a cell array to store bit planes
bit_planes = cell(1, 8);

% Extract and display each bit plane
for k = 1:8
    bit_planes{k} = bitget(image, k);  % Extract bit plane k
    subplot(3, 4, k + 1);
    imshow(logical(bit_planes{k}));
    title(['Bit Plane ', num2str(k)]);
end

% Recombine the bit planes to reconstruct the original image
recombined_image = zeros(size(image), 'uint8');
for k = 1:8
    recombined_image = recombined_image + uint8(bit_planes{k}) * 2^(k-1);
end

% Display the recombined image
subplot(3, 4, 10);
imshow(recombined_image);
title('Recombined Image');