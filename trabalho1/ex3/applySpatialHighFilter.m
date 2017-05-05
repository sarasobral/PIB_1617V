%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% Aplica um Filtro espacial passa-alto.

function If = applySpatialHighFilter(filename, originalFileName)
    
    if nargin==0
         filename =  'NoisyAndDistortedImages\squares_1.bmp';
         originalFileName = 'NoisyAndDistortedImages\squares.gif';
    end
	% Ler a imagem a partir do ficheiro.
	I = imread(filename);
    Io = imread(originalFileName);
    % Deteção de contornos por diferentes métodos.
    H = fspecial('laplacian');
    I2 = imfilter(I,H);    
    If = Io + I2;
%     figure(); set(gcf,'Name', 'Filter');
%     subplot(121); imagesc(I); title(' Image ' ); colormap('gray');
%     subplot(122); imagesc(If); axis tight; title(' Image 6' ); %colorbar;
%     impixelinfo;         

end

