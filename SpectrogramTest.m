clear, clc, close all
% load an audio file
[x, fs] = audioread('a.wav'); 
% Tham s� ??u v�o
L = 2048; % Chi?u d�i c?a s?
step = L/4; % B??c nh?y gi?a c�c c?a s?
NFFT = 4096;% S? ?i?m l?y FFT
win = hanning(L);
[S, f, t] = stft(x,win,step,NFFT,fs);
S=fliplr(S)';
S=S/max(max(S));
colormap(1-gray);  colormap(jet);
imagesc(t,flipud(f),20*log10(S),[-100 0]); axis xy


