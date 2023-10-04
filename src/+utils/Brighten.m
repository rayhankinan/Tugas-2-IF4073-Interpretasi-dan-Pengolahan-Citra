classdef Brighten
    methods (Static)
        function resultData = GetHighBoost(imageData, highpass, alpha)
            arguments
                imageData uint8
                highpass double
                alpha(1, 1) double
            end
            
            resultData = (alpha - 1) * imageData + highpass;
        end
    end
end