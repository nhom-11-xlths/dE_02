[x, fs] = audioread('a.wav');
N = length(x);
w = hamming(1024);
w_length = length(w);
step = w_length/4;
K = fix((N-w_length + step)/step);
%k = fix( N/w_length);
N2 = 4096/2 + 1;
N3 = ceil((1+4096)/2);
time = (1:w_length)';
S=zeros(N2,K); 
NFFT = 4096;
t = x(time);
for k=0:K-1
    xw=x(1+k*step:w_length+k*step).*w; 
    X=fft(xw,NFFT); 
    X1=X(1:N2); 
    %S(k,1:N2)=X1.*conj(X1); 
    S(:,1+k) = X(1:N2);
end



