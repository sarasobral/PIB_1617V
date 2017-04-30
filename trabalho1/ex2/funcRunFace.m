%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% Para testar todas as imagens da pasta FaceImages

function funcTestFace()
    face_detection('FaceImages\face1.bmp')
    face_detection('FaceImages\face2.bmp') % nop
    face_detection('FaceImages\face3.bmp')
    face_detection('FaceImages\face4.bmp')
    face_detection('FaceImages\face5.bmp')
end