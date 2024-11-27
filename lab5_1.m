% Read the grayscale image
image = imread('rgb.jpeg');

% Convert to grayscale if it's an RGB image
if size(image, 3) == 3
    image = rgb2gray(image);
end

figure;
subplot(2,1,1);
imshow(image);
title('Original Image');

[rows, cols] = size(image);

histogram = zeros(1, 256);


for i = 1:rows
    for j = 1:cols
        pixel_value = image(i, j);  % Get the pixel intensity
        histogram(pixel_value + 1) = histogram(pixel_value + 1) + 1;  % Increment the count
    end
end

% Plot the histogram
subplot(2,1,2);
bar(0:255, histogram, 'b'); 
title('Histogram of Grayscale Image');
xlabel('Pixel Intensity');
ylabel('Frequency');
xlim([0 255]);  
