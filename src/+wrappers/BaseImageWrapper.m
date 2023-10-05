classdef (Abstract) BaseImageWrapper
    properties
        ImageData uint8 {mustBeNumeric}
        Type string {mustBeMember(Type, {'grayscale', 'color'})}
    end
    
    methods
        % Get Image Size
        GetSize(obj)
        
        % Get Image Data
        GetImageData(obj)
        
        % Get Image Type
        GetType(obj)
        
        % Get Matrix Convolution
        GetMatrixConvolution(obj, matrix)
        
        % Get Function Convolution
        GetFunctionConvolution(obj, lambda, regionSize)
        
        % Get Frequency Convolution
        GetFrequencyConvolution(obj, matrix)
        
        % Get Image Brightening
        GetBrightening(obj, highpass, alpha)
    end
end