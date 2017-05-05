%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% image_frequency_filtering.m
% Frequency filtering of images.

function If = image_frequency_filtering(filename, r)
 
    close all
    if nargin==0        
        filename = 'NoisyAndDistortedImages\squares_1.bmp';
        
    end 
    
    I = imread(filename);    
% Laplaciano 1 - definição
L1 = [  0 1 0; 
           1 -4 1; 
           0 1 0];

% Laplaciano 2 - definição
L2 = [  1 1 1; 
           1 -8 1; 
           1 1 1];

% h = fspecial('log', hsize, sigma) 
%        returns a rotationally symmetric Laplacian of Gaussian filter 
%        of size hsize with standard deviation sigma (positive). 
%        hsize can be a vector specifying the number of rows and columns in h, 
%        or it can be a scalar, in which case h is a square matrix. 
%        The default value for hsize is [5 5] and 0.5 for sigma.
LoG = fspecial('log', [3, 3], 0.25 );

% Imagem melhorada.
I1 = filter2(L1, I);
I2 = filter2(L2, I);
I_LoG = filter2(LoG,I);

% Comparação dos resultados com a imagem original.
figure(1); set(gcf,'Name', 'Laplaciano - imagens');
subplot(221); imshow(I); title(' Original' ); colormap('gray'); colorbar;
subplot(222); imshow(uint8(I1)); axis tight; title(' Laplaciano 1' ); colorbar;
subplot(223); imshow(uint8(I2)); axis tight; title(' Laplaciano 2' ); colorbar;
subplot(224); imshow(uint8(I_LoG)); axis tight; title(' LoG' ); colorbar;
impixelinfo;
% 
% figure(2);
% imshow(uint8(I1)); axis tight; title(' Laplaciano 1' ); colorbar;
% 
% figure(3);
% imshow(uint8(I2)); axis tight; title(' Laplaciano 2' ); colorbar;

% Análise do efeito da variação de sigma (desvio padrão) no LoG
figure(2);
for sigma= 0.01 : 0.01 : 0.55
    LoG = fspecial('log', [5, 5], sigma );
    I_LoG = filter2(LoG,I);
    
    figure(2); set(gcf,'Name', 'Laplaciano - imagens');
    subplot(121); imshow(I); title(' Original' ); colormap('gray'); colorbar;
    subplot(122); imshow(uint8(I_LoG)); axis tight; title( sprintf(' LoG, sigma=%.2f', sigma) ); colorbar;
    pause(2);
end
end