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
    distinct_safest_colors = rgb2safeColor(safe, filename, 'codeCard1_safest.png');
    disp(strcat({'safest colors of: '},filename,{' are: '},num2str(distinct_safest_colors)));
    safe=1;
    distinct_safe_colors = rgb2safeColor(safe, filename, 'codeCard1_safe.png');
    disp(strcat({'safe colors of: '},filename,{' are: '},num2str(distinct_safe_colors)));

    filename = 'codeCard2.png';
    safe=0;
    distinct_safest_colors = rgb2safeColor(safe, filename, 'codeCard2_safest.png');
    disp(strcat({'safest colors of: '},filename,{' are: '},num2str(distinct_safest_colors)));
    safe=1;
    distinct_safe_colors = rgb2safeColor(safe, filename, 'codeCard2_safe.png');
    disp(strcat({'safe colors of: '},filename,{' are: '},num2str(distinct_safe_colors)));
end
