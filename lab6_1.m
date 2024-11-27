image = imread('rgb.jpeg');

if size(image, 3) == 3
    image = rgb2gray(image);
end

[rows, cols] = size(image);

histogram = zeros(1, 256);  

for i = 1:rows
    for j = 1:cols
        pixel_value = image(i, j);
        histogram(pixel_value + 1) = histogram(pixel_value + 1) + 1;  
    end
end

cdf = cumsum(histogram);  
cdf_normalized = cdf / max(cdf);  

equalized_image = uint8(zeros(rows, cols));  

for i = 1:rows
    for j = 1:cols
        original_value = image(i, j); 
        new_value = round(cdf_normalized(original_value + 1) * 255);  
        equalized_image(i, j) = new_value;  
    end
end

figure;
subplot(1, 2, 1);
imshow(image);
title('Original Image');

subplot(1, 2, 2);
imshow(equalized_image);
title('Histogram Equalized Image');

figure;
subplot(1, 2, 1);
bar(0:255, histogram, 'k');
title('Histogram of Original Image');
xlim([0 255]);

equalized_histogram = zeros(1, 256);
for i = 1:rows
    for j = 1:cols
        pixel_value = equalized_image(i, j);
        equalized_histogram(pixel_value + 1) = equalized_histogram(pixel_value + 1) + 1;
    end
end

subplot(1, 2, 2);
bar(0:255, equalized_histogram, 'k');
title('Histogram of Equalized Image');
xlim([0 255]);
