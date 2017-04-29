function If = applyLoG(I, Ioriginal)
    H = fspecial('log');
    If = imfilter(I,H);
    If = Ioriginal - If;
    
end
