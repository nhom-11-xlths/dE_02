clear, clc, close all
% load an audio file
[x, fs] = audioread('amto.wav'); 
% Tham sô dau vào
L = 256; % Chieu dai cua so
step = L/4; % Buoc nhay giua cac cua so
NFFT = 2048;% So diem lay FFT
win = hanning(L);
[S, f, t] = stft(x,win,step,NFFT,fs);

S=(S)';
S=S/max(max(S)); % Chuan hoa bien do
S = 20*log10(S);

figure(1)
surf(t, f, S)
shading interp
axis tight
view(0, 90)
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Thoi gian, s')
ylabel('Tan so, Hz')
title('Pho bien do cua tin hieu')
hcol = colorbar;
set(hcol, 'FontName', 'Times New Roman', 'FontSize', 14)
ylabel(hcol, 'Cuong do am, dB')




