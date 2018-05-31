


clc;
close all;
clear all;

% read binary image
binary_image = imread('img/Bild11_U.bmp');

% plotting original image
fig1 = figure;
subplot(2,2,1)
imshow(binary_image)
title('original')
hold on

% calculate centroid of the image
centroidImage = func_centroid(binary_image);

% coordinates of the boundary
neighbors = 4;
B = bwboundaries(binary_image,neighbors);
%B = fliplr(B);

% fillthe boundary vectors with zeros until the vector length is 2^n
diffPeriod = 2^nextpow2(length(B{1})) - length(B{1});
BlengthAdjust = cat(1,B{1},zeros(diffPeriod,2));
B{1} = BlengthAdjust;

% convert boundary pixel into a complex signal
% plotting of the boundary
for k = 1:length(B)
   boundary = B{k};
   boundary_complex = complex(B{k}(:,1),B{k}(:,2));  % convert boundary in complex numbers
 %  freemanCodeBoundary(k) = freemancc(B{k});
   subplot(2,2,2);
   plot(boundary(1:end,2), boundary(1:end,1), 'k', 'LineWidth', 2)
end
title('contur')
hold off


% find exponent p for 2^p number larger then vector length
p = nextpow2(length(boundary_complex));
 p = p + 1;   % increase the the exponent for more FFT coefficients


% FFT of the Signal
boundaryFFT = fft(boundary_complex,2^p);
%boundaryFFT(1)= -1 + 4j;
boundaryFFTnorm = boundaryFFT;
%boundaryFFT = fftshift(boundaryFFT);    % shift to center

boundaryFFTnorm = boundaryFFTnorm./boundaryFFTnorm(2); % normalise on the first fourier descriptor



% test rücktransformation
periodLen = length(boundaryFFTnorm);
numDeskrip = 5;                  % number of fourier descriptors
deskriptoren = zeros(periodLen,1); % 
absolutFFT = abs(boundaryFFTnorm); % absolute value of the transformed signal
phaseFFT = angle(boundaryFFTnorm); % phase of the transformed signal
for l = 1 : periodLen
    for k = 1 : numDeskrip
        deskriptoren(l,1) = deskriptoren(l,1) + boundaryFFTnorm(k)* exp((1j * 2* pi* l*k )/periodLen)... 
            + boundaryFFTnorm(periodLen-k)* exp((1j * 2* pi* l * (periodLen-k))/periodLen);
        
        %deskriptoren(l,1) = deskriptoren(l,1) +  absolutFFT(k) * (exp(1j*phaseFFT(k) + (2*pi*1j*l)/periodLen));
        
        %deskriptoren(l,1) = deskriptoren(l,1) +  (absolutFFT(k) * (exp(1j*phaseFFT(k) + (2*pi*1j*l*k)/periodLen)) + ...
        %    absolutFFT(periodLen-k) * (exp(1j*phaseFFT(periodLen-k) - (2*pi*1j*l*(periodLen-k))/periodLen)));
    end
   % exp iφ1 + 2πip/P 
end    

%
subplot(2,2,4)
plot(deskriptoren(:,1))
title('descriptors')

% Inverse FFT of the Signal
numFourierDeskrip = periodLen;
boundaryIfft = ifft(boundaryFFT(1:numFourierDeskrip));
fftImage(:,1) = real(boundaryIfft);
fftImage(:,2) = imag(boundaryIfft);


subplot(2,2,3)
plot(fftImage(:,1),fftImage(:,2))
title('IFFT')

