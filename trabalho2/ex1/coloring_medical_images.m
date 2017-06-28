function coloring_medical_images()
    close all;
    clc;
	filename =  'MedicalImages\MR1';
    coloring(filename,'.jpg');
    filename =  'MedicalImages\US1';
    coloring(filename, '.tif');
    filename =  'MedicalImages\PET1';
    coloring(filename, '.tif');
    filename =  'MedicalImages\XRay1';
    coloring(filename, '.tif');    
    filename =  'MedicalImages\XRay2';
    coloring(filename, '.tif');    
    filename =  'MedicalImages\CT1';
    coloring(filename, '.jpg');
end

function coloring(filename, ext)
    addpath(genpath('./../../trabalho1/ex1'));
    if (strcmp(filename, 'MedicalImages\US1'))
        I = rgb2gray(imread(strcat(filename, ext)))
    else
        I = imread(strcat(filename, ext));
    end
    
    
    Iout = intensity_slicing (I);    
	If = medical_image_enhancement(strcat(filename, ext));    
    Ifout = intensity_slicing (If);
    
     figure();
     subplot(221); imshow(I); colorbar; title(' Imagem original' );
     subplot(222); imshow(Iout); colorbar; title(' Imagem original colorida' );
     subplot(223); imshow(If); colorbar; title(' Imagem transformada' );
     subplot(224); imshow(Ifout); colorbar; title(' Imagem transformada colorida' );


end