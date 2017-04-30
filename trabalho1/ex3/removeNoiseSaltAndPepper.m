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

% Esta remove o ruido impulsivo salt and pepper.

function If = removeNoiseSaltAndPepper (ext, folder, imageName, image2comapreName)
    
    if nargin==0
        ext = '.bmp';
        folder = 'NoisyAndDistortedImages\';
        imageName = 'face1';
        image2comapreName = 'face1_1';
    end    
    
    image = strcat(folder, imageName, ext);
   
    image2comapre = strcat(folder, image2comapreName, ext);
    
    arrayImage2comapre = imread(image2comapre);     
    
    If = medfilt2(arrayImage2comapre);
    
end