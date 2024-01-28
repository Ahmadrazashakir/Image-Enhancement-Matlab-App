    % Read the image
    imagePath = "C:\Users\ahmad\OneDrive\Pictures\11223520916_496e78752f_b.jpg";% Replace with the actual path to your image
    originalImage = imread(imagePath);
    
    % Display the original image
    subplot(2, 2, 1);
    imshow(originalImage);
    title('Original Image');
    
    % Plot the RGB histogram of the original image
    subplot(2, 2, 2);
    plotRGBHistogram(originalImage, 'Original Image Histogram');
    
    % Perform histogram equalization
    equalizedImage = histeq(originalImage);
    
    % Display the equalized image
    subplot(2, 2, 3);
    imshow(equalizedImage);
    title('Equalized Image');
    
    % Plot the RGB histogram of the equalized image
    subplot(2, 2, 4);
    plotRGBHistogram(equalizedImage, 'Equalized Image Histogram');

function plotRGBHistogram(image, titleText)
    % Flatten each color channel
    redChannel = image(:, :, 1);
    greenChannel = image(:, :, 2);
    blueChannel = image(:, :, 3);

    % Create histograms for each color channel
    redHist = hist(double(redChannel),0:255);
    greenHist = hist(double(greenChannel),0:255);
    blueHist = hist(double(blueChannel),0:255);

    % Plot the histograms
    plot(0:255, redHist, 'r', 'DisplayName', 'Red Channel');
    hold on;
    plot(0:255, greenHist, 'g', 'DisplayName', 'Green Channel');
    plot(0:255, blueHist, 'b', 'DisplayName', 'Blue Channel');
    hold off;

    title(titleText);
    xlabel('Pixel Value (0-255)');
    ylabel('Frequency');
    legend('Location', 'NorthEast');
end
