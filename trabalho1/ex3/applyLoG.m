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

% Esta aplica um filtro Gaussinano e de seguinda um filtro Laplaciano.

function If = applyLoG(I, Ioriginal)
    H = fspecial('log');
    If = imfilter(I,H);
    If = Ioriginal - If;
    
end
