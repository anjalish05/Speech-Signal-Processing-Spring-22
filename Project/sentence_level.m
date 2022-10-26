clear; clc; close all;

% Loading the audio file:
filename = "2238559671552745.wav";
[data,Fs] = audioread(filename);

% Basic parameters for the audio file:
info = audioinfo(filename);
audio_duration = info.Duration;
audio_length = length(data);

f0 = pitch(data, Fs);

frame_duration = 0.02;
frame_length = frame_duration*Fs;
voiced = [];
signal = data.*data;
Energy = mean(signal);
Threshold = 0.05*Energy;
k=1;
for b=1:100:(length(signal)-100)
    if((sum(signal(b:b+100)))/100 > Threshold)
                  voiced(k:k+100)=data(b:b+100);
%     else
%         voiced(k:k+100)= zeros(1,101);
    end
    k = k+100;
end
[energy,zerocrossings,num_frames]=analysis(voiced,frame_length,frame_length/2,Fs);

figure()
subplot(211)
plot(1:num_frames,energy, '.')
xlabel("Sample");ylabel("Energy")
title("Energy Countour")
subplot(212)
plot(f0,'*')
xlabel("Sample");ylabel("LP Residual")
title("Pitch Contour")

features = [max(f0), max(energy)];