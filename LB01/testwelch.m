% Date      :   2017-12-18
% Author    :   Niko Jozic
% Course    :   AISE-M DSP1
%
% Algorithm based on following literature:
% ----------------------------------------
% <e.g.> Welch, P. D. (1967). The use of fast Fourier transform for the 
% estimation of power spectra: A method based on time averaging over short,
% modified periodograms. IEEE Transactions on audio and electroacoustics, 
% 15(2), 70-73

close, clear, clc, format compact;

f = 10;
w = 2*pi*f;
fs = 6*w;
dt = 1/fs;
l = 5;
t = 0:dt:l;
A = 0.5;
x = A*sin(w*t)+A*sin(3*w*t)+A*sin(2*w*t);
X = fft(x);

N = length(t);
f_axis = (0:N-1)/N*fs/2;

subplot(2,2,[1,2])
plot(t,x);
title({'The Signal'});
xlabel('Time (s)');
ylabel('f(t)');
axis([0 0.4 -2 2]);
grid on;

subplot(2,2,3)
window = hamming(floor(length(t)/10))';
[pxx,f_axis]= pwelch(x,window,[],f_axis,fs);
plot(f_axis,pow2db(pxx));
title({'Welchs Method','by Matlab'});
xlabel('Frequency (Hz)');
ylabel('Magnitude (db)');
grid on;

subplot(2,2,4)
plot(f_axis,pow2db(mywelch(x,f_axis)));
title({'Welchs Method','by Niko Jozic'});
xlabel('Frequency (Hz)');
ylabel('Magnitude (db)');
grid on;
