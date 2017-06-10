%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%

function run_distinct_colors()
close all;
clc;
    filename = 'codeCard1.png';
    safe=0;
     distinct_colors = rgb2safeColo(safe, filename)
     safe=1;
     distinct_colors = rgb2safeColo(safe, filename)
    filename = 'codeCard2.png';
    safe=0;
    distinct_colors = rgb2safeColo(safe, filename)
    safe=1;
    distinct_colors = rgb2safeColo(safe, filename)

end
