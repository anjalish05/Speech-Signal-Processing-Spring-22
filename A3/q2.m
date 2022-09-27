clc; clear all; 

%% Ques-2

[y, fs] = audioread('my_name.wav');
Ts = 1/fs;

n = length(y)-1;
t = 0:Ts/n:Ts; 
f = 0:fs/n:fs;

% sound(y, fs); 
figure; 
plot(t, y); 
xlabel('time');  ylabel('y(t)'); 
title('Time Domain'); 
grid on
grid minor

y_fft = fft(y); 
y_fft_abs = abs(y_fft); 

figure; 
plot(f, y_fft_abs); 
xlabel('frequency');  ylabel('abs(fft(y(t)))'); 
title('FFT of speech signal'); 
grid on
grid minor

%%
% finding the STFT of the signal by using the in-built function 
% window used: hamming 
win = hamming(100, "periodic"); 
[y_stft] = stft(y, fs, Window = win, OverlapLength=98,FFTLength=128);
figure;
stft(y, fs, Window = win, OverlapLength=98,FFTLength=128);
M = 128; g = hamming(M,"periodic");
L = 0.75*M;
Ndft = 128;
[sp,fp,tp] = spectrogram(y,g,L,Ndft,fs,"centered");
[s,f,t] = stft(y,fs);
figure; 
subplot(2,1,1)
mesh(tp,fp,abs(sp).^2)
title("spectrogram")
view(2), axis tight
subplot(2,1,2)
mesh(t,f,abs(s).^2)
title("stft")
view(2), axis tight

%% MFCC of the signal using in-built function

y_coeff = mfcc(y, fs); 

n_coeff = size(y_coeff, 1); 
coeff = y_coeff(:, 1: 13); 
for i = 1:10:val
    figure; 
    stem(coeff(i, 1:13)); 
    xlabel('MFCC Coeff'); 
    ylabel('Value of MFCC coeff'); 
end
    



