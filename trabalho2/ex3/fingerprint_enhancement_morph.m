%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% fingerprint_enhancement.m
% Para uma imagem de impressão digital produz uma versão binária da 
% mesma, tentando separar as riscas. 

function IBW = fingerprint_enhancement_morph(filename)
    
    if nargin==0
         filename = 'FingerprintImages\finger3.tif';
        %  filename = 'FingerprintImages\finger5.bmp';                      
    end
        
    % Ler a imagem a partir do ficheiro.
    J = imread(filename);
    I = imadjust(J);%,[0.7 1],[0 1]
    
    % Calcular o limiar ótimo para transformar a imagem 
    % na sua versão binária (método de Otsu).
    level = graythresh(I);
     % Converter para imagem binária.
    IBW = im2bw(I, level);  
    IBW_origin = ~IBW;
    
    radius = 1,5;
    se = strel('disk',radius); 
    radius1 = 2;
    se1 = strel('disk',radius1);
    radius2 = 1;
    se2 = strel('disk',radius2);
    
    IBW_morph = imerode(imdilate(imerode(imopen(IBW_origin,se),se1),se),se2);
    IBW = bwmorph(IBW_morph,'skel',Inf);
    figure(); 
    subplot(141); imshow(J); title(filename);
    subplot(142); imshow(IBW_origin); title(' Imagem binária' );
    subplot(143); imshow(IBW_morph); title(' Versão morfológiva' );
    subplot(144); imshow(IBW); title(' Versão 1 bit' );
end