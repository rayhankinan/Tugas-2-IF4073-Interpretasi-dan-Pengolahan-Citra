classdef SpatialFilter
    methods (Static)
        function matrix = GenerateMeanFilter(size)
            arguments
                size(1, 1) uint8 {mustBePositive, mustBeOdd}
            end
            
            matrix = fspecial('average', size);
        end
        
        function matrix = GenerateGaussianFilter(size, sigma)
            arguments
                size(1, 1) uint8 {mustBePositive, mustBeOdd}
                sigma(1, 1) double {mustBePositive}
            end
            
            matrix = fspecial('gaussian', size, sigma);
        end
    end % methods
end