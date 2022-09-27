clc; clear all; 

%% Ques-3
%% Reading audio files for voiced and unvoiced

[voiced, fs_v] = audioread('vowel.wav'); 
Ts_v = 1/fs_v;
n_v = length(voiced)-1;
t_v = 0:Ts_v/n_v:Ts_v; 
f_v = 0:fs_v/n_v:fs_v;

[unvoiced, fs_uv] = audioread('unvoiced.wav'); 
Ts_uv = 1/fs_uv;
n_uv = length(unvoiced)-1;
t_uv = 0:Ts_uv/n_uv:Ts_uv; 
f_uv = 0:fs_uv/n_uv:fs_uv;

%% Plotting the above speech signals in time domain

figure; 
subplot(2, 1, 1); 
plot(t_v, voiced); 
xlabel('time'); ylabel('voiced(t)'); 
title('Voiced'); 
% figure;
subplot(2, 1, 2); 
plot(t_uv, unvoiced); 
xlabel('time'); ylabel('unvoiced(t)'); 
title('Unvoiced');
sgtitle('Time Domain'); 

%% Finding the spectrogram for both voiced and unvoiced 

M = 512; g = hamming(M,"periodic");
L = 0.75*M;
Ndft = 128;

% finding spectrograms of the signals using the in-built functions
[sp_v,fp_v,tp_v] = spectrogram(voiced, g, L, Ndft, fs_v, "centered");
[sp_uv,fp_uv,tp_uv] = spectrogram(unvoiced, g, L, Ndft, fs_uv, "centered");

figure; 
subplot(2,1,1)
mesh(tp_v, fp_v, abs(sp_v).^2)
title("voiced")
view(2), axis tight
subplot(2,1,2)
mesh(tp_uv, fp_uv, abs(sp_uv).^2)
title("unvoiced")
view(2), axis tight
sgtitle('Spectrograms');


%% STFT of both the signals 

win = hamming(100, "periodic"); 
figure; 
stft(voiced, fs_v, Window = win, OverlapLength=98,FFTLength=512);

figure; 
stft(unvoiced, fs_uv, Window = win, OverlapLength=98,FFTLength=512);


