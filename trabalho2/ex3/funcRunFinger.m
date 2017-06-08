%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% Para testar todas as imagens da pasta FingerprintImages

function funcTestFinger()
    fingerprint_enhancement_morph('FingerprintImages\finger1.tif')
    fingerprint_enhancement_morph('FingerprintImages\finger2.tif')
    fingerprint_enhancement_morph('FingerprintImages\finger3.tif')
    fingerprint_enhancement_morph('FingerprintImages\finger4.tif')
    fingerprint_enhancement_morph('FingerprintImages\finger5.bmp')
end