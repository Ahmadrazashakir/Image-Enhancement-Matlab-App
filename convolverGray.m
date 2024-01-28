function [resultImage] = convolverGray(Image,kernel)
[imageHeight, imageWidth] = size(Image);
resultImage = zeros(imageHeight,imageWidth);
for x = 2:imageHeight-1;
   for y = 2:imageWidth-1;
      map = double(Image(x-1:x+1, y-1:y+1));
      resultImage(x,y) =  sum(sum(map.*kernel));
   end
end