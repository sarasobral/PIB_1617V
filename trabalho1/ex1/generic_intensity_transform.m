%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% generic_intensity_transform.m
% Transformação T aplicada através de tabela de lookup.

function generic_intensity_transform(filename)
    
    if nargin==0
         filename = 'GenericImages\lena.gif'; %      'GenericImages\peppers.png';
         % 'GenericImages\circ_bw.tif'; % 
         %               
    end

    % Fechar todas as janelas de figuras.
    close all;

    % Limpar a consola.
    clc;
    
    [I,rp,R,G,B] = image_details(filename);
    
    % tabela de lookup
    bit = (pow2(rp)-1);
    
    if(rp == 1) 
        LUT = [bit:-1:0, zeros(1,254)];
        It = (intlut(uint8(I), uint8(LUT)))*255;
        % Mostrar as três versões da imagem.
        figure;
        subplot(211); imshow(I);  title(' Imagem original '); impixelinfo;
        subplot(212); imshow(It); title(' Imagem transformada '); impixelinfo;
    end
    if(rp == 8) 
        LUT = bit:-1:0;
        It = intlut(uint8(I), uint8(LUT));
        % Mostrar as três versões da imagem.
        figure;
        subplot(211); imshow(I);  title(' Imagem original '); impixelinfo;
        subplot(212); imshow(It); title(' Imagem transformada '); impixelinfo;
    end
    if(rp == 24) 
        LUT = 255:-1:0;
        Rt = intlut(uint8(R), uint8(LUT));
        Gt = intlut(uint8(G), uint8(LUT));
        Bt = intlut(uint8(B), uint8(LUT));
        % Mostrar as três versões da imagem.
        figure;
        subplot(232); imshow(I);  title(' Imagem original '); impixelinfo;
        subplot(234); imshow(Rt); title(' Componente Red transformada '); impixelinfo;
        subplot(235); imshow(Gt); title(' Componente Blue transformada '); impixelinfo;
        subplot(236); imshow(Bt); title(' Componente Green transformada '); impixelinfo;
    end
    
    

end