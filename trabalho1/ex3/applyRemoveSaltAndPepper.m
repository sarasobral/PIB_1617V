%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% Remove o ruido impulsivo salt and pepper.

function If = applyRemoveSaltAndPepper (image, image2comapre)
    
    if nargin==0
        image = 'NoisyAndDistortedImages\face1.bmp';
        image2comapre = 'NoisyAndDistortedImages\face1_1.bmp';
    end    
    
    arrayImage2comapre = imread(image2comapre);     
    
    If = medfilt2(arrayImage2comapre);
    
end