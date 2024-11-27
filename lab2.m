% Read the image
inputImage = imread('wallpaper2.jpg');
imshow(inputImage);
title('Input Image');


% Apply power law transformation
gamma = 3.0; % Choose a value for gamma
c = 2; % Scaling constant

% Normalize the input image to the range [0, 1]
normalizedImage = double(inputImage) / 255;

% Apply the transformation
outputImage = c * (normalizedImage .^ gamma);

% Scale back to the range [0, 255]
outputImage = uint8(outputImage * 255);

% Display the transformed image
figure, imshow(outputImage);
title(['Power Law Transformed Image with \gamma = ', num2str(gamma),'and c = ',num2str(c)]);
