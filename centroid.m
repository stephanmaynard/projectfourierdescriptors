


clc;
close all;
clear all;
% 
binary_image = imread('img/Bild11_U.bmp');
binary_image = double((binary_image));
picSize = size(binary_image);
picArea = 0;

% Berechnung der Fläche des Bildes
for i = 1:picSize(1)
   for j = 1 : picSize(1,2)
       picArea = picArea + binary_image(i,j);
   end
end

% Berechnung der Koordinaten des Schwerpunktes
xc = 0; 
yc = 0;

for i = 1:picSize(1)
   for j = 1 : picSize(1,2)
       xc = xc + j * binary_image(i,j);
       yc = yc + i * binary_image(i,j);
   end
end

xc = xc / picArea;
yc = yc / picArea;