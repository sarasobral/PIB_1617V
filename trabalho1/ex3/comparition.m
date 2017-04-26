%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%

function comparition(originalFile, actualFile)

    if nargin==0
         originalFile = 'NoisyAndDistortedImages\circles.bmp';
         actualFile = 'NoisyAndDistortedImages\circles_1.bmp';
    end
    % Fechar todas as janelas de figuras.
    close all;

    % Limpar a consola.
    clc;
    
    brightnessI1 = mean2(originalFile);
    brightnessI2 = mean2(actualFile);
    M = brightnessI1 - brightnessI2
    
    contrastI1 = max(originalFile(:)) - min(originalFile(:));
    contrastI2 = max(actualFile(:)) - min(actualFile(:));
    C = contrastI1 - contrastI2
    
    originalArray = imread(originalFile);
    actualArray = imread(actualFile);
    
    entropyI1 = entropy(originalArray);
    entropyI2 = entropy(actualArray);
    H = entropyI1 - entropyI2
    
    MSE = immse(originalArray, actualArray)
    
    MAE = 0
    
    % Ler a imagem a partir do ficheiro.
    I1 = imread(originalFile);
    I2 = imread(actualFile);
    
    A = imread(originalFile);
    B = imread(originalFile);
    obj = imshowpair(A,B,'diff');
end