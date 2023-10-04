classdef Brighten
    methods (Static)
        function resultData = GetHighBoost(imageData, highpass, alpha)
            arguments
                imageData uint8
                highpass double
                alpha(1, 1) double
            end
            
            % Get double of image data
            doubleImageData = im2double(imageData);
            
            % Calculate the high boost
            doubleImageDataProcessed = (alpha - 1) * doubleImageData + highpass;
            
            % Convert back to uint8
            resultData = im2uint8(doubleImageDataProcessed);
        end
    end
end