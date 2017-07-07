%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% Para testar a função fingerprint_enhancement_morph-m sobre todas
% as imagens da pasta FingerprintImages

function run_fingerprint_enhancement_morph()
   
    % Fechar todas as janelas de figuras.  
    close all;
    % Limpar a consola.
    clc;
 
    fingerprint_enhancement_morph('FingerprintImages\finger1.tif');
    fingerprint_enhancement_morph('FingerprintImages\finger2.tif');
    fingerprint_enhancement_morph('FingerprintImages\finger3.tif');
    fingerprint_enhancement_morph('FingerprintImages\finger4.tif');
    fingerprint_enhancement_morph('FingerprintImages\finger5.bmp');
end