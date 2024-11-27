% Read the RGB image
image = imread('aditya.jpeg');

% Extract the R, G, and B components
R = image(:,:,1); % Red channel
G = image(:,:,2); % Green channel
B = image(:,:,3); % Blue channel

% Display the original and the RGB components
figure, 
subplot(2,2,1);
imshow(image);
title('Original Image');

subplot(2,2,2);
imshow(R);
title('Red Component');

subplot(2,2,3);
imshow(G);
title('Green Component');
 
subplot(2,2,4);
imshow(B);
title('Blue Component');

one = zeros(size(R),'uint8');

cr = cat(3,R,one,one);
cg = cat(3,one,G,one);
cb = cat(3,one,one,B);
figure,
subplot(2,2,1);
imshow(image);
title('Original Image');
subplot(2,2,2);
imshow(cr);
title('Red');
subplot(2,2,3);
imshow(cg);
title('Green');
subplot(2,2,4);
imshow(cb);
title('Blue');

% Combine the RGB components to form the original image
combinedImage = cat(3, R, G, B);

% Display the combined image
figure, imshow(combinedImage);
title('Combined Image');
