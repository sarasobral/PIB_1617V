%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% compara as duas imagens recebidas segundo o seu brilho, contraste, 
% entropia, MSE e MAE.

function compare2images(originalFile, actualFile)

    if nargin==0
         originalFile = 'NoisyAndDistortedImages\circles.bmp';
         actualFile = 'NoisyAndDistortedImages\circles_1.bmp';
    end

    % Ler a imagem a partir do ficheiro.
    I1 = imread(originalFile);
    I2 = imread(actualFile);
            
    brightnessI1 = mean2(originalFile);
    brightnessI2 = mean2(actualFile);
    difBrightness = brightnessI1 - brightnessI2;
        
    contrastI1 = max(originalFile(:)) - min(originalFile(:));
    contrastI2 = max(actualFile(:)) - min(actualFile(:));
    difContrast = contrastI1 - contrastI2;
 
    entropyI1 = entropy(I1);
    entropyI2 = entropy(I2);
    difEntropy = entropyI1 - entropyI2;
    
    info = imfinfo(originalFile);
    M = info.Width;
    N = info.Height;
            
    MSE = 0;
    for c = 1:1:(M-1)
        for r = 1:1:(N-1)
            MSE = MSE + square(double(I1(c,r))-double(I2(c,r)));
        end
    end    
    MSE = MSE/(M*N);
    
    MAE = 0;
    for c = 1:1:(M-1)
        for r = 1:1:(N-1)
            MAE = MAE + abs(I1(c,r)-I2(c,r));
        end
    end    
    MAE = MAE/(M*N);
    
    disp(['brilho = ' num2str(difBrightness)]);
    disp(['contraste = ' num2str(difContrast)]);
    disp(['entropia, = ' num2str(difEntropy)]);
    disp(['MSE = ' num2str(MSE)]);
    disp(['MAE= ' num2str(MAE)]);

    figure;
    imshowpair(I1, I2,'diff');
    
end