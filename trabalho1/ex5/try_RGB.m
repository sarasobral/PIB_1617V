function try_RGB()
    close all;
    clc;
    intensity_to_RGB_transform('BinaryAndGrayscaleImages\bird.gif');
    intensity_to_RGB_transform('BinaryAndGrayscaleImages\circles.bmp');
    intensity_to_RGB_transform('BinaryAndGrayscaleImages\eight_bw2.gif');
    intensity_to_RGB_transform('BinaryAndGrayscaleImages\squares.gif');
    intensity_to_RGB_transform('BinaryAndGrayscaleImages\text.tif');
    intensity_to_RGB_transform('BinaryAndGrayscaleImages\weather.tif');
    intensity_to_RGB_transform('BinaryAndGrayscaleImages\weld.tif');
    intensity_to_RGB_transform('BinaryAndGrayscaleImages\xray.tif');
end