clc; clear all; 

%% Ques-4

[y, fs] = audioread('my_name.wav'); 
Ts = 1/fs;
n = length(y)-1;
t = 0:Ts/n:Ts; 
f = 0:fs/n:fs;

figure; 
plot(t, y); 
xlabel('time'); ylabel('y(t)'); 
title('Time Domain'); 

snr_before = snr(y); 

[s_new, g, tt, f_new, z] = v_specsub(y, fs); 
snr_after = snr(s_new); 

n_new = length(s_new)-1; 
t_new = 0:Ts/n_new:Ts; 

figure; 
plot(t_new, s_new); 
xlabel('time'); ylabel('s_new(t)'); 
title('Audio Signal after Spectral Subtraction'); 

