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

function If = applyFreqLowPass(image, image2comapre, r)
    
    if nargin==0        
        image = 'NoisyAndDistortedImages\circles.bmp';
        image2comapre = 'NoisyAndDistortedImages\circles_1.bmp';
        r = 100;
    end 
    
    I = imread(image);    
    arrayImage2comapre = imread(image2comapre); 
    
    If = frequency_filtering_low_pass(arrayImage2comapre, r);

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

    If = uint8(If( 1:size(I,1), 1:size(I,2)));
    %figure(); 
    %subplot(121); imshow(I);  title(' Original ');
    %subplot(122); imshow(If); title( sprintf(' Filtered (radius=%d)',radius) );
end