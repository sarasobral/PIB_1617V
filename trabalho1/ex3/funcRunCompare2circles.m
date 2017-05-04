%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% fingerprint_enhancement.m
% Transformação T aplicada atravÃ©s de tabela de lookup.

% Remover o ruido da imagem com um filtro em frequencia passa baixo
% se necessãrio aplicar um laplaciano
% guardando a imagem reparada
% compará-la com a imagem original.

function funcRunCompare2circles()

    % Fechar todas as janelas de figuras.
    close all;

    % Limpar a consola.
    clc;
    
    ext = '.bmp';
    folder = 'NoisyAndDistortedImages\';
    imageName = 'circles';
    image = strcat(folder, imageName, ext);
    I = imread(image);
    
    image2comapreName = 'circles_1';
    image2comapre = strcat(folder, image2comapreName, ext);
    If = applyFreqLowPass (image, image2comapre, 100);
    callCompare (If, image, folder, image2comapreName, ext);
    
    image2comapreName = 'circles_2';    
    image2comapre = strcat(folder, image2comapreName, ext);
    If = applyFreqLowPass (image, image2comapre, 60);
    If = applyLaplacian(If, I);  
    callCompare (If, image, folder, image2comapreName, ext);
    
    image2comapreName = 'circles_3';
    image2comapre = strcat(folder, image2comapreName, ext);
    If = applyFreqLowPass (image, image2comapre, 10);
    If = applyLaplacian(If, I);  
    callCompare (If, image, folder, image2comapreName, ext);
    
    image2comapreName = 'circles_4';
    image2comapre = strcat(folder, image2comapreName, ext);
    If = applyFreqLowPass (image, image2comapre, 10);
    If = applyLaplacian(If, I);  
    callCompare (If, image, folder, image2comapreName, ext);
    
    image2comapreName = 'circles_5';
    image2comapre = strcat(folder, image2comapreName, ext);
    If = applyFreqLowPass (image, image2comapre, 10);
    If = applyLaplacian(If, I);  
    callCompare (If, image, folder, image2comapreName, ext);
end