% Date      :   2017-12-18
% Author    :   Niko Jozic
% Course    :   AISE-M DSP1

close, clear, clc, format compact;

Fs = 100;   % Sampling frequency
n = 5;      % Order
Wn = 0.1;   % Cutoff frequency

[b,a]=butter(n,Wn);
Hz_mat=filt(b,a,Fs);
[b,a]=butter(n,Wn*pi*Fs,'s');
[b,a]= bilinear(b,a,Fs);
Hz_c2d = filt(b,a,Fs);

figure('Name','Pole-Zero Map','NumberTitle','off');
hold on
pzmap(Hz_mat,'r-'); 
pzmap(Hz_c2d,'b-');
hold off;

figure('Name','Comparison','NumberTitle','off');
subplot(1,2,1);
hold on
pzmap(Hz_mat,'r-'); 
pzmap(Hz_c2d,'b-');
title('PZM left side')
axis([-1.007 -0.994 -0.01 0.01])
hold off;

subplot(1,2,2);
hold on
pzmap(Hz_mat,'r-'); 
pzmap(Hz_c2d,'b-');
title('PZM right side')
axis([0.72 0.87 -0.3 0.3])
hold off;
