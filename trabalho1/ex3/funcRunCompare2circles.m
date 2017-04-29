function funcRunCompare2faces()

    % Fechar todas as janelas de figuras.
    close all;

    % Limpar a consola.
    clc;
    
    ext = '.bmp';
    folder = 'NoisyAndDistortedImages\';
    imageName = 'circles';
    image = (strcat(folder,imageName, ext));
    I = imread(image);
    image2comapreName = 'circles_1';
    If = applyLowPass (ext, folder, imageName, image2comapreName, 100);
    callCompare (If, image, folder, image2comapreName, ext);
    image2comapreName = 'circles_2';
    If = applyLowPass (ext, folder, imageName, image2comapreName, 60);
    callCompare (If, image, folder, image2comapreName, ext);
    image2comapreName = 'circles_3';
    If = applyLowPass (ext, folder, imageName, image2comapreName, 10);
    If = applyLaplacian(If, I);
    callCompare (If, image, folder, image2comapreName, ext);
    image2comapreName = 'circles_4';
    If = applyLowPass (ext, folder, imageName, image2comapreName, 10);
    If = applyLaplacian(If, I);
    callCompare (If, image, folder, image2comapreName, ext);
    image2comapreName = 'circles_5';
    If = applyLowPass (ext, folder, imageName, image2comapreName, 10);
    If = applyLaplacian(If, I);
    callCompare (If, image, folder, image2comapreName, ext);
end

function callCompare (If, image, folder, image2comapreName, ext)
    newImageName = strcat(folder, image2comapreName, 'new', ext);
    imwrite(If, newImageName); 
    compare2images(image, newImageName);   
end
