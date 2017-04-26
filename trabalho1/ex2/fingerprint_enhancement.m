%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% fingerprint_enhancement.m
% Transformação T aplicada através de tabela de lookup.

%fingerprint_enhancement.m. Para uma imagem de impressão digital produz uma versão binária da mesma,
%tentando separar as riscas do fundo. Apresente os resultados experimentais obtidos com as imagens do conjunto
%FingerprintImages.zip.

function fingerprint_enhancement(filename)
    
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
    
    % Calcular o limiar ótimo para transformar a imagem 
    % na sua versão binária (método de Otsu).
    level = graythresh(I)
     % Converter para imagem binária.
    IBW = im2bw(I, level);    
    
    figure(1); 
    subplot(121); imshow(I); colorbar; title(' Imagem ' );
    subplot(122); imshow(IBW); colorbar; title(' Imagem Binária' );
    impixelinfo;    

end