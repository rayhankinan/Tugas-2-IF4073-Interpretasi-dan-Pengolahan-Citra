classdef (Abstract) BaseImageWrapper
    properties
        ImageData uint8 {mustBeNumeric}
        Type string {mustBeMember(Type, {'grayscale', 'color'})}
    end
    
    methods
        % Check if Image is empty
        IsEmpty(obj)
        
        % Get Image Data
        GetImageData(obj)
        
        % Get Image Type
        GetType(obj)
        
        % Brighten Image
        Brighten(obj, value)
    end
end