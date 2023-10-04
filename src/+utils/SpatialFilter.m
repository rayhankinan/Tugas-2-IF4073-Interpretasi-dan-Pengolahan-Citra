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
                matrix(:, :) double
            end
            
            %cari size matrix
            [row, col] = size(matrix);

            %cari nilai mean harmonic
            result = (row * col) / sum(1 ./ matrix, 'all');
        end

        function result = ContraharmonicMean(matrix)
            arguments
                matrix(:, :) double
            end

            %cari nilai mean harmonic
            result = sum(matrix .^ 2, 'all') / sum(matrix, 'all');
        end
        
        function result = Midpoint(matrix)
            arguments
                matrix(:, :) double
            end
            
            result = (max(matrix, [], 'all') + min(matrix, [], 'all')) / 2;
        end

        function result = AlphaTrimmedMean(matrix, d)
            arguments
                matrix(:, :) double
                d(1, 1) double {mustBePositive}
            end

            %sort matrix
            matrix = sort(matrix, 'all');

            %hilangkan d/2 nilai terkecil dan d/2 nilai terbesar
            trimmedMatrix = matrix((d/2)+1:end-(d/2));
            
            %cari nilai mean
            result = mean(trimmedMatrix, 'all');
        end
        
        function f = GenerateAlphaTrimmedLambda(d)
            f = @(x) AlphaTrimmedMean(x, d);
        end
    end % methods
end