% Read an image
imagePath = "C:\Users\ahmad\OneDrive\Pictures\11223520916_496e78752f_b.jpg";
originalImage = imread(imagePath);

% Display the original image
subplot(3, 3, 1);
imshow(originalImage);
title('Original Image');

% Convert the image to grayscale (if it's not already)
grayImage = rgb2gray(originalImage);

% Take the Fourier transform of the image
fftImage = fft2(double(grayImage));
% Compute the histogram of pixel values
histValues = hist(double(grayImage(:)), 0:255);
%% 
%plotting RGB Spectrum
doubleImage = double(originalImage) / 255;
% Flatten each color channel
redChannel = reshape(doubleImage(:,:,1), [], 1);
greenChannel = reshape(doubleImage(:,:,2), [], 1);
blueChannel = reshape(doubleImage(:,:,3), [], 1);

% Create histograms for each color channel
redHist = histcounts(redChannel, 0:1/256:1);
greenHist = histcounts(greenChannel, 0:1/256:1);
blueHist = histcounts(blueChannel, 0:1/256:1);
subplot(3,3,2)
plot(0:1/256:1-1/256, redHist, 'r');
title('Red Channel Histogram');
xlabel('Pixel Value (0-255)');
ylabel('Frequency');
hold('on');
plot(0:1/256:1-1/256, greenHist, 'g');
plot(0:1/256:1-1/256, blueHist, 'b');
hold('off');
%% 
% Get the corresponding pixel values
pixelValues = 0:255; % Assuming 8-bit grayscale image
subplot(3,3,5);
imshow(grayImage);
title('Grayscale Image');
% Plot the histogram
subplot(3,3,4)
bar(pixelValues, histValues);
title('Pixel Value Frequency');
xlabel('Pixel Value');
ylabel('Frequency');

% Display the magnitude spectrum of the original image
subplot(3, 3, 6);
imagesc(log(1 + abs(fftshift(fftImage))));
colormap('gray');
title('Magnitude Spectrum');

% Define a filter (you can adjust the filter based on your needs)
kernelSize = 3;
%kernel = [0 0 0; 0 1.5 0;0 0 0]; % 3x3 brightness filter
kernel = 1/9 * ones(3, 3);
% Take the Fourier transform of the filter
fftFilter = fft2(kernel, size(grayImage, 1), size(grayImage, 2));

% Apply the filter in the frequency domain
filteredFFT = fftImage .* fftFilter;

% Take the inverse Fourier transform to obtain the filtered image
filteredImage = ifft2(filteredFFT);

% Display the filtered image
subplot(3, 3, 8);
imshow(uint8(filteredImage));
title('Filtered Image');


% Compute the histogram of pixel values for the enhanced
histValues2 = hist(double(filteredImage(:)), 0:255);
% Plot the histogram
subplot(3, 3, 7);
bar(pixelValues, histValues2);
title('Pixel Value Frequency');
xlabel('Pixel Value');
ylabel('Frequency');
title('Filtered Image Spectrum');

% Display the magnitude spectrum of the filtered image
subplot(3, 3, 9);
imagesc(log(1 + abs(fftshift(filteredFFT))));
colormap('gray');
title('Magnitude Spectrum');


