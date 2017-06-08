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
    addpath(genpath('./../../trabalho1/ex2'));
    addpath(genpath('./../../trabalho1/ex5'));
    if (strcmp(filename, 'MedicalImages\US1'))
        I = rgb2gray(imread(strcat(filename, ext)))
    else
        I = imread(strcat(filename, ext));
    end
    Iout = intensity_slicing (I);
    imwrite(uint8(Iout), strcat(filename, 'original', ext)); 
    
	If = medical_image_enhancement(strcat(filename, ext));    
    Iout =intensity_slicing (If);
    imwrite(uint8(Iout), strcat(filename, 'transf', ext)); 

end