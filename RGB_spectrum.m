% Load an example image (replace 'example_image.jpg' with the path to your image)
originalImage = imread('C:\Users\ahmad\OneDrive\Pictures\11223520916_496e78752f_b.jpg');

% Convert the image to double for processing
doubleImage = double(originalImage) / 255;

% Get the size of the image
[M, N, ~] = size(originalImage);

% Flatten each color channel
redChannel = reshape(doubleImage(:,:,1), [], 1);
greenChannel = reshape(doubleImage(:,:,2), [], 1);
blueChannel = reshape(doubleImage(:,:,3), [], 1);

% Create histograms for each color channel
redHist = histcounts(redChannel, 0:1:256);
greenHist = histcounts(greenChannel, 0:1:256);
blueHist = histcounts(blueChannel, 0:1:256);

% Plot the histograms

subplot(3, 1, 1);
plot(0:1:256-1, redHist, 'r');
title('Red Channel Histogram');
xlabel('Pixel Value (0-255)');
ylabel('Frequency');

subplot(3, 1, 2);
plot(0:1:256-1, greenHist, 'g');
title('Green Channel Histogram');
xlabel('Pixel Value (0-255)');
ylabel('Frequency');

subplot(3, 1, 3);
plot(0:1:256-1, blueHist, 'b');
title('Blue Channel Histogram');
xlabel('Pixel Value (0-255)');
ylabel('Frequency');
