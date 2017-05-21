function intensity_to_RGB_transform()
    close all;
     clc;
%     coloring('BinaryAndGrayscaleImages\bird.gif');
     coloring('BinaryAndGrayscaleImages\circles.bmp');
%    coloring('BinaryAndGrayscaleImages\eight_bw2.gif');
%     coloring('BinaryAndGrayscaleImages\squares.gif');
%     coloring('BinaryAndGrayscaleImages\text.tif');
%     coloring('BinaryAndGrayscaleImages\weather.tif');
%     coloring('BinaryAndGrayscaleImages\weld.tif');
%     coloring('BinaryAndGrayscaleImages\xray.tif');
end
function coloring(filename)
	if nargin==0
       filename = ('BinaryAndGrayscaleImages\bird.gif');
    end
    % ler a imagem monocromatica
    I = imread(filename);
    % obter a imagem monocromatica
    [M,N] = size(I); 
    
    % planos da imagem de saida
    redPlane = I;
    greenPlane = I;
    bluePlane = I;
    
    for c = 1:1:M
        for r = 1:1:N
            % pixel a processar
            fx = I(c,r);
            red = fR(fx);
            green = fG(fx);
            blue = fB(fx);
            redPlane(c,r) = red;
            greenPlane(c,r) = green;
            bluePlane(c,r) = blue;    
        end
    end
    
    Iout = cat(3, redPlane, greenPlane, bluePlane);

    figure();
    imshow(Iout);
end

function r = fB(pixel)
    
    r = 2*pixel; %abs(cosd(double(pixel)));
end

function r = fG(pixel)
    r = 0.5*pixel; %abs(sind(double(pixel)));
end

function r = fR(pixel)
    r = 3*pixel; %abs(sind(double(pixel)));
end

