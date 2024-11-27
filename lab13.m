% Read the input image
image = imread('rgb.jpeg');  % Replace with your image file

% Convert the image to grayscale if it is RGB
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Convert the image to binary (optional, depending on the input)
image = imbinarize(image);  % Make sure the image is binary (0 and 1)

% Display the original image
figure;
subplot(1, 2, 1);
imshow(image, []);
title('Original Image');

% Step 1: Compute the Radon Transform
theta = 0:1:180;  % Define angles from 0 to 180 degrees with step size of 1 degree
[R, xp] = radon(image, theta);  % R is the Radon transform, xp is the corresponding coordinates

% Step 2: Display the Radon Transform
subplot(1, 2, 2);
imagesc(theta, xp, R);  % Plot the Radon transform
colormap('gray');
colorbar;
title('Radon Transform');
xlabel('Theta (degrees)');
ylabel('X'' (Radon Transform Position)');
