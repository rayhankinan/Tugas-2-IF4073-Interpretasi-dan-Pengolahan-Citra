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
                lambda(1, 1) function_handle
                regionSize(1, 1) uint8
            end % arguments
            
            redChan = utils.Convolution.DoFunctionConvolution(obj.ImageData(:,:,1), lambda, regionSize);
            greenChan = utils.Convolution.DoFunctionConvolution(obj.ImageData(:,:,2), lambda, regionSize);
            blueChan = utils.Convolution.DoFunctionConvolution(obj.ImageData(:,:,3), lambda, regionSize);
            
            imageData = cat(3, redChan, greenChan, blueChan);
        end
        
        % Get Frequency Convolution
        function imageData = GetFrequencyConvolution(obj, matrix)
            arguments
                obj wrappers.ColoredImageWrapper
                matrix double;
            end % arguments
            
            redChan = utils.Convolution.DoFrequencyConvolution(obj.ImageData(:,:,1), matrix);
            greenChan = utils.Convolution.DoFrequencyConvolution(obj.ImageData(:,:,2), matrix);
            blueChan = utils.Convolution.DoFrequencyConvolution(obj.ImageData(:,:,3), matrix);
            
            imageData = cat(3, redChan, greenChan, blueChan);
        end
        
        % Get Image Brightening
        function imageData = GetBrightening(obj, highpass, alpha)
            arguments
                obj wrappers.ColoredImageWrapper
                highpass uint8
                alpha(1, 1) double
            end % arguments
            
            redChan = utils.Brighten.GetHighBoost(obj.ImageData(:,:,1), highpass(:,:,1), alpha);
            greenChan = utils.Brighten.GetHighBoost(obj.ImageData(:,:,2), highpass(:,:,2), alpha);
            blueChan = utils.Brighten.GetHighBoost(obj.ImageData(:,:,3), highpass(:,:,3), alpha);
            
            imageData = cat(3, redChan, greenChan, blueChan);
        end
    end
end