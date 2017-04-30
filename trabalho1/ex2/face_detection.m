%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% face_detection.m
% Transformação T aplicada através de tabela de lookup.

%Para uma imagem de face, procura localizar os extremos da face e afixar um retângulo a
%delimitar a face. Apresente os resultados experimentais obtidos com as imagens do conjunto FaceImages.zip

function face_detection(filename)
    
    if nargin==0
         filename = 'FaceImages\face1.bmp'; 
    end

    % Fechar todas as janelas de figuras.
    close all;

    % Limpar a consola.
    clc;
    
    % Ler a imagem a partir do ficheiro.
    I = imread(filename);
    
    %https://www.mathworks.com/help/vision/ref/vision.cascadeobjectdetector.step.html
        % Para detetar uma face
        detetor = vision.CascadeObjectDetector;

        % Retorna os valores da caixa de limite com base no número de objetos
        caixa = step(detetor, I)
    %
    
    % apresentar imagem
    figure(1); imshow(I); title(' Face detetada ');
    
    % desenhar a caixa
    for i = 1:size(caixa,1)
        rectangle('Position',caixa(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
    end    
    
end