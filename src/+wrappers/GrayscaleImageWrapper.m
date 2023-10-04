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
                obj wrappers.GrayscaleImageWrapper
                matrix double;
            end % arguments
            
            imageData = utils.Convolution.DoMatrixConvolution(obj.ImageData, matrix);
        end
        
        % Get Function Convolution
        function imageData = GetFunctionConvolution(obj, lambda, regionSize)
            arguments
                obj wrappers.GrayscaleImageWrapper
                lambda function_handle
                regionSize uint8
            end % arguments
            
            imageData = utils.Convolution.DoFunctionConvolution(obj.ImageData, lambda, regionSize);
        end
    end
end