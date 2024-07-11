% Acquire the Image
img = imread("images\mikha_malabo.jpeg");

% Show the original image
figure(1);
imshow(img); 
title("Original Image");

% Use Gaussian filter for Image Restoration
% Create a Gaussian filter
gaussian_filter = fspecial('gaussian', 7, 10);

% Apply the filter to the image
gaussian_img = imfilter(img, gaussian_filter, "symmetric", "conv");

% Show the filtered image
figure(2);
imshow(gaussian_img); 
title("Gaussian Blurred Image");

% Convert image to double precision for further processing
Idouble = im2double(img);

% Estimate the noise variance (you can set this manually or calculate based on your image)
noise_var = 0.001;

% Calculate the signal variance
signal_var = var(Idouble(:));

% Calculate the Noise-to-Signal Ratio (NSR)
NSR = noise_var / signal_var;

% Deblur the image using the Wiener deconvolution
deblurred_img = deconvwnr(im2double(gaussian_img), gaussian_filter, NSR);

% Show the deblurred image
figure(3);
imshow(deblurred_img); 
title("Deblurred Image");
