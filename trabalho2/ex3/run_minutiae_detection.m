%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% Para testar a função fingerprint_enhancement_morph.m sobre todas as 
% imagens da pasta FingerprintImages

function run_minutiae_detection()

        % Fechar todas as janelas de figuras.  
        close all;
        % Limpar a consola.
        clc;

        IBW = fingerprint_enhancement_morph('FingerprintImages\finger1.tif');
        minutiae_detection(IBW);
        IBW = fingerprint_enhancement_morph('FingerprintImages\finger2.tif');
        minutiae_detection(IBW);
        IBW = fingerprint_enhancement_morph('FingerprintImages\finger3.tif');
        minutiae_detection(IBW);
        IBW = fingerprint_enhancement_morph('FingerprintImages\finger4.tif');
        minutiae_detection(IBW);
        IBW = fingerprint_enhancement_morph('FingerprintImages\finger5.bmp');
        minutiae_detection(IBW);
end