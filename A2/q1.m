clc; clear all;
%% Ques - 1

%% (a)
 
[y, Fs] = audioread('H_MKB.wav'); 
Ts = 1/Fs; 
% sound(y, Fs); 
n = length(y)-1;
t = 0:Ts/n:Ts;  

figure; 
plot(t, y); 
xlabel('time');  ylabel('Speech Signal'); 

%% (b)

frame_duration = 1; 
window_length = round(Fs*frame_duration); % size of frame
n = length(y); 
num_frames = floor(n/window_length); 
 
% frame_duration: time for which the frame is taken 
% window_length = no. of samples in each frame

Frame_No = framing(y, window_length, num_frames);

% Plots of all the frames of the signal
for i=1:num_frames
    figure;
    plot(Frame_No(:, i));
    xlabel('time'); ylabel('frame signal')
 
end


%% (c)
% from the function, framing(y, window_length, frame_duration);
% The one with maximum energy 
% we can find the voiced frame among all other frames

energy_n = zeros(num_frames, 1);
for k = 0:num_frames - 1
    for n = 0:(window_length - 1)
        a1= energy_n(k+1,1);
        a2= Frame_No(n+1,k+1);
        a3= conj(Frame_No(n+1, k+1));
        energy_n(k+1,1) = a1 + a2*a3;
    end
    if (k == num_frames-1)
        energy_n(k+1, 1) = energy_n(k+1, 1)/(length(y)-(window_length*k) );
    else
        energy_n(k+1, 1) = energy_n(k+1, 1)/window_length;
    end
end

% finding the maximum energy for voiced 
voiced_en = max(energy_n);
% locating the frame number/index of the max energy frame
which_voiced = find(energy_n == voiced_en);
% plotting the voiced frame
voiced = transpose(Frame_No(:,which_voiced)); 
plot( t( ((which_voiced-1)*window_length)+1: (which_voiced)*window_length ) , voiced);
xlabel('time'); ylabel('frame signal'); 
title('voiced part'); 


%% (d) Fourier Transform of voice frame 

f = 0:Fs/n:Fs; 
% finding fft of voiced frame
% taking abs to find the overall magnitude since complex values are also
% present

voiced_fft_func = fft(voiced); 
voiced_fft = abs(fft(voiced)); 

figure; 
plot(f, voiced_fft); 
xlabel('frequency'); ylabel('fft_{voiced}'); 
title('Fourier Transform'); 

%% (e) log of fft of voiced frame

log_func = log(voiced_fft_func);
log_fft = log(voiced_fft); 
figure; 
plot(f, log_fft); 
xlabel('frequency'); ylabel('log_{fft}'); 
title('log of Fourier Transform'); 

%% (f) exponential operation for step (e) 

exp_func = exp(log_func);
exp_log_fft = exp(log_fft); 

figure; 
plot(f, exp_log_fft); 
xlabel('frequency'); ylabel('exp of log of fft'); 
title('exponential of log of Fourier Transform'); 


%% (g) Inverse fourier transform of step (f)

ifft_func = abs(ifft(exp_func)); 

figure; 
plot(f, ifft_func); 
xlabel('frequency'); ylabel('ifft of exp of log of fft'); 
title('ifft of exponential of log of Fourier Transform'); 

