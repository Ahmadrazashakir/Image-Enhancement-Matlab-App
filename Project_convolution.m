imagePath = "C:\Users\ahmad\OneDrive\Pictures\11223520916_496e78752f_b.jpg";
originalImage = imread(imagePath);
grayImage = rgb2gray(originalImage);

% Compute the histogram of pixel values
histValues = hist(double(grayImage(:)), 0:255);

% Get the corresponding pixel values
pixelValues = 0:255; % Assuming 8-bit grayscale image
subplot(3,2,1);
imshow(originalImage)
% Plot the histogram
subplot(3,2,2);
bar(pixelValues, histValues);
title('Pixel Value Frequency');
xlabel('Pixel Value');
ylabel('Frequency');
b = 1.3;
brightkernel = [0 0 0;0 1.4 0;0 0 0];
sketchKernel = [-1 -1 -1; -1 10 -1; -1 -1 -1];
blurKernel = [0.1625 0.025 0.1625;0.025 .15 0.125;0.1625 0.025 0.1625];
[imageHeight, imageWidth] = size(grayImage);
resultImage = convolverRGB(originalImage,brightkernel);
resultImage2 = convolverGray(grayImage,sketchKernel);
img = convolverRGB(originalImage,blurKernel);
%for x=1:5
 %   resultImage3 = convolverRGB(img,blurKernel);
 %   img =resultImage3;
%end
subplot(3,2,3);
imshow(uint8(resultImage));
subplot(3,2,4);
imshow(uint8(resultImage2));
subplot(3,2,5);
imshow(uint8(img));