%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% fingerprint_enhancement_morph.m
% Transformação T aplicada através de tabela de lookup.

%fingerprint_enhancement.m. Para uma imagem de impressão digital produz uma versão binária da mesma,
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
    
    % Calcular o limiar ótimo para transformar a imagem 
    % na sua versão binária (método de Otsu).
    level = graythresh(I)
     % Converter para imagem binária.
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
    subplot(232); imshow(IBW_origin); colorbar; title(' Imagem Binária' );
    
    subplot(233); imshow(IBW1); colorbar; title(' Imagem Binária Erosao1' );
    subplot(234); imshow(IBW2); colorbar; title(' Imagem Binária Abertura2' );
    subplot(235); imshow(IBW3); colorbar; title(' Imagem Binária Dilatção3' );
    
    subplot(236); imshow(IBW); colorbar; title(' Imagem Binária Processada' );
    impixelinfo; 
end