classdef ColoredImageWrapper < wrappers.BaseImageWrapper
    methods
        % Constructor
        function obj = ColoredImageWrapper(imageData)
            arguments
                imageData uint8;
            end
            
            obj.ImageData = imageData;
            obj.Type = 'color';
        end
        
        % Check if Image is empty
        function isEmpty = IsEmpty(obj)
            arguments
                obj wrappers.ColoredImageWrapper
            end
            
            isEmpty = isempty(obj.ImageData);
        end
        
        % Get Image Data
        function data = GetImageData(obj)
            arguments
                obj wrappers.ColoredImageWrapper
            end
            
            data = obj.ImageData;
        end
        
        % Get Type
        function type = GetType(obj)
            arguments
                obj wrappers.ColoredImageWrapper
            end
            
            type = obj.Type;
        end
        
        % Get Matrix Convolution
        function imageData = GetMatrixConvolution(obj, matrix)
            arguments
                obj wrappers.ColoredImageWrapper
                matrix double;
            end % arguments
            
            redChan = utils.Convolution.DoMatrixConvolution(obj.ImageData(:,:,1), matrix);
            greenChan = utils.Convolution.DoMatrixConvolution(obj.ImageData(:,:,2), matrix);
            blueChan = utils.Convolution.DoMatrixConvolution(obj.ImageData(:,:,3), matrix);
            
            imageData = cat(3, redChan, greenChan, blueChan);
        end
        
        % Get Function Convolution
        function imageData = GetFunctionConvolution(obj, lambda, regionSize)
            arguments
                obj wrappers.ColoredImageWrapper
                lambda function_handle
                regionSize uint8
            end % arguments
            
            redChan = utils.Convolution.DoFunctionConvolution(obj.ImageData(:,:,1), lambda, regionSize);
            greenChan = utils.Convolution.DoFunctionConvolution(obj.ImageData(:,:,2), lambda, regionSize);
            blueChan = utils.Convolution.DoFunctionConvolution(obj.ImageData(:,:,3), lambda, regionSize);
            
            imageData = cat(3, redChan, greenChan, blueChan);
        end
    end
end