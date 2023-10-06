classdef SpatialFilter
    methods (Static)
        function matrix = GenerateMeanFilter(size)
            arguments
                size(1, 1) double {mustBePositive}
            end
            
            matrix = fspecial('average', size);
        end
        
        function matrix = GenerateGaussianFilter(size, sigma)
            arguments
                size(1, 1) double {mustBePositive}
                sigma(1, 1) double {mustBePositive}
            end
            
            matrix = fspecial('gaussian', size, sigma);
        end
        
        function result = HarmonicMean(matrix)
            arguments
                matrix double
            end
            
            % Cari size matrix
            [row, col] = size(matrix);
            
            % Cari nilai mean harmonic
            result = (row * col) / sum(1 ./ matrix, 'all');
        end
        
        function lambda = GenerateMidpoint()
            lambda = @(x) utils.SpatialFilter.Midpoint(x);
        end
        
        function result = ContraharmonicMean(matrix)
            arguments
                matrix double
            end
            
            % Cari nilai mean harmonic
            result = sum(matrix .^ 2, 'all') / sum(matrix, 'all');
        end
        
        function lambda = GenerateContraharmonicMean()
            lambda = @(x) utils.SpatialFilter.ContraharmonicMean(x);
        end
        
        function result = Midpoint(matrix)
            arguments
                matrix double
            end
            
            result = (max(matrix, [], 'all') + min(matrix, [], 'all')) / 2;
        end
        
        function lambda = GenerateHarmonicMean()
            lambda = @(x) utils.SpatialFilter.HarmonicMean(x);
        end
        
        function result = AlphaTrimmedMean(matrix)
            % Sort matrix
            vectorized = reshape(matrix,1,[]);
            d = 4;
            sorted = sort(vectorized);
            b = d/2;
            c = b+1;
            d = numel(sorted) - b;
            trimmed = sorted(c:d);
            
            result = mean(trimmed);
            
        end
        
        function lambda = GenerateAlphaTrimmedMean()
            lambda = @(x) utils.SpatialFilter.AlphaTrimmedMean(x);
        end
        
        function lambda = GenerateMin()
            lambda = @(x) min(min(x));
        end
        
        function lambda = GenerateMax()
            lambda = @(x) max(max(x));
        end
        
        function lambda = GenerateMedian()
            lambda = @(x) median(median(x));
        end
        
        function lambda = GenerateGeometricMean()
            lambda = @(x) exp(mean(log(x), 'all'));
        end
    end % methods
end