%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% image_laplacian_enhancement.m
% Função que ilustra a aplicação de melhoria de imagem com Laplaciano.

function image_laplacian_enhancement()

% Fechar todas as janelas de figuras.
close all;

% Limpar a consola.
clc

% Ler a imagem a partir do ficheiro.
%I = imread('circuit.tif');
I = imread('spine.tif');
%I = imread('squares.gif');

% Laplaciano 1 - para melhoria de imagem
L1 = [  0 -1 0; 
           -1 5 -1; 
            0 -1 0];

% Laplaciano 2 - para melhoria de imagem
L2 = [  -1 -1 -1; 
           -1 9 -1; 
            -1 -1 -1];

% Imagem melhorada.
I_en1 = filter2(L1, I);
I_en2 = filter2(L2, I);

% Comparação dos resultados com a imagem original.
% Imagens.
figure(1); set(gcf,'Name', 'Laplaciano - imagens');
subplot(221); imshow(I); title(' Original' ); colormap('gray'); colorbar;
subplot(222); imshow(uint8(I_en1)); axis tight; title(' Melhorada 1' ); colorbar;
subplot(223); imshow(I); title(' Original' ); colormap('gray'); colorbar;
subplot(224); imshow(uint8(I_en2)); axis tight; title(' Melhorada 2' ); colorbar;
impixelinfo;

% Comparação dos resultados com a imagem original.
% Histogramas.
figure(2); set(gcf,'Name', 'Laplaciano - histogramas');
subplot(221); imhist(I); title(' Original' ); 
subplot(222); imhist(uint8(I_en1));  title(' Melhorada 1' ); 
subplot(223); imhist(I); title(' Original' ); 
subplot(224); imhist(uint8(I_en2)); title(' Melhorada 2' ); 
end



