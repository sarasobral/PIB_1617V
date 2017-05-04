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

% Aplica o operador Laplaciano.

function If = applyLoG(I, Io)
    H = fspecial('log');
    If = imfilter(I,H);
    If = Io - If;
    
end
