


clc;
close all;
clear all;

% 
binary_image = imread('img/Bild09_B.bmp');


% check for all shapes for holes 
B = bwboundaries(binary_image,8);

fig1 = figure;
for k = 1:length(B)
   boundary = B{k};
   freemanCodeBoundary(k) = freemancc(B{k});
   subplot(2,2,2);
   title('8er Nachbarschaft')
   plot(boundary(:,2), boundary(:,1), 'k', 'LineWidth', 2)
   hold on
end
hold off

B4 = bwboundaries(binary_image,4);

for k = 1:length(B4)
   boundary = B4{k};
   freemanCodeBoundary(k) = freemancc(B4{k});
   subplot(2,2,4);
   title('4er Nachbarschaft')
   plot(boundary(:,2), boundary(:,1), 'k', 'LineWidth', 2)
   hold on
end
hold off

subplot(2,2,1)
imshow(binary_image)
title('Original')


