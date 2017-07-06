%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% fingerprint_enhancement_morph.m
% Transformação T aplicada através de tabela de lookup.

function I = minutiae_detection(IBW)
    matrix1 = [0 1 0;
        0 1 0;
        1 0 1];
    matrix2 = [0 0 0;
        0 1 0;
        0 0 1];
    matrix3 = [0 1 0;
        0 1 1;
        1 0 0];
    matrix4 = [1 0 1;
        0 1 0;
        0 1 0];
    matrix5 = [0 0 0;
        0 1 0;
        1 0 0];
    matrix6 = [0 1 0;
        1 1 0;
        0 0 1];
    matrix7 = [0 0 1;
        1 1 0;
        0 0 1];
    matrix8 = [1 0 0;
        0 1 0;
        0 0 0];
    matrix9 = [1 0 0;
        0 1 1;
        0 1 0];
    matrix10 = [1 0 0;
        0 1 1;
        1 0 0];
    matrix11 = [0 0 1;
        0 1 0;
        0 0 0];
    matrix12 = [0 0 1;
        1 1 0;
        0 1 0];
    matrix13 = [0 1 0;
        1 1 0;
        0 0 0];
    matrix14 = [0 0 0;
        0 1 1;
        0 1 0];
    matrix15 = [0 0 0;
        1 1 0;
        0 1 0];
    matrix16 = [0 1 0;
        0 1 1;
        0 0 0];
    [M,N] = size(IBW);
        % Obter as componentes R, G, e B
    R = uint8(255 * IBW);
    G = uint8(255 * IBW);
    B = uint8(255 * IBW);
    % percorrer cada componente 
	for c = 2:1:M-1
        for r = 2:1:N-1
            % pixel a processar
            if(IBW(c,r) == 1)
                me = [IBW(c-1,r-1) IBW(c,r-1) IBW(c+1,r-1);
                    IBW(c-1,r) IBW(c,r) IBW(c+1,r);
                    IBW(c-1,r+1) IBW(c,r+1) IBW(c+1,r+1)];
                if(sum(sum(xor(matrix1,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix2,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix3,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix4,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix5,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix6,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix7,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix8,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix9,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix10,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix11,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix12,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix13,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix14,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix15,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                elseif(sum(sum(xor(matrix16,me)))==0)
                    R(c-1,r-1)=255; G(c-1,r-1)=0; B(c-1,r-1)=0; 
                    R(c,r-1)=255; G(c,r-1)=0; B(c,r-1)=0;
                    R(c+1,r-1)=255; G(c+1,r-1)=0; B(c+1,r-1)=0;
                    R(c-1,r)=255; G(c-1,r)=0; B(c-1,r)=0;
                    R(c+1,r)=255; G(c+1,r)=0; B(c+1,r)=0;
                    R(c-1,r+1)=255; G(c-1,r+1)=0; B(c-1,r+1)=0;
                    R(c,r+1)=255; G(c,r+1)=0; B(c,r+1)=0; 
                    R(c+1,r+1)=255; G(c+1,r+1)=0; B(c+1,r+1)=0;
                end
            end
        end
    end
     I = cat(3, R, G, B);
    figure();
    imshow(I); 
end