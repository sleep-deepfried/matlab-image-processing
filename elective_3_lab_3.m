% Acquire the image
img = imread("images\mikha.jpeg");

% Convert image to grayscale
gray_img = rgb2gray(img);

% Show original image
figure(1)
subplot(1,2,1);
imshow(gray_img); title("Original Image");

% Display the histogram of the original image
subplot(1,2,2);
imhist(gray_img); title("Histogram of Original Image");


% Perform histogram equalization
eq_img = histeq(gray_img);

% Display the equalized image
figure(2)
subplot(1,2,1);
imshow(eq_img); title("Equalized Image");

% Display the histogram of the equalized image
subplot(1,2,2);
imhist(eq_img); title("Histogram of Equalized Image");

% Perform Constrast Enhancement
adj_img = imadjust(gray_img);

% Display the adjusted image
figure(3)
subplot(1,2,1);
imshow(adj_img); title("Adjusted Image");

% Display the histogram of the adjusted image
subplot(1,2,2);
imhist(adj_img); title("Histogram of Adjusted Image");

% Perform Adaptive Histogram Equalization
adapthist_img = adapthisteq(gray_img);

% Display the adaptive histogram equalized image
figure(4)
subplot(1,2,1);
imshow(adapthist_img); title("Adaptive Histogram Equalized Image");

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

% Median Filtering
median_img = medfilt2(gray_img, [3 3]);

% Display the median filtered image
figure(6)
plot(1,1);
imshow(median_img); title("Median Filtered Image");


