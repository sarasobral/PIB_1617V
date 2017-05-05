%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% Esta função chama gera a nova imagem e compara-a com a original 

function callCompare (If, image, folder, image2comapreName, ext)
    newImageName = strcat(folder, image2comapreName, 'spacial', ext);
    imwrite(uint8(If), newImageName); 
    compare2images(image, newImageName);   
end