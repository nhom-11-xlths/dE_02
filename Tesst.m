% Input :
% Tin hieu lien tuc x[n]
% Ham cua so w[m] : Cua so hanning
% step : buoc nhay cua cua so window
% NFFT : so diem lay fft
% fs : tan so lay mau
%
% OUTPUT :
% 
%
%
%

[x, fs] = audioread('a.wav');
N = length(x);
L = 2048;
w = hamming(L);
step = L/4;
K = fix((N-L + step)/step);
NFFT = 4096;
N2 = NFFT/2 + 1;
S=zeros(K,N2); 
for k=0:K-1
    xw=x(1+k*step:L+k*step).*w; 
    X=fft(xw,NFFT); 
    X1=X(1:N2); 
    S(k+1,1:N2)=X1; 
end
A = abs(S');
w = (0:NFFT/2).*fs/NFFT;
t = (0:K-1).*step/NFFT;

figure(1)
surf(t, w, A)
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



