%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% fingerprint_enhancement_morph.m
% Transforma��o T aplicada atrav�s de tabela de lookup.

%fingerprint_enhancement.m. Para uma imagem de impress�o digital produz uma vers�o bin�ria da mesma,
%tentando separar as riscas do fundo. Apresente os resultados experimentais obtidos com as imagens do conjunto
%FingerprintImages.zip.

function fingerprint_enhancement_morph(filename)
    
    if nargin==0
         filename = 'FingerprintImages\finger3.tif';
         % filename = 'FingerprintImages\finger5.bmp';                      
    end
    
    % Fechar todas as janelas de figuras.
    
    close all;

    % Limpar a consola.
    clc;
        
    % Ler a imagem a partir do ficheiro.
    I = imread(filename);
    I = imadjust(I);%,[0.7 1],[0 1]
    
    % Calcular o limiar �timo para transformar a imagem 
    % na sua vers�o bin�ria (m�todo de Otsu).
    level = graythresh(I)
     % Converter para imagem bin�ria.
    IBW = im2bw(I, level);  
    IBW_origin = ~IBW;
    IBW=IBW_origin;
    

    
    a = [1 1 1; 1 1 1; 1 1 1];
    
    %se = strel('line',2,1);
    radius = 0,01;
    se = strel('disk',radius); 
    
    IBW1 = imerode(IBW,a);
      
    IBW2 = imopen(IBW1,a);
      
    IBW3 = imdilate(IBW1,a);
     
    IBW = imclose(IBW3,a);
        
    figure(); 
    subplot(231); imshow(I); colorbar; title(' Imagem ' );
    subplot(232); imshow(IBW_origin); colorbar; title(' Imagem Bin�ria' );
    
    subplot(233); imshow(IBW1); colorbar; title(' Imagem Bin�ria Erosao1' );
    subplot(234); imshow(IBW2); colorbar; title(' Imagem Bin�ria Abertura2' );
    subplot(235); imshow(IBW3); colorbar; title(' Imagem Bin�ria Dilat��o3' );
    
    subplot(236); imshow(IBW); colorbar; title(' Imagem Bin�ria Processada' );
    impixelinfo; 
end