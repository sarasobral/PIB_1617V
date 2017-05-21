function try_slicing()
    close all;
    clc;
    intensity_slicing(imread('BinaryAndGrayscaleImages\bird.gif'));
    intensity_slicing(imread('BinaryAndGrayscaleImages\circles.bmp'));
    intensity_slicing(imread('BinaryAndGrayscaleImages\eight_bw2.gif'));
    intensity_slicing(imread('BinaryAndGrayscaleImages\squares.gif'));
    intensity_slicing(imread('BinaryAndGrayscaleImages\text.tif'));
    intensity_slicing(imread('BinaryAndGrayscaleImages\weather.tif'));
    intensity_slicing(imread('BinaryAndGrayscaleImages\weld.tif'));
    intensity_slicing(imread('BinaryAndGrayscaleImages\xray.tif'));
end