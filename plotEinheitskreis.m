clc


punkte = 40;

kontur = [];
for i = 1 :punkte
kontur(i) = 1 * exp(-(2*pi*1j*i)/punkte);
end

plot(kontur)
