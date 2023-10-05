classdef Wiener
    methods (Static)
        function deconvolved_image = myWienerDeconvolution(blurred_image, psf, K)
            % blurred_image: image blur
            % psf: Point Spread Function 
            % noise : Noise additive

            % ubah ke double precision
            blurred_image = double(blurred_image);
            psf = double(psf);

            % fft dari psf, dengan dimensi disamakan dengan image
            F_psf = fft2(psf, size(blurred_image, 1), size(blurred_image, 2));
        
            % rumus wiener filter
            Wiener_filter = conj(F_psf) ./ (abs(F_psf).^2 + K);
        
            % fft dari image blur
            F_blurred = fft2(blurred_image);

            % mengalikan penapis wiener dengan foto
            F_deconvolved = Wiener_filter .* F_blurred;
        
            % inverse
            deconvolved_image = ifft2(F_deconvolved);
        
            % memastikan angka real dan mengembalikan ke tipe int
            deconvolved_image = real(deconvolved_image);
            deconvolved_image = uint8(deconvolved_image);
        
            % clip values diluar 0 - 255
            deconvolved_image(deconvolved_image < 0) = 0;
            deconvolved_image(deconvolved_image > 255) = 255;
        end
    end
end