% Load an example image (replace 'example_image.jpg' with the path to your image)
originalImage = imread('C:\Users\ahmad\OneDrive\Pictures\11223520916_496e78752f_b.jpg');

% Convert the image to double for processing
doubleImage = double(originalImage) / 255;

% Get the size of the image
[M, N, ~] = size(originalImage);

% Compute the Fourier transform for each color channel
fftRed = fftshift(fft2(doubleImage(:,:,1)));
fftGreen = fftshift(fft2(doubleImage(:,:,2)));
fftBlue = fftshift(fft2(doubleImage(:,:,3)));

% Frequency axis
frequenciesX = linspace(-0.5, 0.5, N);
frequenciesY = linspace(-0.5, 0.5, M);

% Create a meshgrid for frequency values
[frequenciesX, frequenciesY] = meshgrid(frequenciesX, frequenciesY);

% Plot the magnitude spectrum for each color channel
figure;

subplot(3, 1, 1);
surf(frequenciesX, frequenciesY, log(1 + abs(fftRed)), 'EdgeColor', 'none');
title('Red Channel Spectrum');
xlabel('Frequency X');
ylabel('Frequency Y');
zlabel('Magnitude');

subplot(3, 1, 2);
surf(frequenciesX, frequenciesY, log(1 + abs(fftGreen)), 'EdgeColor', 'none');
title('Green Channel Spectrum');
xlabel('Frequency X');
ylabel('Frequency Y');
zlabel('Magnitude');

subplot(3, 1, 3);
surf(frequenciesX, frequenciesY, log(1 + abs(fftBlue)), 'EdgeColor', 'none');
title('Blue Channel Spectrum');
xlabel('Frequency X');
ylabel('Frequency Y');
zlabel('Magnitude');
