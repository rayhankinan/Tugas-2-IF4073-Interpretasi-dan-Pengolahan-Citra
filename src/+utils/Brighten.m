classdef Brighten
    methods (Static)
        function resultData = GetHighBoost(imageData, highpass, alpha)
            arguments
                imageData uint8
                highpass uint8
                alpha(1, 1) double
            end
            
            % Get double of image data
            doubleImageData = im2double(imageData);
            doubleHighpass = im2double(highpass);
            
            % Calculate the high boost
            doubleImageDataProcessed = (alpha - 1) * doubleImageData + doubleHighpass;
            
            % Convert back to uint8
            resultData = im2uint8(doubleImageDataProcessed);
        end
    end
end