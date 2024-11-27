% Read the grayscale image (replace with your image file)
image = imread('rgb.jpeg');  % Replace with your image file

% Convert the image to grayscale if it is RGB
if size(image, 3) == 3
    image = rgb2gray(image);  % Convert to grayscale if the image is RGB
end

% Convert the image to double for proper processing
image = double(image);

% Get the dimensions of the image
[M, N] = size(image);

% Step 1: Initialize the histogram array (for grayscale images, intensity ranges from 0 to 255)
histogram = zeros(1, 256);

% Step 2: Calculate the histogram by counting the occurrences of each intensity value
for i = 1:M
    for j = 1:N
        intensity = round(image(i, j));  % Get the intensity value (rounded to the nearest integer)
        histogram(intensity + 1) = histogram(intensity + 1) + 1;  % Increment the count for this intensity
    end
end

% Step 3: Plot the histogram
figure;
bar(0:255, histogram, 'BarWidth', 1);
title('Histogram of Grayscale Image');
xlabel('Intensity Value');
ylabel('Frequency');
xlim([0 255]);  % Limit x-axis from 0 to 255 for intensity values
grid on;
