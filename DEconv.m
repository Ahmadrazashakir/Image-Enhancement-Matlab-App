imagePath = "C:\Users\ahmad\OneDrive\Pictures\11223520916_496e78752f_b.jpg";
originalImage = imread(imagePath);
[M,N,~]=size(originalImage);
grayImage = rgb2gray(originalImage);
fftImage = fft2(double(grayImage));
kernel = [0 0 0;0 1.4 0;0 0 0];
fftFilter = fft2(kernel,M,N);
filteredFFT = fftImage .* fftFilter;
brightImage = ifft2(filteredFFT);
recoveredFFT = filteredFFT./fftFilter;
recoveredImage = ifft2(fftshift(recoveredFFT));




subplot(2,2,1);
imshow(grayImage);
title('Original');
subplot(2, 2, 2);
imshow(uint8(brightImage));
title('Filtered Image');
subplot(2,2,3);
imshow(uint8(recoveredImage));
title('Recovered')