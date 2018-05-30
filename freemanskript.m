clc;
close all;
clear all;

% 
binary_image = imread('Bild13_R.bmp');

dim_binary = size(binary_image);

% berechnen des Startpunktes der Kontur. Die Matrix des Bildes wird
% durchlaufen wenn ein Pixel größer null ist wird dies als Startpunkt für
% das ablaufen der Kontur genutzt.

i = 0;
k= 0;
for i = 1:dim_binary(1)
    for k = 1:dim_binary(2)
        pixel_start = binary_image(i,k);
            if pixel_start > 0
                start_index = [i,k];
            end
    end
end


% Außenkontur wird von einem Startpunkt der auf der Kontur liegen muss
% abgelaufen. Die Koordinaten des Randes werden in einem Vektor gespeichert
contour = bwtraceboundary(binary_image,start_index,'W');


% die Kontur wird mittels Freemanchain in ein Code umgewandelt
freemanchain = freemancc(contour);

fig1 = figure
subplot(1,2,1)
imshow(binary_image)
subplot(1,2,2)
plot(contour(:,2),contour(:,1),'k','LineWidth',2);

