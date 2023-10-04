classdef GrayscaleImageWrapper < wrappers.BaseImageWrapper
    methods
        % Constructor
        function obj = GrayscaleImageWrapper(imageData)
            arguments
                imageData uint8
            end
            
            obj.ImageData = imageData;
            obj.Type = 'grayscale';
        end
        
        % Check if Image is empty
        function isEmpty = IsEmpty(obj)
            arguments
                obj wrappers.GrayscaleImageWrapper
            end
            
            isEmpty = isempty(obj.ImageData);
        end
        
        % Get Image Data
        function data = GetImageData(obj)
            arguments
                obj wrappers.GrayscaleImageWrapper
            end
            
            data = obj.ImageData;
        end
        
        % Get Type
        function type = GetType(obj)
            arguments
                obj wrappers.GrayscaleImageWrapper
            end
            
            type = obj.Type;
        end
        
        % Get Matrix Convolution
        function imageData = GetMatrixConvolution(obj, matrix)
            arguments
                obj wrappers.ColoredImageWrapper
                matrix double;
            end % arguments
            
            imageData = utils.Convolution(obj.ImageData, matrix);
        end
        
        % Get Brightened Image
        function imageData = GetBrightened(obj, value)
            arguments
                obj wrappers.GrayscaleImageWrapper
                value double;
            end
            
            % TODO: Do something with the obj.ImageData
        end
    end
end