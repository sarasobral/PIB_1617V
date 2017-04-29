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
