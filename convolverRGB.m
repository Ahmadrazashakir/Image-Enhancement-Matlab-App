    function [resultImage] = convolverRGB(Image,kernel)
[imageHeight, imageWidth,~] = size(Image);
resultImage = zeros(imageHeight,imageWidth,3);
for channel=1:3;
    for x = 2:imageHeight-1;
        for y = 2:imageWidth-1;
            map = double(Image(x-1:x+1, y-1:y+1,channel));
            resultImage(x,y,channel) =  sum(sum(map.*kernel));
        end
    end
end
