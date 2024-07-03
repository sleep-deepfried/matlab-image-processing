% Read an image
img = imread("images\mikha.jpeg");

% Display the image
figure(1)
imshow(img); title("Original Image");

% Get image dimensions (rows, columns, color channles)
[rows, cols, chanels] = size(img)
disp(['Image size: ', num2str(rows), 'x' num2str(cols), 'x', num2str(chanels)]);

% Check color model (grayscale or RGB)

