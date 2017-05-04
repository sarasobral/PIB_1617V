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

% Remover o ruido da imagem com um filtro espacial linear passa baixo
% guardando a imagem reparada
% compar�-la com a imagem original.

function funcRunCompare2lena()

    % Fechar todas as janelas de figuras.
    close all;

    % Limpar a consola.
    clc;
    
    ext = '.bmp';	
    exto = '.gif';	
    folder = 'NoisyAndDistortedImages\';
    imageName = 'lena';
    image = (strcat(folder,imageName, exto));
	
    image2comapreName = 'lena_1';
	image2Compare = (strcat(folder,image2comapreName, ext));    
	If = applySpatialLowFilter(image, image2Compare);
	callCompare (If, image, folder, image2comapreName, ext);
    
	image2comapreName = 'lena_2';
	image2Compare = (strcat(folder,image2comapreName, ext));    
	If = applySpatialLowFilter(image, image2Compare);
	callCompare (If, image, folder, image2comapreName, ext);
    
	image2comapreName = 'lena_3';
	image2Compare = (strcat(folder,image2comapreName, ext));    
	If = applySpatialLowFilter(image, image2Compare);
	callCompare (If, image, folder, image2comapreName, ext);
    
	image2comapreName = 'lena_4';
	image2Compare = (strcat(folder,image2comapreName, ext));    
	If = applySpatialLowFilter(image, image2Compare);
	callCompare (If, image, folder, image2comapreName, ext);
    
	image2comapreName = 'lena_5';
	image2Compare = (strcat(folder,image2comapreName, ext));    
	If = applySpatialLowFilter(image, image2Compare);
	callCompare (If, image, folder, image2comapreName, ext);             
    
end
