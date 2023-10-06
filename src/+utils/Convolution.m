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
            
            % Get the padding size
            paddingSize = floor(kernelHeight / 2);
            
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
                            currI = i + m - paddingSize - 1;
                            currJ = j + n - paddingSize - 1;
                            
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
                lambda(1, 1) function_handle
                regionSize(1, 1) double
            end % arguments
            
            % Convert to double
            doubleImageData = im2double(imageData);
            
            % Get the data dimension
            [imageHeight, imageWidth] = size(doubleImageData);
            
            % Get the padding size
            lowPaddingSize = floor(regionSize / 2);
            
            % Initialize the processed image data
            doubleImageDataProcessed = zeros(imageHeight, imageWidth);
            
            for i = 1:imageHeight
                for j = 1:imageWidth
                    % Get the dimension of the region
                    rowStart = max(1, i - lowPaddingSize);
                    rowEnd = min(imageHeight, i + lowPaddingSize);
                    colStart = max(1, j - lowPaddingSize);
                    colEnd = min(imageWidth, j + lowPaddingSize);
                    
                    % Get the region
                    regionMatrix = doubleImageData(rowStart:rowEnd, colStart:colEnd);
                    
                    % Set the processed image data
                    doubleImageDataProcessed(i, j) = lambda(regionMatrix);
                end % for j
            end % for i
            
            % Convert to uint8
            resultData = im2uint8(doubleImageDataProcessed);
        end
        
        function resultData = DoFrequencyConvolution(imageData, matrix)
            arguments
                imageData uint8
                matrix double
            end % arguments
            
            % Convert to double
            doubleImageData = im2double(imageData);
            
            % Convert to frequency domain
            freqImageData = fft2(doubleImageData);
            
            % Apply the matrix
            processedImageData = freqImageData .* matrix;
            
            % Convert to spatial domain
            processedDoubleData = ifft2(processedImageData);
            
            % Convert to uint8
            resultData = im2uint8(real(processedDoubleData));
        end
    end
end