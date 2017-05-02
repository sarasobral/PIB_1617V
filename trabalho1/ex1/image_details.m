%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% image_details.m
% resolu��o espacial; 
% resolu��o em profundidade; 
% valores m�nimo, m�dio e m�ximo de intensidade; 
% medida de contraste; 
% entropia da imagem.

function [I, rp, R, G, B] = image_details(filename)
    
    if nargin==0
         filename =  'GenericImages\peppers.png';
         % 'GenericImages\circ_bw.tif'; %
         % 'GenericImages\lena.gif'; %  
    end

    % Fechar todas as janelas de figuras.
    %close all;

    % Limpar a consola.
    clc;

    % informa��o sobre a iagem
    info = imfinfo(filename);   
    % resolu��o espacial
    re = info.Width*info.Height;
    % resolu��o em profundidade
    rp = info.BitDepth;
    disp(['resolu��o espacial = ' num2str(re)]);
    disp(['resolu��o em profundidade = ' num2str(rp) ' bit/pixel']);
        
    % Ler a imagem a partir do ficheiro.
    I = imread(filename);
    R=0;G=0;B=0;
    % imagem colorida
    if (strcmp(info.ColorType, 'truecolor')) 
        % Obter as componentes R, G, e B
        R = I(:,:,1);
        G = I(:,:,2);
        B = I(:,:,3);
        
        % para a componente red
        % valores m�nimo, m�dio e m�ximo de intensidade
        vminR = min(min(R));
        vmedR = sum(sum(R)) / (info.Width*info.Height);
        vmaxR = max(max(R));
        % medida de contraste
        mcR = 20*log10((double(vmaxR+1))/(double(vminR+1)));
        % entropia da imagem
        eiR = entropy(R);
        
        % para a componente green
        % valores m�nimo, m�dio e m�ximo de intensidade
        vminG = min(min(G));
        vmedG = sum(sum(G)) / (info.Width*info.Height);
        vmaxG = max(max(G));
        % medida de contraste
        mcG = 20*log10((double(vmaxG+1))/(double(vminG+1)));
        % entropia da imagem       
        eiG = entropy(G);
        
        % para a componente blue
        % valores m�nimo, m�dio e m�ximo de intensidade
        vminB = min(min(B));
        vmedB = sum(sum(B)) / (info.Width*info.Height);
        vmaxB = max(max(B));
        % medida de contraste
        mcB = 20*log10((double(vmaxB+1))/(double(vminB+1)));
        % entropia da imagem
        eiB = entropy(B);
        
        % apresentar imagem e histograma
        figure(1);
        subplot(241); imshow(I);  colorbar; title(' Cor [R, G, B]' );
        subplot(242); imshow(R); colorbar; title(' Red componente' );
        subplot(243); imshow(G); colorbar; title(' Green componente' );
        subplot(244); imshow(B); colorbar; title(' Blue componente' );
        subplot(246); imhist(R); title(' Red Histograma ' );
        subplot(247); imhist(G); title(' Red Histograma ' );
        subplot(248); imhist(B); title(' Red Histograma ' );

        disp('para a componente red:');
        disp(['valores m�nimo de intensidade = ' num2str(vminR)]);
        disp(['valores m�dio de intensidade = ' num2str(vmedR)]);
        disp(['valores m�ximo de intensidade = ' num2str(vmaxR)]);
        disp(['medida de contraste = ' num2str(mcR)]);
        disp(['entropia da imagem = ' num2str(eiR)]);
        disp('para a componente green:');
        disp(['valores m�nimo de intensidade = ' num2str(vminG)]);
        disp(['valores m�dio de intensidade = ' num2str(vmedG)]);
        disp(['valores m�ximo de intensidade = ' num2str(vmaxG)]);
        disp(['medida de contraste = ' num2str(mcG)]);
        disp(['entropia da imagem = ' num2str(eiG)]);
        disp('para a componente blue:');
        disp(['valores m�nimo de intensidade = ' num2str(vminB)]);
        disp(['valores m�dio de intensidade = ' num2str(vmedB)]);
        disp(['valores m�ximo de intensidade = ' num2str(vmaxB)]);
        disp(['medida de contraste = ' num2str(mcB)]);
        disp(['entropia da imagem = ' num2str(eiB)]);
    end
    % imagem monocrom�tica ou bin�ria
    if (~strcmp(info.ColorType, 'truecolor')) 
        % valores m�nimo, m�dio e m�ximo de intensidade
        % � necess�rio realizar a oprecao 2 vezes sobre a matriz poprque 
        % a primeira opera��o devolve um vetor, e o obetivo � obter a opera��o
        % sobre esse vetor
        vmin = min(min(I));
        vmed = sum(sum(I)) / (info.Width*info.Height);
        vmax = max(max(I));
        % medida de contraste
        mc = 20*log10((double(vmax+1))/(double(vmin+1)));
        % entropia da imagem
        ei = entropy(I);
        
        % apresentar imagem e histograma
        figure(1);
        subplot(121); imshow(I); colorbar; title(' Imagem ' );
        subplot(122); imhist(I); title(' Histograma ' );
        impixelinfo;
        disp(['valores m�nimo de intensidade = ' num2str(vmin)]);
        disp(['valores m�dio de intensidade = ' num2str(vmed)]);
        disp(['valores m�ximo de intensidade = ' num2str(vmax)]);
        disp(['medida de contraste = ' num2str(mc)]);
        disp(['entropia da imagem = ' num2str(ei)]);
    end 
end