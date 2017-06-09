%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% MEIC - Mestrado em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%


function distinct_colors = rgb2safeColo(safe)
    close all;
    clc;
    if nargin==0
        safe=0;         
    end
    I = imread('tulips.tif');
    J = I;
    [M,N] = size(I);
    % Obter as componentes R, G, e B
    R = I(:,:,1);
    G = I(:,:,2);
    B = I(:,:,3);
    %   web safe color
    if(safe==1)
        % Os valores das componentes das 'safe colors'.
        safe_values = 0 : 51 : 255;        
        % percorrer cada componente 
        for c = 1:1:M
            for r = 1:1:768
                % pixel a processar
                pixel_value = R(c,r);
                R(c,r) = safe_color_pixel(pixel_value, safe_values); 
            end   
        end
        for c = 1:1:M-1
            for r = 1:1:768
                % pixel a processar
                pixel_value = G(c,r);
                R(c,r) = safe_color_pixel(pixel_value, safe_values); 
            end   
        end             
        for c = 1:1:M-1
            for r = 1:1:768
                % pixel a processar
                pixel_value = B(c,r);
                R(c,r) = safe_color_pixel(pixel_value, safe_values); 
            end   
        end 
    %   web safest color
    else
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
        for c = 1:1:M-1
            for r = 1:1:768
                % pixel a processar
                red_pixel_value = R(c,r);
                green_pixel_value = G(c,r);
                blue_pixel_value = B(c,r);
                new_pixel_value = safest_color_pixel(red_pixel_value, green_pixel_value, blue_pixel_value, safe_values); 
                R(c,r)=new_pixel_value(1);
                G(c,r)=new_pixel_value(2);
                B(c,r)=new_pixel_value(3);
            end   
        end 
    end     
    I(:,:,1)=R;
    I(:,:,2)=G;
    I(:,:,3)=B;
    figure();
    subplot(211); imshow(J);  title(' Imagem original '); impixelinfo;
    subplot(212); imshow(I); title(' Imagem transformada '); impixelinfo;

end

function new_pixel_value = safest_color_pixel(red_pixel_value, green_pixel_value, blue_pixel_value, safest_values)
    % distancia euclidiana a cada safest color
    s = size(safest_values);
    dim = s(1);
    
    % distancia euclidiana a cada safe color
    row = safest_values(1,:);
    a1 = row(1);
    a2 = red_pixel_value;
    a3 = (red_pixel_value-row(1));
    a4 = a3^2;
    d_min = sqrt(sum(((red_pixel_value-row(1)) .^ 2) + ((green_pixel_value-row(2)) .^ 2) + ((blue_pixel_value-row(3)) .^ 2)));
    new_pixel_value = row;
    for x = 2:1:dim
        row = safest_values(x,:);
        d = sqrt(sum(((red_pixel_value-row(1)) .^ 2) + ((green_pixel_value-row(2)) .^ 2) + ((blue_pixel_value-row(3)) .^ 2)));
     if(d<d_min) 
            d_min=d;
            new_pixel_value = row;
        end            
    end    
end

function new_pixel_value = safe_color_pixel(pixel_value, safe_values)
    % distancia euclidiana a cada safe color
    d_min  = sqrt(((safe_values(1) - pixel_value) .^ 2));
    new_pixel_value = safe_values(1);
    for x = 2:1:length(safe_values)
        d  = sqrt(sum((safe_values(x) - pixel_value) .^ 2));
        if(d<d_min) 
            d_min=d;
            new_pixel_value = safe_values(x);
        end            
    end
end