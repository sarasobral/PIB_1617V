%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% fingerprint_enhancement.m
% Transforma��o T aplicada atrav�s de tabela de lookup.

%fingerprint_enhancement.m. Para uma imagem de impress�o digital produz uma vers�o bin�ria da mesma,
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
    
    % Calcular o limiar �timo para transformar a imagem 
    % na sua vers�o bin�ria (m�todo de Otsu).
    level = graythresh(I)
     % Converter para imagem bin�ria.
    IBW = im2bw(I, level);    
    
    figure(1); 
    subplot(121); imshow(I); colorbar; title(' Imagem ' );
    subplot(122); imshow(IBW); colorbar; title(' Imagem Bin�ria' );
    impixelinfo;    

end