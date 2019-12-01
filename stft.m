function [S, f, t] = stft(x, win, step, NFFT, fs)
%
% Input:
% x - Tín hi?u trên mi?n th?i gian
% win - Hàm c?a s?
% step - B??c nh?y c?a s?
% NFFT - Sô ?i?m l?y FFT
% fs - T?n s? l?y m?u, Hz
%
% Output:
% STFT - STFT-Ma tr?n (only unique points, time 
%        across columns, frequency across rows)
% f - Vector t?n s?, Hz
% t - Vector th?i gian, s
N = length(x);
L = length(win);
K = fix((N-L + step)/step); % Tính s? l??ng khung tín hi?u
N2 = NFFT/2 + 1; % Tính s? ?i?m fft duy nh?t(không l?p l?i)
S =zeros(K,N2); % Khai báo ma tr?n STFT
for k=0:K-1
    % windowing
    xw=x(1+k*step:L+k*step).*win;     
    %FFT
    X=fft(xw,NFFT); 
    X1=X(1:N2)';
    S(k+1,1:N2)=X1.*conj(X1); 
end
% Tính Vector th?i gian và t?n s?
t=(0:K-1)'*step/fs;
f=(0:NFFT/2)'*fs/NFFT;
end