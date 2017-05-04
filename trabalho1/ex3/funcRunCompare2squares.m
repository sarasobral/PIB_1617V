%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% Remover o ruido da imagem com um filtro espacial linear passa alto
% guardando a imagem reparada
% compará-la com a imagem original.

function funcRunCompare2squares()

    % Fechar todas as janelas de figuras.
    close all;

    % Limpar a consola.
    clc;
    
    ext = '.bmp';	
    exto = '.gif';	
    folder = 'NoisyAndDistortedImages\';
    imageName = 'squares';
    image = (strcat(folder,imageName, exto));
	
    image2comapreName = 'squares_1';
	image2Compare = (strcat(folder,image2comapreName, ext));    
	If = applySpatialHighFilter(image, image2Compare);
	callCompare (If, image, folder, image2comapreName, ext);
    
	image2comapreName = 'squares_2';
	image2Compare = (strcat(folder,image2comapreName, ext));    
	If = applySpatialHighFilter(image, image2Compare);
	callCompare (If, image, folder, image2comapreName, ext);
    
	image2comapreName = 'squares_3';
	image2Compare = (strcat(folder,image2comapreName, ext));    
	If = applySpatialHighFilter(image, image2Compare);
	callCompare (If, image, folder, image2comapreName, ext);
    
	image2comapreName = 'squares_4';
	image2Compare = (strcat(folder,image2comapreName, ext));    
	If = applySpatialHighFilter(image, image2Compare);
	callCompare (If, image, folder, image2comapreName, ext);
    
	image2comapreName = 'squares_5';
	image2Compare = (strcat(folder,image2comapreName, ext));    
	If = applySpatialHighFilter(image, image2Compare);
	callCompare (If, image, folder, image2comapreName, ext);             
    
end
