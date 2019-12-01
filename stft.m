function [S, f, t] = stft(x, win, step, NFFT, fs)
%
% Input:
% x - T�n hi?u tr�n mi?n th?i gian
% win - H�m c?a s?
% step - B??c nh?y c?a s?
% NFFT - S� ?i?m l?y FFT
% fs - T?n s? l?y m?u, Hz
%
% Output:
% STFT - STFT-Ma tr?n (only unique points, time 
%        across columns, frequency across rows)
% f - Vector t?n s?, Hz
% t - Vector th?i gian, s
N = length(x);
L = length(win);
K = fix((N-L + step)/step); % T�nh s? l??ng khung t�n hi?u
N2 = NFFT/2 + 1; % T�nh s? ?i?m fft duy nh?t(kh�ng l?p l?i)
S =zeros(K,N2); % Khai b�o ma tr?n STFT
for k=0:K-1
    % windowing
    xw=x(1+k*step:L+k*step).*win;     
    %FFT
    X=fft(xw,NFFT); 
    X1=X(1:N2)';
    S(k+1,1:N2)=X1.*conj(X1); 
end
% T�nh Vector th?i gian v� t?n s?
t=(0:K-1)'*step/fs;
f=(0:NFFT/2)'*fs/NFFT;
end