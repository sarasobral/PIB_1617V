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
%READ AN INPUT IMAGE
A = imread('cameraman.tif');
%PRE-ALLOCATE A MATRIX
Output = zeros([size(A,1) size(A,2) 3]);

%Define a colormap
map = colormap(jet(256));

%Assign the columns to 1-D RED,GREEN and BLUE
Red = map(:,1);
Green = map(:,2);
Blue = map(:,3);

%MAP THE COLORS BASED ON THE INTENSITY OF THE IMAGE

Output(:,:,1) = Red(A);
Output(:,:,2) = Green(A);
Output(:,:,3) = Blue(A);


Output = im2uint8(Output);
%DISPLAY THE IMAGE
imshow(Output);

%Save the image in PNG or JPEG format
imwrite(Output,'pseudo_color.jpg');
end  

