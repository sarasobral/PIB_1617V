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

% Esta função
% chama a função que remove o ruido de imagens
% guardando a imagem reparada
% e por fim compara-a com a imagem original.

function funcRunCompare2faces()

    % Fechar todas as janelas de figuras.
    close all;

    % Limpar a consola.
    clc;
    
    ext = '.bmp';
    folder = 'NoisyAndDistortedImages\';
    imageName = 'face1';
    image = (strcat(folder,imageName, ext));
    image2comapreName = 'face1_1';
    If = removeNoiseSaltAndPepper (ext, folder, imageName, image2comapreName);
    callCompare (If, image, folder, image2comapreName, ext);
    image2comapreName = 'face1_2';
    If = removeNoiseSaltAndPepper (ext, folder, imageName, image2comapreName);
    callCompare (If, image, folder, image2comapreName, ext);
    image2comapreName = 'face1_3';
    If = removeNoiseSaltAndPepper (ext, folder, imageName, image2comapreName);
    callCompare (If, image, folder, image2comapreName, ext);
    image2comapreName = 'face1_4';
    If = removeNoiseSaltAndPepper (ext, folder, imageName, image2comapreName);
    callCompare (If, image, folder, image2comapreName, ext);
    image2comapreName = 'face1_5';
    If = removeNoiseSaltAndPepper (ext, folder, imageName, image2comapreName);
    callCompare (If, image, folder, image2comapreName, ext);
end

function callCompare (If, image, folder, image2comapreName, ext)
    newImageName = strcat(folder, image2comapreName, 'median', ext);
    imwrite(If, newImageName); 
    compare2images(image, newImageName);   
end
