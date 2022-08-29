clc; 
clear all; 
%% Ques - 2
[y, fs] = audioread('chunk1.wav'); 

%% (a)
Ts = 1/fs; % sampling time period
n = length(y)-1; 
t = 0:Ts/n:Ts;

max_pitch = max(abs(y));
min_pitch = min(y);
abs_min_pitch = min(abs(y));


figure; 

plot(t, y); 
xlabel('time'); ylabel('Speech Signal'); 
title('Time Domain'); 

%% (c) Number of zero-crossing 

count = 0;

for k = 2:n
    if y(k-1)*y(k) < 0
        count = count+1; 
    end
end

disp(count);


% Count comes as 311

%% (d) frame energy 

frame_duration = 0.02; 
window_length = round(fs*frame_duration); % size of frame

num_frames = floor(n/window_length); 
 
% frame_duration: time for which the frame is taken 
% window_length = no. of samples in each frame

Frame_No = framing(y, window_length, num_frames);

energy_n = zeros(num_frames, 1);

for k = 1:num_frames
    for n1 = 1:(window_length)
        energy_n(k,1) = energy_n(k,1) + Frame_No(n1,k)*conj(Frame_No(n1, k));
    end
end


