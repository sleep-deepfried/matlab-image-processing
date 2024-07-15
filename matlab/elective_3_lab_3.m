% Acquire the image
img = imread('..\images\mikha.jpeg');

% Convert image to grayscale
gray_img = rgb2gray(img);

% Show original image
figure(1)
subplot(1,2,1);
imshow(gray_img); title("Original Image");
imwrite(gray_img,'..\processed_images\lab-3\greyscale\mikha_gray.png', 'png');

% Display the histogram of the original image
subplot(1,2,2);
imhist(gray_img); title("Histogram of Original Image");

% Perform histogram equalization
eq_img = histeq(gray_img);

% Display the equalized image
figure(2)
subplot(1,2,1);
imshow(eq_img); title("Equalized Image");
imwrite(eq_img,'..\processed_images\lab-3\greyscale\mikha_eq.png', 'png');

% Display the histogram of the equalized image
subplot(1,2,2);
imhist(eq_img); title("Histogram of Equalized Image");

% Perform Constrast Enhancement
adj_img = imadjust(gray_img);

% Display the adjusted image
figure(3)
subplot(1,2,1);
imshow(adj_img); title("Adjusted Image");
imwrite(adj_img,'..\processed_images\lab-3\greyscale\mikha_adj.png', 'png');

% Display the histogram of the adjusted image
subplot(1,2,2);
imhist(adj_img); title("Histogram of Adjusted Image");

% Perform Adaptive Histogram Equalization
adapthist_img = adapthisteq(gray_img);

% Display the adaptive histogram equalized image
figure(4)
subplot(1,2,1);
imshow(adapthist_img); title("Adaptive Histogram Equalized Image");
imwrite(adapthist_img,'..\processed_images\lab-3\greyscale\mikha_adapthist.png', 'png');

% Display the histogram of the adaptive histogram equalized image
subplot(1,2,2);
imhist(adapthist_img); title("Histogram of Adaptive Histogram Equalized Image");

% Perform Spatial Filtering

% Mean Filtering
mean_filter = fspecial('average', [3 3]);
mean_img = imfilter(gray_img, mean_filter);

% Display the mean filtered image
figure(5)
plot(1,1);
imshow(mean_img); title("Mean Filtered Image");
imwrite(mean_img,'..\processed_images\lab-3\greyscale\mikha_mean.png', 'png');

% Median Filtering
median_img = medfilt2(gray_img, [3 3]);

% Display the median filtered image
figure(6)
plot(1,1);
imshow(median_img); title("Median Filtered Image");
imwrite(median_img,'..\processed_images\lab-3\greyscale\mikha_median.png', 'png');

% Parameter Modification (using RGB colored image)
img_lab = rgb2lab(img);

max_luminosity = 100;
L = img_lab(:,:,1)/max_luminosity;
% Show original image
figure(7)
subplot(1,2,1);
imshow(img); title("Original Image");
imwrite(adapthist_img,'..\processed_images\lab-3\rgb\mikha_rgb.png', 'png');

% Display the histogram of the original image
subplot(1,2,2);
imhist(img); title("Histogram of Original Image");

% Perform histogram equalization
eq_img_1 = img_lab;
eq_img_1(:,:,1) = histeq(L) * max_luminosity;
eq_img_1 = lab2rgb(eq_img_1);

% Display the equalized image
figure(8)
subplot(1,2,1);
imshow(eq_img_1); title("Equalized Image");
imwrite(eq_img_1,'..\processed_images\lab-3\rgb\mikha_eq.png', 'png');

% Display the histogram of the equalized image
subplot(1,2,2);
imhist(eq_img_1); title("Histogram of Equalized Image");

% Perform Contrast Enhancement
adj_img_1 = img_lab;
adj_img_1(:,:,1) = imadjust(L) * max_luminosity;
adj_img_1 = lab2rgb(adj_img_1);

% Display the adjusted image
figure(9)
subplot(1,2,1);
imshow(adj_img_1); title("Adjusted Image");
imwrite(adj_img_1,'..\processed_images\lab-3\rgb\mikha_adj.png', 'png');

% Display the histogram of the adjusted image
subplot(1,2,2);
imhist(adj_img_1); title("Histogram of Adjusted Image");

% Perform Adaptive Histogram Equalization
adapthist_img_1 = img_lab;
adapthist_img_1(:,:,1) = adapthisteq(L) * max_luminosity;
adapthist_img_1 = lab2rgb(adapthist_img_1);

% Display the adaptive histogram equalized image
figure(10)
subplot(1,2,1);
imshow(adapthist_img_1); title("Adaptive Histogram Equalized Image");
imwrite(adapthist_img_1,'..\processed_images\lab-3\rgb\mikha_adapthist.png', 'png');

% Display the histogram of the adaptive histogram equalized image
subplot(1,2,2);
imhist(adapthist_img_1); title("Histogram of Adaptive Histogram Equalized Image");

% Perform Spatial Filtering
img_noise = imnoise(img, 'salt & pepper', 0.02);
imwrite(img_noise,'..\processed_images\lab-3\rgb\mikha_noise.png', 'png');
% Mean Filtering

mean_filter_1 = fspecial('average', [3 3]);
mean_img_1 = imfilter(img_noise, mean_filter_1);

% Display the mean filtered image
figure(11)
imshowpair(img_noise, mean_img_1, 'montage'); title("Mean Filtered Image");
imwrite(mean_img_1,'..\processed_images\lab-3\greyscale\mikha_mean.png', 'png');

% Median Filtering
img_lab_noise = rgb2lab(img_noise);
median_img_1 = img_lab_noise;
median_img_1(:,:,1) = medfilt2(L) * max_luminosity;
median_img_1 = lab2rgb(median_img_1);

% Display the median filtered image
figure(12)
imshowpair(img_noise, median_img_1, 'montage'); title("Median Filtered Image");
imwrite(median_img_1,'..\processed_images\lab-3\greyscale\mikha_median.png', 'png');

