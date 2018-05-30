clear all
close all
clc
set(0,'DefaultFigureWindowStyle','normal')

m = 256;
n = 256;
im = zeros(m,n);

for row = 1:m
    for column = 1 :n
        im(row,column) = cos(((50*pi)/256)*row) *cos(((18*pi)/256)*column);
    end
end
fig1 = figure
imshow(im)

Y = fft2(im);

fig2 = figure
imfft = imshow(abs(fftshift(Y)))
