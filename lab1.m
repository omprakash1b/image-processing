% Read the RGB image
rgbImage = imread('/Users/om/Downloads/images.jpeg');
%Display Original Image
imshow(rgbImage);
title("Original Image")

% Convert RGB image to grayscale
grayImage = rgb2gray(rgbImage);

% Display the grayscale image
figure, imshow(grayImage);
title('Grayscale Image');

% Perform image negation on grayscale image
negImage = 255 - grayImage;

% Display the negative image
figure, imshow(negImage);
title('Negative Image');
