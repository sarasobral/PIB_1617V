%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% fingerprint_enhancement.m
% Transforma√ß√£o T aplicada atrav√©s de tabela de lookup.

% Remover o ruido da imagem com um filtro espacial n„o linear mediana
% guardando a imagem reparada
% compar·-la com a imagem original.

function funcRunCompare2faces()

    % Fechar todas as janelas de figuras.
    close all;

    % Limpar a consola.
    clc;
    
    ext = '.bmp';
    folder = 'NoisyAndDistortedImages\';
    imageName = 'face1';
    image = strcat(folder, imageName, ext);
    
    image2comapreName = 'face1_1';    
    image2comapre = strcat(folder, image2comapreName, ext);    
    If = applyRemoveSaltAndPepper (image, image2comapre);
    callCompare (If, image, folder, image2comapreName, ext);
    
    image2comapreName = 'face1_2';
    image2comapre = strcat(folder, image2comapreName, ext);    
    If = applyRemoveSaltAndPepper (image, image2comapre);
    callCompare (If, image, folder, image2comapreName, ext);
    
    image2comapreName = 'face1_3';
    image2comapre = strcat(folder, image2comapreName, ext);    
    If = applyRemoveSaltAndPepper (image, image2comapre);
    callCompare (If, image, folder, image2comapreName, ext);
    
    image2comapreName = 'face1_4';
    image2comapre = strcat(folder, image2comapreName, ext);    
    If = applyRemoveSaltAndPepper (image, image2comapre);
    callCompare (If, image, folder, image2comapreName, ext);
    
    image2comapreName = 'face1_5';
    image2comapre = strcat(folder, image2comapreName, ext);    
    If = applyRemoveSaltAndPepper (image, image2comapre);
    callCompare (If, image, folder, image2comapreName, ext);
end
