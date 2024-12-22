function DoG_image = DoG(image)
    % Apply Difference of Gaussian to an image with two different sigmas.
    %
    % Parameters:
    %   image - Input grayscale image.
    %   sigma1 - Standard deviation for the first Gaussian kernel.
    %   sigma2 - Standard deviation for the second Gaussian kernel.
    %
    % Returns:
    %   DoG_image - Resulting Difference of Gaussian image.

    % Ensure sigma1 is less than sigma2 for proper DoG operation
    % if sigma1 > sigma2
    %     warning('Sigma1 should be smaller than sigma2 for a proper DoG effect.');
    %     [sigma1, sigma2] = deal(sigma2, sigma1);
    % end

    % Convert image to double precision for processing
    img_double = im2double(image);
    Ycbcr = rgb2ycbcr(img_double);
    img_Y= Ycbcr(:,:,1);

    % Create Gaussian filters with specified sigmas
    h1 = fspecial('gaussian', [9 9], 0.1);
    h2 = fspecial('gaussian', [9 9], 0.8);

    % Apply Gaussian filters to the image
    blurred_img1 = imfilter(img_Y, h1, 'replicate');
    blurred_img2 = imfilter(img_Y, h2, 'replicate');

    % Compute the Difference of Gaussians
    DoG_image = blurred_img1 - blurred_img2;

    % Optional: Normalize the DoG image to [0, 1] range for visualization
    % DoG_image = mat2gray(DoG_image);
end