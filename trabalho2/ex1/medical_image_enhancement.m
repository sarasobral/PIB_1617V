%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% medical_image_enhancement.m.m
% realiza transformações de intensidade adequadas para melhorar a 
% legibilidade das mesmas. 

function J = medical_image_enhancement(filename)
    
    if nargin==0
        %  filename =  'MedicalImages\MR1.jpg';
        %  filename =  'MedicalImages\US1.tif';
        %  filename =  'MedicalImages\PET1.tif';
          filename =  'MedicalImages\XRay1.tif';
          
    end
    
    info = imfinfo(filename);
    I = imread(filename);
    
	if (strcmp(info.ColorType, 'truecolor')) 
        I = rgb2gray(I);
    end
    
    if strcmp(filename,'MedicalImages\PET1.tif')
        J = imadjust(I,[0.8 1],[0 1]); % tumores
        K = imadjust(I,[0 1],[0.06 0.9]); % improved body
        J = K+J;
%     elseif strcmp(filename,'MedicalImages\XRay1.tif') 
%         addpath(genpath('.\..\..\ex2'));
%         J = generic_intensity_transform('MedicalImages\XRay1.tif'); % inversa
%         K = imadjust(I);
%         J = J-K;
    else
    	J = imadjust(I);
    end
    
%     figure();
%     subplot(121); imshow(I); colorbar; title(' Imagem original' );
%     subplot(122); imshow(J); colorbar; title(' Imagem transformada ' );
%     imwrite(uint8(J), strcat(filename, 'transf', '.bmp')); 

end