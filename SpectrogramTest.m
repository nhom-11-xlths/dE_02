clear, clc, close all
% load an audio file
[x, fs] = audioread('aeiuo_lon_data.wav'); 
% Tham sô ??u vào
L = 256; % Chi?u dài c?a s?
step = L/4; % B??c nh?y gi?a các c?a s?
NFFT = 2048;% S? ?i?m l?y FFT
win = hanning(L);
[S, f, t] = stft(x,win,step,NFFT,fs);

S=(S)';
S=S/max(max(S)); 
S = 20*log10(S);

figure(1)
surf(t, f, S)
shading interp
axis tight
view(0, 90)
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Time, s')
ylabel('Frequency, Hz')
title('Amplitude spectrogram of the signal')
hcol = colorbar;
set(hcol, 'FontName', 'Times New Roman', 'FontSize', 14)
ylabel(hcol, 'Magnitude, dB')

%colormap(1-gray); 
%colormap(jet); 
%imagesc(t,flipud(f),20*log10(S),[-100 0]);
%axis xy



