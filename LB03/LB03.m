% Specify constants
Fs = 8; %Hz
f = 1;  %Hz
L = 10; %seconds

% Calculate signal
t = 0:1/Fs:L-1/Fs;
y = sin(2*pi*f*t);

subplot(3,2,1);
stem(t,y);
title('Original signal - Time domain');

Y = fft(y);
subplot(3,2,2);
stem(abs(Y));
title('Original signal - Two-sided spectrum');

% Up-sample signal by inserting zeros between samples
% TODO: Make variable interpolation factor. Right now static factor of 4 is used.
y_up = zeros(1,length(y)*4);
y_up(1:4:4*length(y)) = y;

subplot(3,2,3);
stem(y_up);
title('Up-sampled signal - Time domain');

subplot(3,2,4);
stem(abs(fft(y_up)));
title('Up-sampled signal - Two-sided spectrum');

% Design a low pass filter with a normalized cut-off frequency of 0.1 and order of 30.
b = fir1(30, 0.1,'low');
% Filter up-sampled signal in order to get interpolated signal. High frequency parts are filtered.
y_ip = filter(b,1,y_up); % conv(b,y_up)

subplot(3,2,5);
stem(y_ip);
title('Interpolated signal - Time domain');

