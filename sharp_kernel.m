imagePath = "C:\Users\ahmad\OneDrive\Pictures\11223520916_496e78752f_b.jpg";
originalImage = imread(imagePath);
grayImage = rgb2gray(originalImage);
subplot(1,2,1);
imshow(originalImage)
kernel = [-1 0 0;0 3 0;0 0 -1];
subplot(1,2,2);
imshow(uint8(convolverRGB(originalImage,kernel)));