classdef app < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        ConvolutionTab                  matlab.ui.container.Tab
        ImageConvolutionMatrixSizeSpinner  matlab.ui.control.Spinner
        MatrixSizeSpinnerLabel          matlab.ui.control.Label
        ImageConvolutionUITable         matlab.ui.control.Table
        ImageConvolutionGoButton        matlab.ui.control.Button
        ImageConvolutionUploadImageButton  matlab.ui.control.Button
        ImageConvolutionOutputLabel     matlab.ui.control.Label
        ImageConvolutionInputLabel      matlab.ui.control.Label
        ImageConvolutionOutput          matlab.ui.control.UIAxes
        ImageConvolutionInput           matlab.ui.control.UIAxes
        ImageSmoothingTab               matlab.ui.container.Tab
        ImageSmoothingConvolutionSizeEditField  matlab.ui.control.NumericEditField
        ConvolutionSizeEditFieldLabel   matlab.ui.control.Label
        ImageSmoothingSigmaEditField    matlab.ui.control.NumericEditField
        SigmaLabel                      matlab.ui.control.Label
        ImageSmoothingFilterDropDown    matlab.ui.control.DropDown
        ChooseFilterLabel_3             matlab.ui.control.Label
        ImageSmoothingGoButton          matlab.ui.control.Button
        ImageSmoothingUploadImageButton  matlab.ui.control.Button
        ImageSmoothingOutputLabel       matlab.ui.control.Label
        ImageSmoothingInputLabel        matlab.ui.control.Label
        ImageSmoothingOutput            matlab.ui.control.UIAxes
        ImageSmoothingInput             matlab.ui.control.UIAxes
        FrequencyFilteringTab           matlab.ui.container.Tab
        ImageFrequencyOrderEditField    matlab.ui.control.NumericEditField
        OrderEditFieldLabel_2           matlab.ui.control.Label
        ImageFrequencyCutOffFrequencyEditField  matlab.ui.control.NumericEditField
        CutOffFrequencyEditFieldLabel_2  matlab.ui.control.Label
        ImageFrequencyFilterDropDown    matlab.ui.control.DropDown
        ChooseFilterLabel_2             matlab.ui.control.Label
        ImageFrequencyGoButton          matlab.ui.control.Button
        ImageFrequencyUploadImageButton  matlab.ui.control.Button
        ImageFrequencyOutputLabel       matlab.ui.control.Label
        ImageFrequencyInputLabel        matlab.ui.control.Label
        ImageFrequencyOutput            matlab.ui.control.UIAxes
        ImageFrequencyInput             matlab.ui.control.UIAxes
        ImageBrighteningTab             matlab.ui.container.Tab
        ImageBrighteningAlphaEditField  matlab.ui.control.NumericEditField
        AlphaEditFieldLabel             matlab.ui.control.Label
        ImageBrighteningOrderEditField  matlab.ui.control.NumericEditField
        OrderEditFieldLabel             matlab.ui.control.Label
        ImageBrighteningCutOffFrequencyEditField  matlab.ui.control.NumericEditField
        CutOffFrequencyEditFieldLabel   matlab.ui.control.Label
        ImageBrighteningFilterDropDown  matlab.ui.control.DropDown
        ChooseFilterLabel               matlab.ui.control.Label
        ImageBrighteningGoButton        matlab.ui.control.Button
        ImageBrighteningUploadImageButton  matlab.ui.control.Button
        ImageBrighteningOutputLabel     matlab.ui.control.Label
        ImageBrighteningInputLabel      matlab.ui.control.Label
        ImageBrighteningOutput          matlab.ui.control.UIAxes
        ImageBrighteningInput           matlab.ui.control.UIAxes
        SaltPepperRemovalTab            matlab.ui.container.Tab
        SaltPepperNoiseFieldEditField   matlab.ui.control.NumericEditField
        NoiseRateLabel                  matlab.ui.control.Label
        SaltPepperConvolutionSize       matlab.ui.control.NumericEditField
        ConvolutionSizeEditFieldLabel_2  matlab.ui.control.Label
        SaltPepperChooseFilterDropDown  matlab.ui.control.DropDown
        ChooseFilterDropDownLabel       matlab.ui.control.Label
        SaltPepperNoisedImageLabel      matlab.ui.control.Label
        SaltPepperOutputLabel           matlab.ui.control.Label
        SaltPepperInputLabel            matlab.ui.control.Label
        SaltPepperGoButton              matlab.ui.control.Button
        AddSaltPepperButton             matlab.ui.control.Button
        SaltPepperUploadImageButton     matlab.ui.control.Button
        ImageSaltPepperOutput           matlab.ui.control.UIAxes
        ImageSaltPepperNoised           matlab.ui.control.UIAxes
        ImageSaltPepperInput            matlab.ui.control.UIAxes
        PeriodicRemovalTab              matlab.ui.container.Tab
        PeriodicOrderField              matlab.ui.control.NumericEditField
        PeriodicOrderLabel              matlab.ui.control.Label
        PeriodicCOFField                matlab.ui.control.NumericEditField
        PeriodicCOFLabel                matlab.ui.control.Label
        PeriodicBandwithField           matlab.ui.control.NumericEditField
        PeriodicAlphaLabel              matlab.ui.control.Label
        PeriodicFilterDropdown          matlab.ui.control.DropDown
        PeriodicFilterLabel             matlab.ui.control.Label
        PeriodicGOButton                matlab.ui.control.Button
        PeriodicUploadImageButton       matlab.ui.control.Button
        PeriodicOutputLabel             matlab.ui.control.Label
        PeriodicInputLabel              matlab.ui.control.Label
        PeriodicImageOutput             matlab.ui.control.UIAxes
        PeriodicImageInput              matlab.ui.control.UIAxes
        WienerDeconvTab                 matlab.ui.container.Tab
        WienerThetaEditField            matlab.ui.control.NumericEditField
        ThetaEditFieldLabel             matlab.ui.control.Label
        WienerLengthEditField           matlab.ui.control.NumericEditField
        LengthEditFieldLabel            matlab.ui.control.Label
        WienerBlurButton                matlab.ui.control.Button
        WienerBlurLabel                 matlab.ui.control.Label
        WienerPSFField                  matlab.ui.control.NumericEditField
        PSFLabel                        matlab.ui.control.Label
        WienerKField                    matlab.ui.control.NumericEditField
        SigmaLabel_2                    matlab.ui.control.Label
        WienerGOButton                  matlab.ui.control.Button
        WienerUploadImageButton         matlab.ui.control.Button
        WienerOutputLabel               matlab.ui.control.Label
        WienerInputLabel                matlab.ui.control.Label
        WienerBlur                      matlab.ui.control.UIAxes
        WienerOutput                    matlab.ui.control.UIAxes
        WienerInput                     matlab.ui.control.UIAxes
    end



    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.ImageConvolutionUITable.Data = [0 0 0; 0 0 0; 0 0 0];
        end

        % Button pushed function: ImageSmoothingUploadImageButton
        function ImageSmoothingUploadImageButtonPushed(app, event)
            % Display uigetfile dialog
            filterspec = {'*.jpg;*.tif;*.png;*.bmp','All Image Files'};
            [filename, pathname] = uigetfile(filterspec);

            % If the user cancels, return.
            if ~ischar(filename)
                return;
            end

            % Construct the full file path.
            filepath = fullfile(pathname, filename);

            % Read the image.
            imageData = imread(filepath);

            % Show the image.
            imshow(imageData, 'Parent', app.ImageSmoothingInput, 'XData', [1 app.ImageSmoothingInput.Position(3)], 'YData', [1 app.ImageSmoothingInput.Position(4)]);
        end

        % Button pushed function: ImageSmoothingGoButton
        function ImageSmoothingGoButtonPushed(app, event)
            % Get the parameteres
            filterName = app.ImageSmoothingFilterDropDown.Value;
            convolutionSize = app.ImageSmoothingConvolutionSizeEditField.Value;
            sigmaValue = app.ImageSmoothingSigmaEditField.Value;

            imageData = getimage(app.ImageSmoothingInput);
            currentWrapper = utils.ImageWrapperFactory.Create(imageData);

            % Match by case
            switch filterName
                case 'Mean Filter'
                    % Do computation
                    resultData = currentWrapper.GetMatrixConvolution(utils.SpatialFilter.GenerateMeanFilter(convolutionSize));

                    % Display image
                    imshow(resultData, 'Parent', app.ImageSmoothingOutput, 'XData', [1 app.ImageSmoothingOutput.Position(3)], 'YData', [1 app.ImageSmoothingOutput.Position(4)]);
                case 'Gaussian Filter'
                    % Do computation
                    resultData = currentWrapper.GetMatrixConvolution(utils.SpatialFilter.GenerateGaussianFilter(convolutionSize, sigmaValue));

                    % Display image
                    imshow(resultData, 'Parent', app.ImageSmoothingOutput, 'XData', [1 app.ImageSmoothingOutput.Position(3)], 'YData', [1 app.ImageSmoothingOutput.Position(4)]);
                otherwise
                    uialert(app.UIFigure, 'Unrecognized filter name', 'Filter Error');
            end
        end

        % Button pushed function: ImageFrequencyUploadImageButton
        function ImageFrequencyUploadImageButtonPushed(app, event)
            filterspec = {'*.jpg;*.tif;*.png;*.bmp','All Image Files'};
            [filename, pathname] = uigetfile(filterspec);

            % If the user cancels, return.
            if ~ischar(filename)
                return;
            end

            % Construct the full file path.
            filepath = fullfile(pathname, filename);

            % Read the image.
            imageData = imread(filepath);

            % Show the image.
            imshow(imageData, 'Parent', app.ImageFrequencyInput, 'XData', [1 app.ImageFrequencyInput.Position(3)], 'YData', [1 app.ImageFrequencyInput.Position(4)]);
        end

        % Button pushed function: ImageFrequencyGoButton
        function ImageFrequencyGoButtonPushed(app, event)
            % Get the parameters
            filterName = app.ImageFrequencyFilterDropDown.Value;
            cutOffFrequency = app.ImageFrequencyCutOffFrequencyEditField.Value;
            orderValue = app.ImageFrequencyOrderEditField.Value;

            imageData = getimage(app.ImageFrequencyInput);
            currentWrapper = utils.ImageWrapperFactory.Create(imageData);

            % Get the image dimensions
            [imageHeight, imageWidth] = currentWrapper.GetSize();

            % Match by case
            switch filterName
                case 'Low Pass Ideal'
                    % Do computation
                    resultData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateIdealLowPassFilter(imageWidth, imageHeight, cutOffFrequency));

                    % Display image
                    imshow(resultData, 'Parent', app.ImageFrequencyOutput, 'XData', [1 app.ImageFrequencyOutput.Position(3)], 'YData', [1 app.ImageFrequencyOutput.Position(4)]);
                case 'High Pass Ideal'
                    % Do computation
                    resultData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateIdealHighPassFilter(imageWidth, imageHeight, cutOffFrequency));

                    % Display image
                    imshow(resultData, 'Parent', app.ImageFrequencyOutput, 'XData', [1 app.ImageFrequencyOutput.Position(3)], 'YData', [1 app.ImageFrequencyOutput.Position(4)]);
                case 'Low Pass Gaussian'
                    % Do computation
                    resultData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateGaussianLowPassFilter(imageWidth, imageHeight, cutOffFrequency));

                    % Display image
                    imshow(resultData, 'Parent', app.ImageFrequencyOutput, 'XData', [1 app.ImageFrequencyOutput.Position(3)], 'YData', [1 app.ImageFrequencyOutput.Position(4)]);
                case 'High Pass Gaussian'
                    % Do computation
                    resultData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateGaussianHighPassFilter(imageWidth, imageHeight, cutOffFrequency));

                    % Display image
                    imshow(resultData, 'Parent', app.ImageFrequencyOutput, 'XData', [1 app.ImageFrequencyOutput.Position(3)], 'YData', [1 app.ImageFrequencyOutput.Position(4)]);
                case 'Low Pass Butterworth'
                    % Do computation
                    resultData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateButterworthLowPassFilter(imageWidth, imageHeight, cutOffFrequency, orderValue));

                    % Display image
                    imshow(resultData, 'Parent', app.ImageFrequencyOutput, 'XData', [1 app.ImageFrequencyOutput.Position(3)], 'YData', [1 app.ImageFrequencyOutput.Position(4)]);
                case 'High Pass Butterworth'
                    % Do computation
                    resultData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateButterworthHighPassFilter(imageWidth, imageHeight, cutOffFrequency, orderValue));

                    % Display image
                    imshow(resultData, 'Parent', app.ImageFrequencyOutput, 'XData', [1 app.ImageFrequencyOutput.Position(3)], 'YData', [1 app.ImageFrequencyOutput.Position(4)]);
                otherwise
                    uialert(app.UIFigure, 'Unrecognized filter name', 'Filter Error');
            end
        end

        % Button pushed function: ImageConvolutionUploadImageButton
        function ImageConvolutionUploadImageButtonPushed(app, event)
            filterspec = {'*.jpg;*.tif;*.png;*.bmp','All Image Files'};
            [filename, pathname] = uigetfile(filterspec);

            % If the user cancels, return.
            if ~ischar(filename)
                return;
            end

            % Construct the full file path.
            filepath = fullfile(pathname, filename);

            % Read the image.
            imageData = imread(filepath);

            % Show the image.
            imshow(imageData, 'Parent', app.ImageConvolutionInput, 'XData', [1 app.ImageConvolutionInput.Position(3)], 'YData', [1 app.ImageConvolutionInput.Position(4)]);
        end

        % Button pushed function: ImageConvolutionGoButton
        function ImageConvolutionGoButtonPushed(app, event)
            % Get the parameters
            convolutionMatrix = app.ImageConvolutionUITable.Data;

            imageData = getimage(app.ImageConvolutionInput);
            currentWrapper = utils.ImageWrapperFactory.Create(imageData);

            % Do computation
            resultData = currentWrapper.GetMatrixConvolution(convolutionMatrix);

            % Show the image
            imshow(resultData, 'Parent', app.ImageConvolutionOutput, 'XData', [1 app.ImageConvolutionOutput.Position(3)], 'YData', [1 app.ImageConvolutionOutput.Position(4)]);
        end

        % Value changed function: ImageConvolutionMatrixSizeSpinner
        function ImageConvolutionMatrixSizeSpinnerValueChanged(app, event)
            sizeValue = app.ImageConvolutionMatrixSizeSpinner.Value;
            
            app.ImageConvolutionUITable.Data = zeros(sizeValue);
        end

        % Button pushed function: ImageBrighteningUploadImageButton
        function ImageBrighteningUploadImageButtonPushed(app, event)
            filterspec = {'*.jpg;*.tif;*.png;*.bmp','All Image Files'};
            [filename, pathname] = uigetfile(filterspec);

            % If the user cancels, return.
            if ~ischar(filename)
                return;
            end

            % Construct the full file path.
            filepath = fullfile(pathname, filename);

            % Read the image.
            imageData = imread(filepath);

            % Show the image.
            imshow(imageData, 'Parent', app.ImageBrighteningInput, 'XData', [1 app.ImageBrighteningInput.Position(3)], 'YData', [1 app.ImageBrighteningInput.Position(4)]);
        end

        % Button pushed function: ImageBrighteningGoButton
        function ImageBrighteningGoButtonPushed(app, event)
            % Get the parameters
            alphaValue = app.ImageBrighteningAlphaEditField.Value;
            filterName = app.ImageBrighteningFilterDropDown.Value;
            cutOffFrequency = app.ImageBrighteningCutOffFrequencyEditField.Value;
            orderValue = app.ImageBrighteningOrderEditField.Value;

            imageData = getimage(app.ImageBrighteningInput);
            currentWrapper = utils.ImageWrapperFactory.Create(imageData);

            % Get the image dimensions
            [imageHeight, imageWidth] = currentWrapper.GetSize();

            switch filterName
                case 'High Pass Ideal'
                    % Do computation
                    highpassData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateIdealHighPassFilter(imageWidth, imageHeight, cutOffFrequency));
                    resultData = currentWrapper.GetBrightening(highpassData, alphaValue);

                    % Show the image
                    imshow(resultData, 'Parent', app.ImageBrighteningOutput, 'XData', [1 app.ImageBrighteningOutput.Position(3)], 'YData', [1 app.ImageBrighteningOutput.Position(4)]);
                case 'High Pass Gaussian'
                     % Do computation
                    highpassData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateGaussianHighPassFilter(imageWidth, imageHeight, cutOffFrequency));
                    resultData = currentWrapper.GetBrightening(highpassData, alphaValue);

                    % Show the image
                    imshow(resultData, 'Parent', app.ImageBrighteningOutput, 'XData', [1 app.ImageBrighteningOutput.Position(3)], 'YData', [1 app.ImageBrighteningOutput.Position(4)]);
                case 'High Pass Butterworth'
                     % Do computation
                    highpassData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateButterworthHighPassFilter(imageWidth, imageHeight, cutOffFrequency, orderValue));
                    resultData = currentWrapper.GetBrightening(highpassData, alphaValue);

                    % Show the image
                    imshow(resultData, 'Parent', app.ImageBrighteningOutput, 'XData', [1 app.ImageBrighteningOutput.Position(3)], 'YData', [1 app.ImageBrighteningOutput.Position(4)]);
                otherwise
                    uialert(app.UIFigure, 'Unrecognized filter name', 'Filter Error');
            end
        end

        % Button pushed function: SaltPepperUploadImageButton
        function SaltPepperUploadImageButtonPushed(app, event)
            filterspec = {'*.jpg;*.tif;*.png;*.bmp','All Image Files'};
            [filename, pathname] = uigetfile(filterspec);
            
            % If the user cancels, return.
            if ~ischar(filename)
                     return;
            end
            
            % Construct the full file path.
            filepath = fullfile(pathname, filename);
            
            % Read the image.
            imageData = imread(filepath);
            
            % Show the image.
            imshow(imageData, 'Parent', app.ImageSaltPepperInput, 'XData', [1 app.ImageSaltPepperInput.Position(3)], 'YData', [1 app.ImageSaltPepperInput.Position(4)]);
        end

        % Button pushed function: AddSaltPepperButton
        function AddSaltPepperButtonPushed(app, event)
            noiseDensity = app.SaltPepperNoiseFieldEditField.Value;
            imageData = getimage(app.ImageSaltPepperInput);
            noisyImage = imnoise(imageData, 'salt & pepper', noiseDensity);

            imshow(noisyImage, 'Parent', app.ImageSaltPepperNoised, 'XData', [1 app.ImageSaltPepperNoised.Position(3)], 'YData', [1 app.ImageSaltPepperNoised.Position(4)]);
        end

        % Button pushed function: SaltPepperGoButton
        function SaltPepperGoButtonPushed(app, event)
            imageData = getimage(app.ImageSaltPepperNoised);
            currentWrapper = utils.ImageWrapperFactory.Create(imageData);

            filterName = app.SaltPepperChooseFilterDropDown.Value;
            convolutionSize = app.SaltPepperConvolutionSize.Value;

            switch filterName
                case 'Min Filter'
                    resultData = currentWrapper.GetFunctionConvolution(utils.SpatialFilter.GenerateMin(), convolutionSize);
                case 'Max Filter'
                    resultData = currentWrapper.GetFunctionConvolution(utils.SpatialFilter.GenerateMax(), convolutionSize);
                case 'Median Filter'
                    resultData = currentWrapper.GetFunctionConvolution(utils.SpatialFilter.GenerateMedian(), convolutionSize);
                case 'Arithmetic Mean Filter'
                    resultData = currentWrapper.GetMatrixConvolution(utils.SpatialFilter.GenerateMeanFilter(convolutionSize));
                case 'Geometric Filter'
                    resultData = currentWrapper.GetFunctionConvolution(utils.SpatialFilter.GenerateGeometricMean(), convolutionSize);
                case 'Harmonic Mean Filter'
                    resultData = currentWrapper.GetFunctionConvolution(utils.SpatialFilter.GenerateHarmonicMean(), convolutionSize);
                case 'Contraharmonic Mean Filter'
                    resultData = currentWrapper.GetFunctionConvolution(utils.SpatialFilter.GenerateContraharmonicMean(), convolutionSize);
                case 'Midpoint Filter'
                    resultData = currentWrapper.GetFunctionConvolution(utils.SpatialFilter.GenerateMidpoint(), convolutionSize);
                case 'Alpha-Trimmed Mean Filter'
                    resultData = currentWrapper.GetFunctionConvolution(utils.SpatialFilter.GenerateAlphaTrimmedMean(), convolutionSize);
                otherwise
                    uialert(app.UIFigure, 'Unrecognized filter name', 'Filter Error');
            end

            imshow(resultData, 'Parent', app.ImageSaltPepperOutput, 'XData', [1 app.ImageSaltPepperOutput.Position(3)], 'YData', [1 app.ImageSaltPepperOutput.Position(4)])
        end

        % Button pushed function: PeriodicUploadImageButton
        function PeriodicUploadImageButtonPushed(app, event)
            filterspec = {'*.jpg;*.tif;*.png;*.bmp','All Image Files'};
            [filename, pathname] = uigetfile(filterspec);
            
            % If the user cancels, return.
            if ~ischar(filename)
                     return;
            end
            
            % Construct the full file path.
            filepath = fullfile(pathname, filename);
            
            % Read the image.
            imageData = imread(filepath);
            
            % Show the image.
            imshow(imageData, 'Parent', app.PeriodicImageInput, 'XData', [1 app.PeriodicImageInput.Position(3)], 'YData', [1 app.PeriodicImageInput.Position(4)]);
        end

        % Button pushed function: PeriodicGOButton
        function PeriodicGOButtonPushed(app, event)
            bandwith = app.PeriodicBandwithField.Value;
            filterName = app.PeriodicFilterDropdown.Value;
            cutOffFrequency = app.PeriodicCOFField.Value;
            orderValue = app.PeriodicOrderField.Value;
            imageData = getimage(app.PeriodicImageInput);
            currentWrapper = utils.ImageWrapperFactory.Create(imageData);

            % Get the image dimensions
            [imageHeight, imageWidth] = currentWrapper.GetSize();

            switch filterName
                case 'Bandpass Ideal'
                    resultData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateIdealBandpassFilter(imageWidth, imageHeight, cutOffFrequency,bandwith));
                case 'Bandpass Gaussian'
                    resultData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateGaussianBandpassFilter(imageWidth, imageHeight, cutOffFrequency,bandwith));
                case 'Bandpass Butterworth'
                    resultData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateButterworthBandpassFilter(imageWidth, imageHeight, cutOffFrequency,bandwith, orderValue));
                case 'Bandreject Ideal'
                    resultData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateIdealBandrejectFilter(imageWidth, imageHeight, cutOffFrequency,bandwith));
                case 'Bandreject Gaussian'
                    resultData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateGaussianBandrejectFilter(imageWidth, imageHeight, cutOffFrequency,bandwith));
                case 'Bandereject Butterworth'
                    resultData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateButterworthBandrejectFilter(imageWidth, imageHeight, cutOffFrequency,bandwith, orderValue));
            end

            imshow(resultData, 'Parent', app.PeriodicImageOutput, 'XData', [1 app.PeriodicImageOutput.Position(3)], 'YData', [1 app.PeriodicImageOutput.Position(4)])
        end

        % Button pushed function: WienerUploadImageButton
        function WienerUploadImageButtonPushed(app, event)
            filterspec = {'*.jpg;*.tif;*.png;*.bmp','All Image Files'};
            [filename, pathname] = uigetfile(filterspec);

            % If the user cancels, return.
            if ~ischar(filename)
                return;
            end

            % Construct the full file path.
            filepath = fullfile(pathname, filename);

            % Read the image.
            imageData = imread(filepath);

            % Show the image.
            imshow(imageData, 'Parent', app.WienerInput, 'XData', [1 app.WienerInput.Position(3)], 'YData', [1 app.WienerInput.Position(4)]);
        end

        % Button pushed function: WienerGOButton
        function WienerGOButtonPushed(app, event)
            k = app.WienerKField.Value;
            length = app.WienerLengthEditField.Value;
            theta = app.WienerThetaEditField.Value;
            psf = fspecial('motion', length, theta);

            blurData = getimage(app.WienerBlur);
            currentWrapper = utils.ImageWrapperFactory.Create(blurData);

            % Get the image dimensions
            [imageHeight, imageWidth] = currentWrapper.GetSize();
            
            resultData = currentWrapper.GetFrequencyConvolution(utils.FrequencyFilter.GenerateWienerFilter(imageWidth, imageHeight, psf, k));
            imshow(resultData, 'Parent', app.WienerOutput, 'XData', [1 app.WienerOutput.Position(3)], 'YData', [1 app.WienerOutput.Position(4)])
        end

        % Button pushed function: WienerBlurButton
        function WienerBlurButtonPushed(app, event)
            length = app.WienerLengthEditField.Value;
            theta = app.WienerThetaEditField.Value;
            psf = fspecial('motion', length, theta);
            
            imageData = getimage(app.WienerInput);

            blurredImage = imfilter(imageData, psf, 'conv', 'circular');

            imshow(blurredImage, 'Parent', app.WienerBlur, 'XData', [1 app.WienerBlur.Position(3)], 'YData', [1 app.WienerBlur.Position(4)]);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 640 480];

            % Create ConvolutionTab
            app.ConvolutionTab = uitab(app.TabGroup);
            app.ConvolutionTab.Title = 'Convolution';

            % Create ImageConvolutionInput
            app.ImageConvolutionInput = uiaxes(app.ConvolutionTab);
            app.ImageConvolutionInput.Position = [71 201 218 216];

            % Create ImageConvolutionOutput
            app.ImageConvolutionOutput = uiaxes(app.ConvolutionTab);
            app.ImageConvolutionOutput.Position = [360 201 218 216];

            % Create ImageConvolutionInputLabel
            app.ImageConvolutionInputLabel = uilabel(app.ConvolutionTab);
            app.ImageConvolutionInputLabel.FontWeight = 'bold';
            app.ImageConvolutionInputLabel.Position = [163 424 34 22];
            app.ImageConvolutionInputLabel.Text = 'Input';

            % Create ImageConvolutionOutputLabel
            app.ImageConvolutionOutputLabel = uilabel(app.ConvolutionTab);
            app.ImageConvolutionOutputLabel.FontWeight = 'bold';
            app.ImageConvolutionOutputLabel.Position = [452 424 44 22];
            app.ImageConvolutionOutputLabel.Text = 'Output';

            % Create ImageConvolutionUploadImageButton
            app.ImageConvolutionUploadImageButton = uibutton(app.ConvolutionTab, 'push');
            app.ImageConvolutionUploadImageButton.ButtonPushedFcn = createCallbackFcn(app, @ImageConvolutionUploadImageButtonPushed, true);
            app.ImageConvolutionUploadImageButton.Position = [135 135 90 27];
            app.ImageConvolutionUploadImageButton.Text = 'Upload Image';

            % Create ImageConvolutionGoButton
            app.ImageConvolutionGoButton = uibutton(app.ConvolutionTab, 'push');
            app.ImageConvolutionGoButton.ButtonPushedFcn = createCallbackFcn(app, @ImageConvolutionGoButtonPushed, true);
            app.ImageConvolutionGoButton.Position = [135 99 90 27];
            app.ImageConvolutionGoButton.Text = 'GO!';

            % Create ImageConvolutionUITable
            app.ImageConvolutionUITable = uitable(app.ConvolutionTab);
            app.ImageConvolutionUITable.ColumnName = '';
            app.ImageConvolutionUITable.RowName = {};
            app.ImageConvolutionUITable.ColumnEditable = true;
            app.ImageConvolutionUITable.Position = [323 23 292 165];

            % Create MatrixSizeSpinnerLabel
            app.MatrixSizeSpinnerLabel = uilabel(app.ConvolutionTab);
            app.MatrixSizeSpinnerLabel.HorizontalAlignment = 'right';
            app.MatrixSizeSpinnerLabel.Position = [90 66 65 22];
            app.MatrixSizeSpinnerLabel.Text = 'Matrix Size';

            % Create ImageConvolutionMatrixSizeSpinner
            app.ImageConvolutionMatrixSizeSpinner = uispinner(app.ConvolutionTab);
            app.ImageConvolutionMatrixSizeSpinner.Limits = [0 7];
            app.ImageConvolutionMatrixSizeSpinner.ValueDisplayFormat = '%.0f';
            app.ImageConvolutionMatrixSizeSpinner.ValueChangedFcn = createCallbackFcn(app, @ImageConvolutionMatrixSizeSpinnerValueChanged, true);
            app.ImageConvolutionMatrixSizeSpinner.Position = [170 66 100 22];
            app.ImageConvolutionMatrixSizeSpinner.Value = 3;

            % Create ImageSmoothingTab
            app.ImageSmoothingTab = uitab(app.TabGroup);
            app.ImageSmoothingTab.Title = 'Image Smoothing';

            % Create ImageSmoothingInput
            app.ImageSmoothingInput = uiaxes(app.ImageSmoothingTab);
            app.ImageSmoothingInput.Position = [71 201 218 216];

            % Create ImageSmoothingOutput
            app.ImageSmoothingOutput = uiaxes(app.ImageSmoothingTab);
            app.ImageSmoothingOutput.Position = [360 201 218 216];

            % Create ImageSmoothingInputLabel
            app.ImageSmoothingInputLabel = uilabel(app.ImageSmoothingTab);
            app.ImageSmoothingInputLabel.FontWeight = 'bold';
            app.ImageSmoothingInputLabel.Position = [163 424 34 22];
            app.ImageSmoothingInputLabel.Text = 'Input';

            % Create ImageSmoothingOutputLabel
            app.ImageSmoothingOutputLabel = uilabel(app.ImageSmoothingTab);
            app.ImageSmoothingOutputLabel.FontWeight = 'bold';
            app.ImageSmoothingOutputLabel.Position = [452 424 44 22];
            app.ImageSmoothingOutputLabel.Text = 'Output';

            % Create ImageSmoothingUploadImageButton
            app.ImageSmoothingUploadImageButton = uibutton(app.ImageSmoothingTab, 'push');
            app.ImageSmoothingUploadImageButton.ButtonPushedFcn = createCallbackFcn(app, @ImageSmoothingUploadImageButtonPushed, true);
            app.ImageSmoothingUploadImageButton.Position = [135 161 90 27];
            app.ImageSmoothingUploadImageButton.Text = 'Upload Image';

            % Create ImageSmoothingGoButton
            app.ImageSmoothingGoButton = uibutton(app.ImageSmoothingTab, 'push');
            app.ImageSmoothingGoButton.ButtonPushedFcn = createCallbackFcn(app, @ImageSmoothingGoButtonPushed, true);
            app.ImageSmoothingGoButton.Position = [135 125 90 27];
            app.ImageSmoothingGoButton.Text = 'GO!';

            % Create ChooseFilterLabel_3
            app.ChooseFilterLabel_3 = uilabel(app.ImageSmoothingTab);
            app.ChooseFilterLabel_3.HorizontalAlignment = 'right';
            app.ChooseFilterLabel_3.Position = [368 166 76 22];
            app.ChooseFilterLabel_3.Text = 'Choose Filter';

            % Create ImageSmoothingFilterDropDown
            app.ImageSmoothingFilterDropDown = uidropdown(app.ImageSmoothingTab);
            app.ImageSmoothingFilterDropDown.Items = {'Mean Filter', 'Gaussian Filter'};
            app.ImageSmoothingFilterDropDown.Position = [459 166 100 22];
            app.ImageSmoothingFilterDropDown.Value = 'Mean Filter';

            % Create SigmaLabel
            app.SigmaLabel = uilabel(app.ImageSmoothingTab);
            app.SigmaLabel.HorizontalAlignment = 'right';
            app.SigmaLabel.Position = [405 86 39 22];
            app.SigmaLabel.Text = 'Sigma';

            % Create ImageSmoothingSigmaEditField
            app.ImageSmoothingSigmaEditField = uieditfield(app.ImageSmoothingTab, 'numeric');
            app.ImageSmoothingSigmaEditField.LowerLimitInclusive = 'off';
            app.ImageSmoothingSigmaEditField.Limits = [0 Inf];
            app.ImageSmoothingSigmaEditField.Position = [459 86 100 22];
            app.ImageSmoothingSigmaEditField.Value = 1;

            % Create ConvolutionSizeEditFieldLabel
            app.ConvolutionSizeEditFieldLabel = uilabel(app.ImageSmoothingTab);
            app.ConvolutionSizeEditFieldLabel.HorizontalAlignment = 'right';
            app.ConvolutionSizeEditFieldLabel.Position = [349 127 95 22];
            app.ConvolutionSizeEditFieldLabel.Text = 'Convolution Size';

            % Create ImageSmoothingConvolutionSizeEditField
            app.ImageSmoothingConvolutionSizeEditField = uieditfield(app.ImageSmoothingTab, 'numeric');
            app.ImageSmoothingConvolutionSizeEditField.LowerLimitInclusive = 'off';
            app.ImageSmoothingConvolutionSizeEditField.Limits = [0 Inf];
            app.ImageSmoothingConvolutionSizeEditField.ValueDisplayFormat = '%.0f';
            app.ImageSmoothingConvolutionSizeEditField.Position = [459 127 100 22];
            app.ImageSmoothingConvolutionSizeEditField.Value = 1;

            % Create FrequencyFilteringTab
            app.FrequencyFilteringTab = uitab(app.TabGroup);
            app.FrequencyFilteringTab.Title = 'Frequency Filtering';

            % Create ImageFrequencyInput
            app.ImageFrequencyInput = uiaxes(app.FrequencyFilteringTab);
            app.ImageFrequencyInput.Position = [71 201 218 216];

            % Create ImageFrequencyOutput
            app.ImageFrequencyOutput = uiaxes(app.FrequencyFilteringTab);
            app.ImageFrequencyOutput.Position = [360 201 218 216];

            % Create ImageFrequencyInputLabel
            app.ImageFrequencyInputLabel = uilabel(app.FrequencyFilteringTab);
            app.ImageFrequencyInputLabel.FontWeight = 'bold';
            app.ImageFrequencyInputLabel.Position = [163 424 34 22];
            app.ImageFrequencyInputLabel.Text = 'Input';

            % Create ImageFrequencyOutputLabel
            app.ImageFrequencyOutputLabel = uilabel(app.FrequencyFilteringTab);
            app.ImageFrequencyOutputLabel.FontWeight = 'bold';
            app.ImageFrequencyOutputLabel.Position = [452 424 44 22];
            app.ImageFrequencyOutputLabel.Text = 'Output';

            % Create ImageFrequencyUploadImageButton
            app.ImageFrequencyUploadImageButton = uibutton(app.FrequencyFilteringTab, 'push');
            app.ImageFrequencyUploadImageButton.ButtonPushedFcn = createCallbackFcn(app, @ImageFrequencyUploadImageButtonPushed, true);
            app.ImageFrequencyUploadImageButton.Position = [135 161 90 27];
            app.ImageFrequencyUploadImageButton.Text = 'Upload Image';

            % Create ImageFrequencyGoButton
            app.ImageFrequencyGoButton = uibutton(app.FrequencyFilteringTab, 'push');
            app.ImageFrequencyGoButton.ButtonPushedFcn = createCallbackFcn(app, @ImageFrequencyGoButtonPushed, true);
            app.ImageFrequencyGoButton.Position = [135 125 90 27];
            app.ImageFrequencyGoButton.Text = 'GO!';

            % Create ChooseFilterLabel_2
            app.ChooseFilterLabel_2 = uilabel(app.FrequencyFilteringTab);
            app.ChooseFilterLabel_2.HorizontalAlignment = 'right';
            app.ChooseFilterLabel_2.Position = [368 166 76 22];
            app.ChooseFilterLabel_2.Text = 'Choose Filter';

            % Create ImageFrequencyFilterDropDown
            app.ImageFrequencyFilterDropDown = uidropdown(app.FrequencyFilteringTab);
            app.ImageFrequencyFilterDropDown.Items = {'Low Pass Ideal', 'High Pass Ideal', 'Low Pass Gaussian', 'High Pass Gaussian', 'Low Pass Butterworth', 'High Pass Butterworth'};
            app.ImageFrequencyFilterDropDown.Position = [459 166 100 22];
            app.ImageFrequencyFilterDropDown.Value = 'Low Pass Ideal';

            % Create CutOffFrequencyEditFieldLabel_2
            app.CutOffFrequencyEditFieldLabel_2 = uilabel(app.FrequencyFilteringTab);
            app.CutOffFrequencyEditFieldLabel_2.HorizontalAlignment = 'right';
            app.CutOffFrequencyEditFieldLabel_2.Position = [341 126 103 22];
            app.CutOffFrequencyEditFieldLabel_2.Text = 'Cut Off Frequency';

            % Create ImageFrequencyCutOffFrequencyEditField
            app.ImageFrequencyCutOffFrequencyEditField = uieditfield(app.FrequencyFilteringTab, 'numeric');
            app.ImageFrequencyCutOffFrequencyEditField.Limits = [0 Inf];
            app.ImageFrequencyCutOffFrequencyEditField.Position = [459 126 100 22];

            % Create OrderEditFieldLabel_2
            app.OrderEditFieldLabel_2 = uilabel(app.FrequencyFilteringTab);
            app.OrderEditFieldLabel_2.HorizontalAlignment = 'right';
            app.OrderEditFieldLabel_2.Position = [409 85 35 22];
            app.OrderEditFieldLabel_2.Text = 'Order';

            % Create ImageFrequencyOrderEditField
            app.ImageFrequencyOrderEditField = uieditfield(app.FrequencyFilteringTab, 'numeric');
            app.ImageFrequencyOrderEditField.LowerLimitInclusive = 'off';
            app.ImageFrequencyOrderEditField.Limits = [0 Inf];
            app.ImageFrequencyOrderEditField.ValueDisplayFormat = '%.0f';
            app.ImageFrequencyOrderEditField.Position = [459 85 100 22];
            app.ImageFrequencyOrderEditField.Value = 1;

            % Create ImageBrighteningTab
            app.ImageBrighteningTab = uitab(app.TabGroup);
            app.ImageBrighteningTab.Title = 'Image Brightening';

            % Create ImageBrighteningInput
            app.ImageBrighteningInput = uiaxes(app.ImageBrighteningTab);
            app.ImageBrighteningInput.Position = [71 201 218 216];

            % Create ImageBrighteningOutput
            app.ImageBrighteningOutput = uiaxes(app.ImageBrighteningTab);
            app.ImageBrighteningOutput.Position = [360 201 218 216];

            % Create ImageBrighteningInputLabel
            app.ImageBrighteningInputLabel = uilabel(app.ImageBrighteningTab);
            app.ImageBrighteningInputLabel.FontWeight = 'bold';
            app.ImageBrighteningInputLabel.Position = [163 424 34 22];
            app.ImageBrighteningInputLabel.Text = 'Input';

            % Create ImageBrighteningOutputLabel
            app.ImageBrighteningOutputLabel = uilabel(app.ImageBrighteningTab);
            app.ImageBrighteningOutputLabel.FontWeight = 'bold';
            app.ImageBrighteningOutputLabel.Position = [452 424 44 22];
            app.ImageBrighteningOutputLabel.Text = 'Output';

            % Create ImageBrighteningUploadImageButton
            app.ImageBrighteningUploadImageButton = uibutton(app.ImageBrighteningTab, 'push');
            app.ImageBrighteningUploadImageButton.ButtonPushedFcn = createCallbackFcn(app, @ImageBrighteningUploadImageButtonPushed, true);
            app.ImageBrighteningUploadImageButton.Position = [135 161 90 27];
            app.ImageBrighteningUploadImageButton.Text = 'Upload Image';

            % Create ImageBrighteningGoButton
            app.ImageBrighteningGoButton = uibutton(app.ImageBrighteningTab, 'push');
            app.ImageBrighteningGoButton.ButtonPushedFcn = createCallbackFcn(app, @ImageBrighteningGoButtonPushed, true);
            app.ImageBrighteningGoButton.Position = [135 125 90 27];
            app.ImageBrighteningGoButton.Text = 'GO!';

            % Create ChooseFilterLabel
            app.ChooseFilterLabel = uilabel(app.ImageBrighteningTab);
            app.ChooseFilterLabel.HorizontalAlignment = 'right';
            app.ChooseFilterLabel.Position = [368 126 76 22];
            app.ChooseFilterLabel.Text = 'Choose Filter';

            % Create ImageBrighteningFilterDropDown
            app.ImageBrighteningFilterDropDown = uidropdown(app.ImageBrighteningTab);
            app.ImageBrighteningFilterDropDown.Items = {'High Pass Ideal', 'High Pass Gaussian', 'High Pass Butterworth'};
            app.ImageBrighteningFilterDropDown.Position = [459 126 100 22];
            app.ImageBrighteningFilterDropDown.Value = 'High Pass Ideal';

            % Create CutOffFrequencyEditFieldLabel
            app.CutOffFrequencyEditFieldLabel = uilabel(app.ImageBrighteningTab);
            app.CutOffFrequencyEditFieldLabel.HorizontalAlignment = 'right';
            app.CutOffFrequencyEditFieldLabel.Position = [341 86 103 22];
            app.CutOffFrequencyEditFieldLabel.Text = 'Cut Off Frequency';

            % Create ImageBrighteningCutOffFrequencyEditField
            app.ImageBrighteningCutOffFrequencyEditField = uieditfield(app.ImageBrighteningTab, 'numeric');
            app.ImageBrighteningCutOffFrequencyEditField.Limits = [0 Inf];
            app.ImageBrighteningCutOffFrequencyEditField.Position = [459 86 100 22];

            % Create OrderEditFieldLabel
            app.OrderEditFieldLabel = uilabel(app.ImageBrighteningTab);
            app.OrderEditFieldLabel.HorizontalAlignment = 'right';
            app.OrderEditFieldLabel.Position = [409 45 35 22];
            app.OrderEditFieldLabel.Text = 'Order';

            % Create ImageBrighteningOrderEditField
            app.ImageBrighteningOrderEditField = uieditfield(app.ImageBrighteningTab, 'numeric');
            app.ImageBrighteningOrderEditField.LowerLimitInclusive = 'off';
            app.ImageBrighteningOrderEditField.Limits = [0 Inf];
            app.ImageBrighteningOrderEditField.ValueDisplayFormat = '%.0f';
            app.ImageBrighteningOrderEditField.Position = [459 45 100 22];
            app.ImageBrighteningOrderEditField.Value = 1;

            % Create AlphaEditFieldLabel
            app.AlphaEditFieldLabel = uilabel(app.ImageBrighteningTab);
            app.AlphaEditFieldLabel.HorizontalAlignment = 'right';
            app.AlphaEditFieldLabel.Position = [408 163 36 22];
            app.AlphaEditFieldLabel.Text = 'Alpha';

            % Create ImageBrighteningAlphaEditField
            app.ImageBrighteningAlphaEditField = uieditfield(app.ImageBrighteningTab, 'numeric');
            app.ImageBrighteningAlphaEditField.LowerLimitInclusive = 'off';
            app.ImageBrighteningAlphaEditField.Limits = [0 Inf];
            app.ImageBrighteningAlphaEditField.Position = [459 163 100 22];
            app.ImageBrighteningAlphaEditField.Value = 1;

            % Create SaltPepperRemovalTab
            app.SaltPepperRemovalTab = uitab(app.TabGroup);
            app.SaltPepperRemovalTab.Title = 'Salt & Pepper Removal';

            % Create ImageSaltPepperInput
            app.ImageSaltPepperInput = uiaxes(app.SaltPepperRemovalTab);
            app.ImageSaltPepperInput.Position = [71 253 163 164];

            % Create ImageSaltPepperNoised
            app.ImageSaltPepperNoised = uiaxes(app.SaltPepperRemovalTab);
            app.ImageSaltPepperNoised.Position = [262 253 163 164];

            % Create ImageSaltPepperOutput
            app.ImageSaltPepperOutput = uiaxes(app.SaltPepperRemovalTab);
            app.ImageSaltPepperOutput.Position = [452 253 163 164];

            % Create SaltPepperUploadImageButton
            app.SaltPepperUploadImageButton = uibutton(app.SaltPepperRemovalTab, 'push');
            app.SaltPepperUploadImageButton.ButtonPushedFcn = createCallbackFcn(app, @SaltPepperUploadImageButtonPushed, true);
            app.SaltPepperUploadImageButton.Position = [107 201 90 27];
            app.SaltPepperUploadImageButton.Text = 'Upload Image';

            % Create AddSaltPepperButton
            app.AddSaltPepperButton = uibutton(app.SaltPepperRemovalTab, 'push');
            app.AddSaltPepperButton.ButtonPushedFcn = createCallbackFcn(app, @AddSaltPepperButtonPushed, true);
            app.AddSaltPepperButton.Position = [299 201 90 27];
            app.AddSaltPepperButton.Text = 'Add Noise';

            % Create SaltPepperGoButton
            app.SaltPepperGoButton = uibutton(app.SaltPepperRemovalTab, 'push');
            app.SaltPepperGoButton.ButtonPushedFcn = createCallbackFcn(app, @SaltPepperGoButtonPushed, true);
            app.SaltPepperGoButton.Position = [107 151 90 27];
            app.SaltPepperGoButton.Text = 'GO!';

            % Create SaltPepperInputLabel
            app.SaltPepperInputLabel = uilabel(app.SaltPepperRemovalTab);
            app.SaltPepperInputLabel.FontWeight = 'bold';
            app.SaltPepperInputLabel.Position = [136 424 34 22];
            app.SaltPepperInputLabel.Text = 'Input';

            % Create SaltPepperOutputLabel
            app.SaltPepperOutputLabel = uilabel(app.SaltPepperRemovalTab);
            app.SaltPepperOutputLabel.FontWeight = 'bold';
            app.SaltPepperOutputLabel.Position = [517 424 44 22];
            app.SaltPepperOutputLabel.Text = 'Output';

            % Create SaltPepperNoisedImageLabel
            app.SaltPepperNoisedImageLabel = uilabel(app.SaltPepperRemovalTab);
            app.SaltPepperNoisedImageLabel.FontWeight = 'bold';
            app.SaltPepperNoisedImageLabel.Position = [302 424 83 22];
            app.SaltPepperNoisedImageLabel.Text = 'Noised Image';

            % Create ChooseFilterDropDownLabel
            app.ChooseFilterDropDownLabel = uilabel(app.SaltPepperRemovalTab);
            app.ChooseFilterDropDownLabel.HorizontalAlignment = 'right';
            app.ChooseFilterDropDownLabel.Position = [43 101 76 22];
            app.ChooseFilterDropDownLabel.Text = 'Choose Filter';

            % Create SaltPepperChooseFilterDropDown
            app.SaltPepperChooseFilterDropDown = uidropdown(app.SaltPepperRemovalTab);
            app.SaltPepperChooseFilterDropDown.Items = {'Min Filter', 'Max Filter', 'Median Filter', 'Arithmetic Mean Filter', 'Geometric Filter', 'Harmonic Mean Filter', 'Contraharmonic Mean Filter', 'Midpoint Filter', 'Alpha-Trimmed Mean Filter'};
            app.SaltPepperChooseFilterDropDown.Position = [134 101 100 22];
            app.SaltPepperChooseFilterDropDown.Value = 'Min Filter';

            % Create ConvolutionSizeEditFieldLabel_2
            app.ConvolutionSizeEditFieldLabel_2 = uilabel(app.SaltPepperRemovalTab);
            app.ConvolutionSizeEditFieldLabel_2.HorizontalAlignment = 'right';
            app.ConvolutionSizeEditFieldLabel_2.Position = [24 64 95 22];
            app.ConvolutionSizeEditFieldLabel_2.Text = 'Convolution Size';

            % Create SaltPepperConvolutionSize
            app.SaltPepperConvolutionSize = uieditfield(app.SaltPepperRemovalTab, 'numeric');
            app.SaltPepperConvolutionSize.LowerLimitInclusive = 'off';
            app.SaltPepperConvolutionSize.Limits = [0 Inf];
            app.SaltPepperConvolutionSize.ValueDisplayFormat = '%.0f';
            app.SaltPepperConvolutionSize.Position = [134 64 100 22];
            app.SaltPepperConvolutionSize.Value = 1;

            % Create NoiseRateLabel
            app.NoiseRateLabel = uilabel(app.SaltPepperRemovalTab);
            app.NoiseRateLabel.HorizontalAlignment = 'right';
            app.NoiseRateLabel.Position = [255 153 64 22];
            app.NoiseRateLabel.Text = 'Noise Rate';

            % Create SaltPepperNoiseFieldEditField
            app.SaltPepperNoiseFieldEditField = uieditfield(app.SaltPepperRemovalTab, 'numeric');
            app.SaltPepperNoiseFieldEditField.Position = [334 153 100 22];

            % Create PeriodicRemovalTab
            app.PeriodicRemovalTab = uitab(app.TabGroup);
            app.PeriodicRemovalTab.Title = 'Periodic Removal';

            % Create PeriodicImageInput
            app.PeriodicImageInput = uiaxes(app.PeriodicRemovalTab);
            app.PeriodicImageInput.Position = [71 201 218 216];

            % Create PeriodicImageOutput
            app.PeriodicImageOutput = uiaxes(app.PeriodicRemovalTab);
            app.PeriodicImageOutput.Position = [360 201 218 216];

            % Create PeriodicInputLabel
            app.PeriodicInputLabel = uilabel(app.PeriodicRemovalTab);
            app.PeriodicInputLabel.FontWeight = 'bold';
            app.PeriodicInputLabel.Position = [163 424 34 22];
            app.PeriodicInputLabel.Text = 'Input';

            % Create PeriodicOutputLabel
            app.PeriodicOutputLabel = uilabel(app.PeriodicRemovalTab);
            app.PeriodicOutputLabel.FontWeight = 'bold';
            app.PeriodicOutputLabel.Position = [452 424 44 22];
            app.PeriodicOutputLabel.Text = 'Output';

            % Create PeriodicUploadImageButton
            app.PeriodicUploadImageButton = uibutton(app.PeriodicRemovalTab, 'push');
            app.PeriodicUploadImageButton.ButtonPushedFcn = createCallbackFcn(app, @PeriodicUploadImageButtonPushed, true);
            app.PeriodicUploadImageButton.Position = [135 161 90 27];
            app.PeriodicUploadImageButton.Text = 'Upload Image';

            % Create PeriodicGOButton
            app.PeriodicGOButton = uibutton(app.PeriodicRemovalTab, 'push');
            app.PeriodicGOButton.ButtonPushedFcn = createCallbackFcn(app, @PeriodicGOButtonPushed, true);
            app.PeriodicGOButton.Position = [135 125 90 27];
            app.PeriodicGOButton.Text = 'GO!';

            % Create PeriodicFilterLabel
            app.PeriodicFilterLabel = uilabel(app.PeriodicRemovalTab);
            app.PeriodicFilterLabel.HorizontalAlignment = 'right';
            app.PeriodicFilterLabel.Position = [368 126 76 22];
            app.PeriodicFilterLabel.Text = 'Choose Filter';

            % Create PeriodicFilterDropdown
            app.PeriodicFilterDropdown = uidropdown(app.PeriodicRemovalTab);
            app.PeriodicFilterDropdown.Items = {'Bandpass Ideal', 'Bandpass Gaussian', 'Bandpass Butterworth', 'Bandreject Ideal', 'Bandreject Gaussian', 'Bandreject Butterworth'};
            app.PeriodicFilterDropdown.Position = [459 126 100 22];
            app.PeriodicFilterDropdown.Value = 'Bandpass Ideal';

            % Create PeriodicAlphaLabel
            app.PeriodicAlphaLabel = uilabel(app.PeriodicRemovalTab);
            app.PeriodicAlphaLabel.HorizontalAlignment = 'right';
            app.PeriodicAlphaLabel.Position = [390 163 54 22];
            app.PeriodicAlphaLabel.Text = 'Bandwith';

            % Create PeriodicBandwithField
            app.PeriodicBandwithField = uieditfield(app.PeriodicRemovalTab, 'numeric');
            app.PeriodicBandwithField.LowerLimitInclusive = 'off';
            app.PeriodicBandwithField.Limits = [0 Inf];
            app.PeriodicBandwithField.ValueDisplayFormat = '%.0f';
            app.PeriodicBandwithField.Position = [459 163 100 22];
            app.PeriodicBandwithField.Value = 1;

            % Create PeriodicCOFLabel
            app.PeriodicCOFLabel = uilabel(app.PeriodicRemovalTab);
            app.PeriodicCOFLabel.HorizontalAlignment = 'right';
            app.PeriodicCOFLabel.Position = [341 86 103 22];
            app.PeriodicCOFLabel.Text = 'Cut Off Frequency';

            % Create PeriodicCOFField
            app.PeriodicCOFField = uieditfield(app.PeriodicRemovalTab, 'numeric');
            app.PeriodicCOFField.Limits = [0 Inf];
            app.PeriodicCOFField.Position = [459 86 100 22];

            % Create PeriodicOrderLabel
            app.PeriodicOrderLabel = uilabel(app.PeriodicRemovalTab);
            app.PeriodicOrderLabel.HorizontalAlignment = 'right';
            app.PeriodicOrderLabel.Position = [409 45 35 22];
            app.PeriodicOrderLabel.Text = 'Order';

            % Create PeriodicOrderField
            app.PeriodicOrderField = uieditfield(app.PeriodicRemovalTab, 'numeric');
            app.PeriodicOrderField.LowerLimitInclusive = 'off';
            app.PeriodicOrderField.Limits = [0 Inf];
            app.PeriodicOrderField.ValueDisplayFormat = '%.0f';
            app.PeriodicOrderField.Position = [459 45 100 22];
            app.PeriodicOrderField.Value = 1;

            % Create WienerDeconvTab
            app.WienerDeconvTab = uitab(app.TabGroup);
            app.WienerDeconvTab.Title = 'Wiener Deconv';

            % Create WienerInput
            app.WienerInput = uiaxes(app.WienerDeconvTab);
            app.WienerInput.Position = [18 243 179 174];

            % Create WienerOutput
            app.WienerOutput = uiaxes(app.WienerDeconvTab);
            app.WienerOutput.Position = [445 243 171 174];

            % Create WienerBlur
            app.WienerBlur = uiaxes(app.WienerDeconvTab);
            app.WienerBlur.Position = [233 243 187 174];

            % Create WienerInputLabel
            app.WienerInputLabel = uilabel(app.WienerDeconvTab);
            app.WienerInputLabel.FontWeight = 'bold';
            app.WienerInputLabel.Position = [91 424 34 22];
            app.WienerInputLabel.Text = 'Input';

            % Create WienerOutputLabel
            app.WienerOutputLabel = uilabel(app.WienerDeconvTab);
            app.WienerOutputLabel.FontWeight = 'bold';
            app.WienerOutputLabel.Position = [496 424 44 22];
            app.WienerOutputLabel.Text = 'Output';

            % Create WienerUploadImageButton
            app.WienerUploadImageButton = uibutton(app.WienerDeconvTab, 'push');
            app.WienerUploadImageButton.ButtonPushedFcn = createCallbackFcn(app, @WienerUploadImageButtonPushed, true);
            app.WienerUploadImageButton.Position = [71 187 90 27];
            app.WienerUploadImageButton.Text = 'Upload Image';

            % Create WienerGOButton
            app.WienerGOButton = uibutton(app.WienerDeconvTab, 'push');
            app.WienerGOButton.ButtonPushedFcn = createCallbackFcn(app, @WienerGOButtonPushed, true);
            app.WienerGOButton.Position = [71 151 90 27];
            app.WienerGOButton.Text = 'GO!';

            % Create SigmaLabel_2
            app.SigmaLabel_2 = uilabel(app.WienerDeconvTab);
            app.SigmaLabel_2.HorizontalAlignment = 'right';
            app.SigmaLabel_2.Position = [46 80 25 22];
            app.SigmaLabel_2.Text = 'K';

            % Create WienerKField
            app.WienerKField = uieditfield(app.WienerDeconvTab, 'numeric');
            app.WienerKField.LowerLimitInclusive = 'off';
            app.WienerKField.Limits = [0 Inf];
            app.WienerKField.Position = [86 80 100 22];
            app.WienerKField.Value = 1;

            % Create PSFLabel
            app.PSFLabel = uilabel(app.WienerDeconvTab);
            app.PSFLabel.HorizontalAlignment = 'right';
            app.PSFLabel.Position = [45 116 28 22];
            app.PSFLabel.Text = 'PSF';

            % Create WienerPSFField
            app.WienerPSFField = uieditfield(app.WienerDeconvTab, 'numeric');
            app.WienerPSFField.LowerLimitInclusive = 'off';
            app.WienerPSFField.Limits = [0 Inf];
            app.WienerPSFField.ValueDisplayFormat = '%.0f';
            app.WienerPSFField.Position = [88 116 100 22];
            app.WienerPSFField.Value = 1;

            % Create WienerBlurLabel
            app.WienerBlurLabel = uilabel(app.WienerDeconvTab);
            app.WienerBlurLabel.FontWeight = 'bold';
            app.WienerBlurLabel.Position = [307 424 29 22];
            app.WienerBlurLabel.Text = 'Blur';

            % Create WienerBlurButton
            app.WienerBlurButton = uibutton(app.WienerDeconvTab, 'push');
            app.WienerBlurButton.ButtonPushedFcn = createCallbackFcn(app, @WienerBlurButtonPushed, true);
            app.WienerBlurButton.Position = [282 187 90 27];
            app.WienerBlurButton.Text = 'Blur';

            % Create LengthEditFieldLabel
            app.LengthEditFieldLabel = uilabel(app.WienerDeconvTab);
            app.LengthEditFieldLabel.HorizontalAlignment = 'right';
            app.LengthEditFieldLabel.Position = [255 153 42 22];
            app.LengthEditFieldLabel.Text = 'Length';

            % Create WienerLengthEditField
            app.WienerLengthEditField = uieditfield(app.WienerDeconvTab, 'numeric');
            app.WienerLengthEditField.LowerLimitInclusive = 'off';
            app.WienerLengthEditField.Limits = [0 Inf];
            app.WienerLengthEditField.Position = [312 153 100 22];
            app.WienerLengthEditField.Value = 1;

            % Create ThetaEditFieldLabel
            app.ThetaEditFieldLabel = uilabel(app.WienerDeconvTab);
            app.ThetaEditFieldLabel.HorizontalAlignment = 'right';
            app.ThetaEditFieldLabel.Position = [262 116 35 22];
            app.ThetaEditFieldLabel.Text = 'Theta';

            % Create WienerThetaEditField
            app.WienerThetaEditField = uieditfield(app.WienerDeconvTab, 'numeric');
            app.WienerThetaEditField.Limits = [0 Inf];
            app.WienerThetaEditField.Position = [312 116 100 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end