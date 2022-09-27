clc; clear all;

%% Ques-1

[y, fs] = audioread('vowel.wav');

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

%% part-1

win = hamming(100, "periodic"); 
y_stft = stft(y, fs, Window = win, FFTLength=512);

figure; 
stft(y, fs, Window = win, FFTLength = 512);

%% part-2

win = hamming(100, "periodic"); 
y_mag = abs(y); 
y_stft = stft(y_mag, fs, Window = win, FFTLength=512);

figure; 
stft(y_mag, fs, Window = win, FFTLength = 512);


