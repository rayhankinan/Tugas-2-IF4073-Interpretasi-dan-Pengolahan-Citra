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
            
            redChan = utils.Convolution(obj.ImageData(:,:,1), matrix);
            greenChan = utils.Convolution(obj.ImageData(:,:,2), matrix);
            blueChan = utils.Convolution(obj.ImageData(:,:,3), matrix);
            
            imageData = cat(3, redChan, greenChan, blueChan);
        end
        
        % Get Brightened Image
        function imageData = GetBrightened(obj, value)
            arguments
                obj wrappers.ColoredImageWrapper
                value double;
            end % arguments
            
            % TODO: Do something with the obj.ImageData
        end
    end
end