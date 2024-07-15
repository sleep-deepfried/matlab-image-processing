% Acquire the Image
img = imread("..\images\mikha.jpeg");

gray_img = rgb2gray(img);

% Show the original image
figure(1);
imshow(gray_img); 
title("Original Image");

% Simulate and Restore Motion Blur Without Noise
PSF = fspecial('motion', 21, 21);
iDouble = im2double(gray_img);
blurred = imfilter(iDouble, PSF, 'conv', 'circular');
figure (2);
imshow(blurred); title('Blurred Image')

% Restore the image using the Wiener Filter
weiner = deconvwnr(blurred, PSF);

% Show the restored image
figure(3);
imshow(weiner); title('Restored Image');

% Parameter Modification

% Simulate and Restore Motion Blur and Gaussian Noise
noise_mean = 0;
noise_var = 0.0001;
blurred_noisy = imnoise(blurred,'gaussian',noise_mean,noise_var);

% Show the blurred and noisy image
figure(4);
imshow(blurred_noisy); title('Blurred and Noisy Image');

% Restore the image using the Wiener Filter
weiner2 = deconvwnr(blurred_noisy,PSF);

% Show the restored image (NSR = 0)
figure(5)
imshow(weiner2); title('Restoration of Blurred Noisy Image (NSR = 0)')

% Restore the image using the Wiener Filter with a more realtisc value
signal_var = var(iDouble(:));
NSR = noise_var / signal_var;
weiner3 = deconvwnr(blurred_noisy,PSF,NSR);

% Show the restored image (Estimated NSR)
figure(6)
imshow(weiner3); title('Restoration of Blurred Noisy Image (Estimated NSR)')
