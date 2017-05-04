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

% Remover o ruido da imagem com um filtro espacial linear passa alto
% guardando a imagem reparada
% compar�-la com a imagem original.

function funcRunCompare2finger()

    % Fechar todas as janelas de figuras.
    close all;

    % Limpar a consola.
    clc;
    
    ext = '.bmp';
    folder = 'NoisyAndDistortedImages\';
    imageName = 'finger1';
    image = (strcat(folder,imageName, ext));
    I = imread(image);
    
    image2comapreName = 'finger1_1';
    image2comapre = (strcat(folder,image2comapreName, ext));
    If = applySpatialHighFilter(image, image2comapre);
    callCompare (If, image, folder, image2comapreName, ext);
    
    image2comapreName = 'finger1_2';
    image2comapre = (strcat(folder,image2comapreName, ext));
    If = applySpatialHighFilter(image, image2comapre);
    callCompare (If, image, folder, image2comapreName, ext);
    
    image2comapreName = 'finger1_3';
    image2comapre = (strcat(folder,image2comapreName, ext));
    If = applySpatialHighFilter(image, image2comapre);
    callCompare (If, image, folder, image2comapreName, ext);

    image2comapreName = 'finger1_4';
    image2comapre = (strcat(folder,image2comapreName, ext));
    If = applySpatialHighFilter(image, image2comapre);
    callCompare (If, image, folder, image2comapreName, ext);
    
    image2comapreName = 'finger1_5';
    image2comapre = (strcat(folder,image2comapreName, ext));
    If = applySpatialHighFilter(image, image2comapre);
    callCompare (If, image, folder, image2comapreName, ext);
    
end

