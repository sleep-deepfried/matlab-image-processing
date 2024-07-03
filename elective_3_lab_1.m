% Read the Image
img = imread("C:\Users\Earl\Downloads\yoda.jpg");

% Rotate by 45 degrees
rotated_img = imrotate(img, 45);

% Flip horizontally
flipped_img = fliplr(rotated_img);

% Display results
figure(1);
plot(1,1); imshow(img); title('Original Image');
figure(2);
plot(1,1); imshow(rotated_img); title('Rotate Image');
figure(3);
plot(1,1); imshow(flipped_img); title('Flipped Image');