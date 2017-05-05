%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% Aplica um Filtro espacial passa-baixo.

function I = applySpatialLowFilter(filename, originalFileName)

    if nargin==0
         filename =  'NoisyAndDistortedImages\lena_1.bmp';
         originalFileName = 'NoisyAndDistortedImages\lena.gif';
    end
	% Ler a imagem a partir do ficheiro.
	I = imread(filename);
    Io = imread(originalFileName);

	% Filtro 1
	% Filtro passa-baixo de 3x3
	k1 = (1/9) * ones(3,3);
	I1 = filter2(k1, I);

	% Filtro 2
	% Filtro passa-baixo de 5x5
	k2 = (1/25) * ones(5,5);
	I2 = filter2(k2, I);

	% Filtro 3
	% Filtro passa-baixo de 7x7
	k3 = (1/49) * ones(7,7);
	I3 = filter2(k3, I);
    
    diff1 = abs(sum(sum(double(I1)-double(Io))));
    diff2 = abs(sum(sum(double(I2)-double(Io))));
    diff3 = abs(sum(sum(double(I3)-double(Io))));
    
    diff = [diff1 diff2 diff3];
    mindiff = min(diff);
    if(mindiff==diff1)
        I=I1; 
    elseif(mindiff==diff2)
        I=I2;
    else
        I=I3;
    end
%     figure(); set(gcf,'Name', 'Filters');
% 	subplot(141); imagesc(Io); title(' Image ' ); colormap('gray');
% 	subplot(242); imagesc(I1); axis tight; title(' Image 1 (3x3)' );
% 	subplot(243); imagesc(I2); axis tight; title(' Image 2 (5x5)' );
% 	subplot(244); imagesc(I3); axis tight; title(' Image 3 (7x7)' );
% 	impixelinfo;    
    
end

