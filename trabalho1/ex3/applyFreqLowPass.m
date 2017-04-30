%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% fingerprint_enhancement.m
% Transformação T aplicada através de tabela de lookup.

% Esta aplica um filtro em frequencia passa baixo.

function If = applyFreqLowPass(ext, folder, imageName, image2comapreName, r)
    
    if nargin==0
        ext = '.bmp';
        folder = 'NoisyAndDistortedImages\';
        imageName = 'circles';
        image2comapreName = 'circles_1';
        r = 100;
    end 
    image = strcat(folder, imageName, ext);
    I = imread(image);
    image2comapre = strcat(folder, image2comapreName, ext);
    
    arrayImage2comapre = imread(image2comapre); 
    %for r = 10 : 10 : 140
        % Apply a low-pass filter with different radius
        If = frequency_filtering_low_pass(arrayImage2comapre, r);
        %pause(1);
    %end
end


function If = frequency_filtering_low_pass(I, radius)

    % Step 1 - Zero-padded image to resolution P=2M and Q=2N.
    Ip = [ I, zeros(size(I,1), size(I,2));
           zeros(size(I,1), size(I,2)), zeros(size(I,1), size(I,2))];
    Ip = uint8(Ip);
    P = size(Ip,1);
    Q = size(Ip,2);

    % Step 2 - Compute the DFT of the padded image and center its spectrum.
    Fp = fftshift(fft2(Ip));

    % Step 3 - Set the filter mask H, on the frequency domain.
    % In this case, it is a low-pass filter.
    H = zeros( P, Q );
    for m=1 : P
        for n=1 : Q
            d = sqrt( (m - P/2)^2 + (n - Q/2)^2);
            if d < radius
                H(m,n)=1;
            end
        end
    end

    % Step 4 - Multiply the spectrum of the padded image
    % with the filter mask H.
    G = Fp .* H;

    % Step 5 - Perform the inverse DFT (with centered spectrum).
    % Remove residual imaginary parts and convert to unsigned integer.
    If = ifft2 ( ifftshift(G) ) ;
    If = uint8(real(If));


    % Analysis of the main steps of the algorithm.
    %figure(1); 
    %subplot(221); imshow(Ip); title(' Padded image');
    %subplot(222); imagesc(abs(Fp)); title(' Spectrum of the padded image');
    %subplot(223); imshow(H); title(' Spectrum of H ');
    %subplot(224); imshow(If); title(' Padded filtered image');

    If = uint8(If( 1:size(I,1), 1:size(I,2)));
    %figure(); 
    %subplot(121); imshow(I);  title(' Original ');
    %subplot(122); imshow(If); title( sprintf(' Filtered (radius=%d)',radius) );
end