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
            lambda = @(x) Midpoint(x);
        end
        
        function result = ContraharmonicMean(matrix)
            arguments
                matrix double
            end
            
            % Cari nilai mean harmonic
            result = sum(matrix .^ 2, 'all') / sum(matrix, 'all');
        end
        
        function lambda = GenerateContraharmonicMean()
            lambda = @(x) ContraharmonicMean(x);
        end
        
        function result = Midpoint(matrix)
            arguments
                matrix double
            end
            
            result = (max(matrix, [], 'all') + min(matrix, [], 'all')) / 2;
        end
        
        function lambda = GenerateHarmonicMean()
            lambda = @(x) HarmonicMean(x);
        end
        
        function result = AlphaTrimmedMean(matrix, d)
            arguments
                matrix double
                d(1, 1) double {mustBePositive}
            end
            
            % Sort matrix
            matrix = sort(matrix, 'all');
            
            % Hilangkan d/2 nilai terkecil dan d/2 nilai terbesar
            trimmedMatrix = matrix((d/2)+1:end-(d/2));
            
            % Cari nilai mean
            result = mean(trimmedMatrix, 'all');
        end
        
        function lambda = GenerateAlphaTrimmedMean(d)
            arguments
                d(1, 1) double {mustBePositive}
            end
            
            lambda = @(x) AlphaTrimmedMean(x, d);
        end
    end % methods
end