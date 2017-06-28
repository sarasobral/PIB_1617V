function Iout = intensity_slicing (I)
    % obter a imagem monocromatica
    [M,N] = size(I); 
    % niveis de cinzento usados na imagem monocromatica
    grey_levels = unique(I);    
    % quantidade de cores a processar
    levels = size(grey_levels);
    if(grey_levels(1,1)==0 && grey_levels(2,1)==1 && levels(1)==2)
        grey_levels(2,1)=255;
    end
    % criar as cores correspondentes aos niveis de cinzento
    colors = [];
    for i = 1:1:levels
        colors  = [colors; getRGBcolor(grey_levels(i,1))];
    end  
    
    % planos da imagem de saida
    redPlane = I;
    greenPlane = I;
    bluePlane = I;   
    for i = levels:-1:1
        color = colors(i,:);
        redPlane(I<=grey_levels(i,1)) = color(1);
        greenPlane(I<=grey_levels(i,1)) = color(2);
        bluePlane(I<=grey_levels(i,1)) = color(3);                
    end
    Iout = cat(3, redPlane, greenPlane, bluePlane);
    %figure();
    %imshow(Iout);

end

function color = getRGBcolor(grey_level)
 allColors = [
 0 0 79;
 0 0 83;
 0 0 87;
 0 0 91;
 0 0 95;
 0 0 99;
 0 0 103;
 0 0 107;
 0 0 111;
 0 0 115;
 0 0 119;
 0 0 123;
 0 0 127;
 0 0 131;
 0 0 135;
 0 0 139;
 0 0 143;
 0 0 147;
 0 0 151;
 0 0 155;
 0 0 159;
 0 0 163;
 0 0 167;
 0 0 171;
 0 0 175;
 0 0 179;
 0 0 183;
 0 0 187;
 0 0 191;
 0 0 195;
 0 0 199;
 0 0 203;
 0 0 207;
 0 0 211;
 0 0 215;
 0 0 219;
 0 0 223;
 0 0 227;
 0 0 231;
 0 0 235;
 0 0 239;
 0 0 243;
 0 0 247;
 0 0 251;
 0 0 255;
 151 255 255;
 157 255 255;
 163 255 255;
 169 255 255;
 175 255 255;
 181 255 255;
 187 255 255;
 193 255 255;
 0 104 255;
 0 108 255;
 0 112 255;
 0 116 255;
 0 120 255;
 0 124 255;
 0 128 255;
 0 132 255;
 0 136 255;
 0 140 255;
 0 144 255;
 0 148 255;
 0 152 255;
 0 156 255;
 0 160 255;
 0 164 255;
 0 168 255;
 0 172 255;
 0 176 255;
 0 180 255;
 0 184 255;
 0 188 255;
 0 192 255;
 0 196 255;
 0 200 255;
 0 204 255;
 0 208 255;
 0 212 255;
 0 216 255;
 0 220 255;
 0 224 255;
 0 228 255;
 0 232 255;
 0 236 255;
 0 240 255;
 0 244 255;
 0 248 255;
 0 252 255;
 0 255 152;
 0 255 149;
 0 255 146;
 0 255 143;
 0 255 140;
 0 255 137;
 0 255 134;
 0 255 131;
 0 255 128;
 0 255 125;
 0 255 122;
 0 255 119;
 0 255 116;
 0 255 113;
 0 255 110;
 0 255 107;
 0 255 104;
 0 255 101;
 0 255 98;
 0 255 95;
 0 255 92;
 0 255 89;
 0 255 86;
 0 255 83;
 0 255 80;
 0 255 77;
 0 255 74;
 0 255 71;
 0 255 68;
 0 255 65;
 0 255 62;
 0 255 59;
 0 256 0;
 0 253 0;
 0 250 0;
 0 247 0;
 0 244 0;
 0 241 0;
 0 238 0;
 0 235 0;
 0 232 0;
 0 229 0;
 0 226 0;
 0 223 0;
 0 220 0;
 0 217 0;
 0 214 0;
 0 211 0;
 0 208 0;
 198 255 0;
 201 255 0;
 204 255 0;
 207 255 0;
 210 255 0;
 213 255 0;
 216 255 0;
 219 255 0;
 222 255 0;
 225 255 0;
 228 255 0;
 231 255 0;
 234 255 0;
 237 255 0;
 240 255 0;
 243 255 0;
 246 255 0;
 249 255 0;
 252 255 0;
 255 255 0;
 255 255 4;
 255 255 8;
 255 255 12;
 255 255 16;
 255 255 20;
 255 255 24;
 255 255 28;
 255 255 32;
 255 255 36;
 255 255 40;
 255 255 44;
 255 255 48;
 255 255 52;
 255 255 56;
 255 255 60;
 255 255 64;
 255 255 68;
 255 255 72;
 255 255 76;
 255 255 80;
 255 255 84;
 255 255 88;
 255 255 92;
 255 255 96;
 255 255 100;
 255 255 104;
 255 255 108;
 255 255 112;
 255 255 116;
 255 255 120;
 255 255 124;
 255 255 128;
 255 255 132;
 255 255 136;
 255 255 140;
 255 255 144;
 255 255 148;
 255 255 152;
 255 255 156;
 255 255 160;
 255 255 164;
 255 255 168;
 255 255 172;
 255 0 0;
 252 0 0;
 249 0 0;
 246 0 0;
 243 0 0;
 240 0 0;
 237 0 0;
 234 0 0;
 231 0 0;
 228 0 0;
 225 0 0;
 222 0 0;
 219 0 0;
 216 0 0;
 213 0 0;
 210 0 0;
 207 0 0;
 204 0 0;
 201 0 0;
 198 0 0;
 195 0 0;
 192 0 0;
 189 0 0;
 186 0 0;
 183 0 0;
 180 0 0;
 177 0 0;
 174 0 0;
 171 0 0;
 168 0 0;
 165 0 0;
 162 0 0;
 159 0 0;
 156 0 0;
 153 0 0;
 150 0 0;
 147 0 0;
 144 0 0;
 141 0 0;
 138 0 0;
 135 0 0;
 132 0 0;
 129 0 0;
 126 0 0;
 123 0 0;
 120 0 0;
 117 0 0;
 114 0 0;
 111 0 0;
 108 0 0;
 105 0 0;
 102 0 0;
 99 0 0];
     color = allColors((grey_level+1),:);
end
  