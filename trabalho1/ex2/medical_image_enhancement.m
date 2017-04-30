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

function medical_image_enhancement(filename)
    
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
    J = imadjust(I);

    figure();
    subplot(121); imshow(I); colorbar; title(' Imagem ' );
    subplot(122); imshow(J); colorbar; title(' Imagem transformada ' );

end