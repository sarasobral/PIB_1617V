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
                
    % Obter as dimensões (resolução da imagem).
    [M, N] = size(I1);
    vmed1 = sum(sum(I1)) / (M*N);
    [M, N] = size(I2);
    vmed2 = sum(sum(I2)) / (M*N);
    difBrightness = vmed1 - vmed2;
    
    vmin1 = min(min(I1));
    vmax1 = max(max(I1));
    contrastI1 = 20*log10((double(vmax1+1))/(double(vmin1+1)));
    vmin2 = min(min(I1));
    vmax2 = max(max(I1));
    contrastI2 = 20*log10((double(vmax2+1))/(double(vmin2+1)));
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
            MAE = MAE + abs(double(I1(c,r))-double(I2(c,r)));
        end
    end    
    MAE = MAE/(M*N);
    disp(actualFile);
    disp(['dif brilho = ' num2str(difBrightness)]);
    disp(['dif contraste = ' num2str(difContrast)]);
    disp(['dif entropia, = ' num2str(difEntropy)]);
    disp(['dif MSE = ' num2str(MSE)]);
    disp(['dif MAE= ' num2str(MAE)]);
    disp(' ');
    %figure;
    %imshowpair(I1, I2,'diff');
    
end