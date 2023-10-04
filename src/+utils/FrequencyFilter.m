classdef FrequencyFilter
    methods (Static)
        function matrix = GenerateIdealLowPassFilter(width, height, cutOffFrequency)
            arguments
                width(1,1) double
                height(1,1) double
                cutOffFrequency(1,1) double
            end % arguments
            
            % Set up range of frequencies
            u = 0:height-1;
            v = 0:width-1;
            
            % Compute the indices for use in meshgrid
            idx = find(u > height/2);
            u(idx) = u(idx) - height;
            idy = find(v > width/2);
            v(idy) = v(idy) - width;
            
            % Compute the meshgrid arrays
            [V, U] = meshgrid(v, u);
            D = sqrt(U.^2 + V.^2);
            
            % Generate the filter
            matrix = double(D <= cutOffFrequency);
        end
        
        function matrix = GenerateGaussianLowPassFilter(width, height, cutOffFrequency)
            arguments
                width(1,1) double
                height(1,1) double
                cutOffFrequency(1,1) double
            end % arguments
            
            % Set up range of frequencies
            u = 0:height-1;
            v = 0:width-1;
            
            % Compute the indices for use in meshgrid
            idx = find(u > height/2);
            u(idx) = u(idx) - height;
            idy = find(v > width/2);
            v(idy) = v(idy) - width;
            
            % Compute the meshgrid arrays
            [V, U] = meshgrid(v, u);
            D = sqrt(U.^2 + V.^2);
            
            % Generate the filter
            matrix = exp(-(D .^ 2) ./ (2 * cutOffFrequency ^ 2));
        end
        
        function matrix = GenerateButterworthLowPassFilter(width, height, cutOffFrequency, order)
            arguments
                width(1,1) double
                height(1,1) double
                cutOffFrequency(1,1) double
                order(1,1) double
            end % arguments
            
            % Set up range of frequencies
            u = 0:height-1;
            v = 0:width-1;
            
            % Compute the indices for use in meshgrid
            idx = find(u > height/2);
            u(idx) = u(idx) - height;
            idy = find(v > width/2);
            v(idy) = v(idy) - width;
            
            % Compute the meshgrid arrays
            [V, U] = meshgrid(v, u);
            D = sqrt(U.^2 + V.^2);
            
            % Generate the filter
            matrix = 1 ./ (1 + (D ./ cutOffFrequency) .^ (2 * order));
        end
    end
end