


clc;
close all;
clear all;

% 
binary_image = imread('img/Bild11_U.bmp');
neighbors = 4;

% check for all shapes for holes 
B = bwboundaries(binary_image,neighbors);

fig1 = figure;
hold on

for k = 1:length(B)
   boundary = B{k};
 % convert boundary in complex numbers
   boundary_complex = complex(B{k}(:,1),B{k}(:,2));
 %  freemanCodeBoundary(k) = freemancc(B{k});
   subplot(1,2,2);
   plot(boundary(:,2), boundary(:,1), 'k', 'LineWidth', 2)
end

hold off

subplot(1,2,1)
imshow(binary_image)

% find exponent p for 2^p number larger then vector length
p = nextpow2(length(boundary_complex));

% 
boundary_transform = fft(boundary_complex,2^p)

boundary_i_transform = ifft(boundary_transform,1)

