clc; 
clear all; 

%% Ques-4
[y1, fs1] = audioread('lataji_nrm.wav'); 
[y2, fs2] = audioread('lataji_sng.wav'); 

%% (a)
% for 'lataji_nrm.wav'
Ts1 = 1/fs1; 
n1 = length(y1)-1; 
t1 = 0:Ts1/n1:Ts1;
% sound(y1, fs1); 

% for 'lataji_sng.wav'
Ts2 = 1/fs2; 
n2 = length(y2)-1; 
t2 = 0:Ts2/n2:Ts2;
% sound(y2, fs2);

% time-domain plots 
figure;
subplot(2, 1, 1); 
plot(t1, y1); 
xlabel('time');  ylabel('lataji_{nrm}.wav Signal'); 
subplot(2, 1, 2); 
plot(t2, y2); 
xlabel('time'); ylabel('lataji_{sng}.wav Signal'); 
sgtitle('Speech Signal'); 

%% (b) Pitch Contour 
% Pith contour of a sound is a function/curve that tracks the perceived
% pitch of sound over time. 
% f0_1 = pitch(y1, fs1); % returns estimates of fundamental frequency over time for audio input

% finding the spectrogram
[s1, f1, t1, ps1] = spectrogram(y1, fs1);
[s2, f2, t2, ps2] = spectrogram(y2, fs2); 

figure; 
subplot(2, 1, 1); 
plot(f1, 10*log10(ps1)); 
xlabel('frequency(Hz)'); ylabel('Energy'); 
title('lataji_{nrm}.wav Signal');
subplot(2, 1, 2); 
plot(f2, 10*log10(ps2)); 
xlabel('frequency(Hz)'); ylabel('Energy'); 
title('lataji_{sng}.wav Signal');
sgtitle('Spectrogram'); 


[f1,idx1] = pitch(y1,0.3*fs); 
[f2, idx2] = pitch(y2, 0.3*fs); 

figure;
subplot(2,1,1)
plot(idx1, f1);
ylabel('Pitch n (Hz)'); 
xlabel('Sample Number n');
plot(idx2, f2); 
ylabel('Pitch n (Hz)'); 
xlabel('Sample Number n');
sgtitle('Pitch Contour');

