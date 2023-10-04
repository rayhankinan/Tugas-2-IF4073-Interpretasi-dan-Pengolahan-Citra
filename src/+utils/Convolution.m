classdef Convolution
    methods (Static)
        % Note: Use zero padding on the image
        function resultData = DoMatrixConvolution(imageData, kernel)
            arguments
                imageData uint8
                kernel double
            end % arguments
            
            % Convert to double
            doubleImageData = im2double(imageData);
            
            % Get the data dimension
            [imageHeight, imageWidth] = size(doubleImageData);
            [kernelHeight, kernelWidth] = size(kernel);
            
            % Initialize the processed image data
            doubleImageDataProcessed = zeros(imageHeight, imageWidth);
            
            for i = 1:imageHeight
                for j = 1:imageWidth
                    % Initialize the sum
                    sumElement = 0;
                    
                    % Apply the kernel
                    for m = 1:kernelHeight
                        for n = 1:kernelWidth
                            % Initialize current index
                            currI = i + m - 1;
                            currJ = j + n - 1;
                            
                            % Check if the element is in the image
                            if currI > 0 && currI <= imageHeight && currJ > 0 && currJ <= imageWidth
                                % Add the element to the sum
                                sumElement = sumElement + doubleImageData(currI, currJ) * kernel(m, n);
                            end % if
                        end % for n
                    end % for m
                    
                    % Set the processed image data
                    doubleImageDataProcessed(i, j) = sumElement;
                end % for j
            end % for i
            
            % Convert to uint8
            resultData = im2uint8(doubleImageDataProcessed);
        end
        
        % Note: No padding on the image
        function resultData = DoFunctionConvolution(imageData, lambda, regionSize)
            arguments
                imageData uint8
                lambda function_handle
                regionSize uint8
            end % arguments
            
            % Convert to double
            doubleImageData = im2double(imageData);
            
            % Get the data dimension
            [imageHeight, imageWidth] = size(doubleImageData);
            
            % Initialize the processed image data
            doubleImageDataProcessed = zeros(imageHeight, imageWidth);
            
            for i = 1:imageHeight
                for j = 1:imageWidth
                    % Get the dimension of the region
                    rowStart = max(1, i - floor(regionSize / 2));
                    rowEnd = min(imageHeight, i + floor(regionSize / 2));
                    colStart = max(1, j - floor(regionSize / 2));
                    colEnd = min(imageWidth, j + floor(regionSize / 2));
                    
                    % Get the region
                    regionMatrix = doubleImageData(rowStart:rowEnd, colStart:colEnd);
                    
                    % Set the processed image data
                    doubleImageDataProcessed(i, j) = lambda(regionMatrix);
                end % for j
            end % for i
            
            % Convert to uint8
            resultData = im2uint8(doubleImageDataProcessed);
        end
    end
end