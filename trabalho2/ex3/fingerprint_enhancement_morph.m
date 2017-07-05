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
       %    filename = 'FingerprintImages\finger5.bmp';                      
    end
        
    % Ler a imagem a partir do ficheiro.
    J = imread(filename);
    I = imadjust(J);%,[0.7 1],[0 1]
    
    % Calcular o limiar �timo para transformar a imagem 
    % na sua vers�o bin�ria (m�todo de Otsu).
    level = graythresh(I)
     % Converter para imagem bin�ria.
    IBW = im2bw(I, level);  
    IBW_origin = ~IBW;
    
    radius = 1,5;
    se = strel('disk',radius); 
    radius1 = 1,9;
    se1 = strel('disk',radius1);
    
    IBW = imerode(imopen(IBW_origin,se),se1);

    figure(); 
    subplot(131); imshow(J); title(filename);
    subplot(132); imshow(IBW_origin); title(' Imagem bin�ria' );
    subplot(133); imshow(IBW); title(' Imagem ap�s tratamento' );
    impixelinfo; 
end