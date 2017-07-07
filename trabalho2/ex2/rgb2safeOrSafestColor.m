%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% converte uma imagem RGB na sua versão web safe color ou web
% safest color, mediante um parâmetro de entrada safe

function distinct_colors = rgb2safeOrSafestColor(safe, filename, outfilename) 

    distinct_colors_matrix = []; 
    J = imread(filename);
    I = J;
    [M,N] = size(I);
    % Obter as componentes R, G, e B
    R = I(:,:,1);
    G = I(:,:,2);
    B = I(:,:,3);
    
    if(safe==1) %   web safe color
        % Os valores das componentes das 'safe colors'.
        safe_values = 0 : 51 : 255;        
        % percorrer cada componente 
        for c = 1:1:M
            for r = 1:1:N/3
                % pixel a processar
                red_pixel_value = R(c,r);
                green_pixel_value = G(c,r);
                blue_pixel_value = B(c,r);
                
                new_pixel_value = [safe_color_pixel(red_pixel_value, safe_values) safe_color_pixel(green_pixel_value, safe_values) safe_color_pixel(blue_pixel_value, safe_values)]; 
                R(c,r)=new_pixel_value(1);
                G(c,r)=new_pixel_value(2);
                B(c,r)=new_pixel_value(3); 
                distinct_colors_matrix = [distinct_colors_matrix; 10*new_pixel_value(1)+20*new_pixel_value(2)+30*new_pixel_value(3)];
            end   
        end
    else %   web safest color
        safe_values = [
            0 0 0;
            0 0 3;
            0 0 255;
            0 255 0;
            0 255 102;
            0 255 204;
            0 255 255;
            51 255 51;
            51 255 102;
            51 255 204;
            51 255 255;
            102 255 0;
            102 255 51;
            102 255 255;
            204 255 102;
            255 0 0;
            255 0 51;
            255 0 255;
            255 255 0;
            255 255 51;
            255 255 102;
            255 255 255];
        for c = 1:1:M
            for r = 1:1:N/3
                % pixel a processar
                red_pixel_value = R(c,r);
                green_pixel_value = G(c,r);
                blue_pixel_value = B(c,r);
                
                new_pixel_value = safest_color_pixel(red_pixel_value, green_pixel_value, blue_pixel_value, safe_values); 
                R(c,r)=new_pixel_value(1);
                G(c,r)=new_pixel_value(2);
                B(c,r)=new_pixel_value(3);
                distinct_colors_matrix = [distinct_colors_matrix; 10*new_pixel_value(1)+20*new_pixel_value(2)+30*new_pixel_value(3)];
            end   
        end
    end     
    I(:,:,1)=R;
    I(:,:,2)=G;
    I(:,:,3)=B;
    figure();
    subplot(211); imshow(J);  title(' Imagem original '); impixelinfo;
    subplot(212); imshow(I); title(' Imagem transformada '); impixelinfo;
    % transformar o RGB num valor unico    
    distinct_colors_matrix = unique(distinct_colors_matrix);
   [distinct_colors,n] = size(distinct_colors_matrix);
    imwrite(uint8(I), outfilename);
end

function new_pixel_value = safest_color_pixel(red_pixel_value, green_pixel_value, blue_pixel_value, safest_values)
    % distancia euclidiana a cada safest color
    s = size(safest_values);
    dim = s(1);
    
    % distancia euclidiana a cada safe color
    row = safest_values(1,:);
    d_min = sqrt(double(((double(red_pixel_value)-double(row(1))) .^ 2) + ((double(green_pixel_value)-double(row(2))) .^ 2) + ((double(blue_pixel_value)-double(row(3))) .^ 2)));
    new_pixel_value = row;
    for x = 2:1:dim
        row = safest_values(x,:);
        d = sqrt(double(((double(red_pixel_value)-double(row(1))) .^ 2) + ((double(green_pixel_value)-double(row(2))) .^ 2) + ((double(blue_pixel_value)-double(row(3))) .^ 2)));
     if(d<d_min) 
            d_min=d;
            new_pixel_value = row;
        end            
    end    
end

function new_pixel_value = safe_color_pixel(pixel_value, safe_values)
    % distancia euclidiana a cada safe color    
    d_min  = sqrt(double((double(safe_values(1))-double(pixel_value)).^2));
    new_pixel_value = safe_values(1);
    for x = 2:1:length(safe_values)
        safe = safe_values(x);
        d  = sqrt(double((double(safe) - double(pixel_value)) .^ 2));
        if(d<d_min) 
            d_min=d;
            new_pixel_value = safe_values(x);
        end            
    end
end