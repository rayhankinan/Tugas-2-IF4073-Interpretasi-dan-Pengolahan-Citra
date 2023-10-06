classdef Wiener
    methods (Static)
        function deconvolved_image = WienerDeconvolution(blurred_image, psf, K)
            % ubah ke double precision
            blurred_image = im2double(blurred_image);
            psf = im2double(psf);
            
            % fft dari psf, dengan dimensi disamakan dengan image
            F_psf = fft2(psf, size(blurred_image, 1), size(blurred_image, 2));
            
            % rumus wiener filter
            Wiener_filter = conj(F_psf) ./ (abs(F_psf).^2 + K);
            
            % fft dari image blur
            F_blurred = fft2(blurred_image);
            
            % mengalikan penapis wiener dengan foto
            F_deconvolved =  F_blurred .* Wiener_filter;
            
            % inverse
            deconvolved_image = ifft2(F_deconvolved);
            
            % memastikan angka real dan mengembalikan ke tipe int
            deconvolved_image = real(deconvolved_image);
            deconvolved_image = im2uint8(deconvolved_image);
            
            % clip values diluar 0 - 255
            deconvolved_image(deconvolved_image < 0) = 0;
            deconvolved_image(deconvolved_image > 255) = 255;
        end
    end
end