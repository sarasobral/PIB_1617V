function slicing()
    close all;
    clc;
    coloring('BinaryAndGrayscaleImages\bird.gif');
    coloring('BinaryAndGrayscaleImages\circles.bmp');
    coloring('BinaryAndGrayscaleImages\eight_bw2.gif');
    coloring('BinaryAndGrayscaleImages\squares.gif');
    coloring('BinaryAndGrayscaleImages\text.tif');
    coloring('BinaryAndGrayscaleImages\weather.tif');
    coloring('BinaryAndGrayscaleImages\weld.tif');
    coloring('BinaryAndGrayscaleImages\xray.tif');
end
function coloring (filename) 
    I = imread(filename);
    G = double(I);
    % Obter o colormap da imagem.
    C = double(colormap);
    % Encontrar apenas o comprimento da primeira dimensão de C.
    L = double(size(C,1))
    % Ajustar a matriz para o intervalo do mapa.
    Gs = round(interp1(linspace(min(G(:)),max(G(:)),L),1:L,G));
    % Imagem RGB a partir da iamgem escalada.
    H = reshape(C(Gs,:),[size(Gs) 3]); 
    figure();
    imshow(H);  % Does this image match the other one?
    title('IMAGE (MxNx3)');
end  

