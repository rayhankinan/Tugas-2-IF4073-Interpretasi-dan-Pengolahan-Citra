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
        
        function matrix = GenerateIdealHighPassFilter(width, height, cutOffFrequency)
            arguments
                width(1,1) double
                height(1,1) double
                cutOffFrequency(1,1) double
            end % arguments
            
            % Generate the filter
            matrix = 1 - utils.FrequencyFilter.GenerateIdealLowPassFilter(width, height, cutOffFrequency);
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
        
        function matrix = GenerateGaussianHighPassFilter(width, height, cutOffFrequency)
            arguments
                width(1,1) double
                height(1,1) double
                cutOffFrequency(1,1) double
            end % arguments
            
            % Generate the filter
            matrix = 1 - utils.FrequencyFilter.GenerateGaussianLowPassFilter(width, height, cutOffFrequency);
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
        
        function matrix = GenerateButterworthHighPassFilter(width, height, cutOffFrequency, order)
            arguments
                width(1,1) double
                height(1,1) double
                cutOffFrequency(1,1) double
                order(1,1) double
            end % arguments
            
            % Generate the filter
            matrix = 1 - utils.FrequencyFilter.GenerateButterworthLowPassFilter(width, height, cutOffFrequency, order);
        end
        
        function matrix = GenerateIdealBandrejectFilter(width, height, cutOffFrequency, bandwidth)
            arguments
                width(1,1) double
                height(1,1) double
                cutOffFrequency(1,1) double
                bandwidth(1,1) double
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
            matrix = double(D >= cutOffFrequency - bandwidth/2 & D <= cutOffFrequency + bandwidth/2);
        end
        
        function matrix = GenerateIdealBandpassFilter(width, height, cutOffFrequency, bandwidth)
            arguments
                width(1,1) double
                height(1,1) double
                cutOffFrequency(1,1) double
                bandwidth(1,1) double
            end % arguments
            
            % Generate the filter
            matrix = 1 - utils.FrequencyFilter.GenerateIdealBandrejectFilter(width, height, cutOffFrequency, bandwidth);
        end
        
        function matrix = GenerateButterworthBandrejectFilter(width, height, cutOffFrequency, bandwidth, order)
            arguments
                width(1,1) double
                height(1,1) double
                cutOffFrequency(1,1) double
                bandwidth(1,1) double
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
            
            % Generate the butterworth bandreject filter
            matrix = 1 ./ (1 + ((D .* bandwidth) ./ (D .^ 2 - cutOffFrequency ^ 2)) .^ (2 * order));
        end
        
        function matrix = GenerateButterworthBandpassFilter(width, height, cutOffFrequency, bandwidth, order)
            arguments
                width(1,1) double
                height(1,1) double
                cutOffFrequency(1,1) double
                bandwidth(1,1) double
                order(1,1) double
            end % arguments
            
            % Generate the filter
            matrix = 1 - utils.FrequencyFilter.GenerateButterworthBandrejectFilter(width, height, cutOffFrequency, bandwidth, order);
        end
        
        function matrix = GenerateGaussianBandrejectFilter(width, height, cutOffFrequency, bandwidth)
            arguments
                width(1,1) double
                height(1,1) double
                cutOffFrequency(1,1) double
                bandwidth(1,1) double
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
            
            % Generate the gaussian bandreject filter
            matrix = 1 - exp(-1/2 * ((D.^2 - cutOffFrequency^2) / (cutOffFrequency * bandwidth)).^2);
        end
        
        function matrix = GenerateGaussianBandpassFilter(width, height, cutOffFrequency, bandwidth)
            arguments
                width(1,1) double
                height(1,1) double
                cutOffFrequency(1,1) double
                bandwidth(1,1) double
            end % arguments
            
            % Generate the filter
            matrix = 1 - utils.FrequencyFilter.GenerateGaussianBandrejectFilter(width, height, cutOffFrequency, bandwidth);
        end
        
        function matrix = GenerateWienerFilter(width, height, psf, k)
            arguments
                width(1,1) double
                height(1,1) double
                psf double
                k(1,1) double
            end % arguments
            
            % Change to frequency domain
            psfFreq = fft2(psf, height, width);
            
            matrix = conj(psfFreq) ./ (abs(psfFreq) .^ 2 + k);
        end
    end
end