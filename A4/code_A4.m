close all; clear all; 
clc;
% Q1, Q2
%% 
[y, fs] = audioread ("arctic_a0025.wav") ; 
audio = y(:, 1);
egg = y(:, 2); 
ts = 1/fs;
n = length(y); 
time_axis = 0:ts:(n-1)*ts; 

%%

figure;
subplot(2, 1, 1);
plot(y(:, 1)); 
title("Speech Signal");
xlabel('time'); ylabel('y(t)'); 
subplot(2, 1, 2);
plot(y(:, 2)); 
xlabel('time'); 
title("Electro Glotto Graph Signal") ;
% sound(y); 

%% pre-emphasis

emph = diff([0; audio]); 
% integration 
integ = cumsum(cumsum(emph)) ; 

figure;
subplot(2, 1, 1); 
plot(emph); 
title("Pre-emphasized Signal"); 

subplot(2, 1, 2); 
plot(integ); 
title("Integrated Signal after Emphasizing");

%%
% fs is 32000 Hz
% let the averaging interval be around 10 ms


n_samples = fs*10/1000  ;
meaned = smoothdata (integ, "movmean", n_samples) ; 

diff_egg = diff([0; egg]) ; 

figure;
subplot(4, 1, 1);
plot (time_axis, integ) ; 
title("Integrated");

subplot(4, 1, 2) ; 
plot (time_axis,  meaned) ; 
title("Mean Smoothed") ; 

subplot(4, 1, 3) ; 
plot(time_axis, (integ-meaned)); 
% xlim ( [1, 1.2]) ; 
% xlim ( [2.3 , 2.7 ] * 10^4) ; 
title("Integrated - Mean");

subplot(4, 1, 4); 
plot(time_axis, diff_egg); 
title("Differenced Electro Glotto Graph Signal");
ylim( [-0.05 ,0.05]); 
% xlim ( [1, 1.2]) ; 
% xlim ( [2.3 , 2.7 ] * 10^4) ;