function [S, f, t] = stft(x, win, step, NFFT, fs)
%
% Input:
% x - Tín hieu tren mien thoi gian
% win - Ham cua so window
% step - Buoc nhay cua so
% NFFT - So diem lay FFT
% fs - Tan so lay mau, Hz
%
% Output:
% STFT - STFT-Ma tr?n (only unique points, time 
%        across columns, frequency across rows)
% f - Vector tan so, Hz
% t - Vector thoi gian, s
N = length(x);
L = length(win);
K = fix((N-L + step)/step); % Tính so luong khung tin hieu
N2 = NFFT/2 + 1; % Tinh so diem fft duy nhat(không lap lai)
S =zeros(K,N2); % Khai bao ma tran STFT
for k=0:K-1
    % windowing
    xw=x(1+k*step:L+k*step).*win;     
    %FFT
    X=fft(xw,NFFT); 
    X1=X(1:N2)';
    S(k+1,1:N2)=X1.*conj(X1); 
end
% Tính Vector thoi gian và tan so
t=(0:K-1)'*step/fs;
f=(0:NFFT/2)'*fs/NFFT;
end