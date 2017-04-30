%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% Para testar todas as imagens da pasta MedicalImages

function funcTestFace()

    % Fechar todas as janelas de figuras.
    close all;

    % Limpar a consola.
    clc;
    
	filename =  'MedicalImages\MR1.jpg';
	medical_image_enhancement(filename);
    filename =  'MedicalImages\US1.tif';
	medical_image_enhancement(filename);
    filename =  'MedicalImages\PET1.tif';
	medical_image_enhancement(filename);
    filename =  'MedicalImages\XRay1.tif';
	medical_image_enhancement(filename);
end