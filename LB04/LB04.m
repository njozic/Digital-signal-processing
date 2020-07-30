clear;
Gs = tf(1,[1 2 4]);

Fs = 10; %Hz
Gz = c2d(Gs,1/Fs,'tustin');

subplot(3,2,1);
impulse(Gs);
hold on;
impulse(Gz);
hold off;
title('Impulse response');

subplot(3,2,2);
step(Gs);
hold on;
step(Gz);
hold off;
title('Step response');

subplot(3,2,3);
pzmap(Gs);
title('Cont. Pole zero map');

subplot(3,2,4)
pzmap(Gz);
title('Discrete pole zero map');

subplot(3,2,5);
bode(Gs);
title('Cont. Bode diagram');

subplot(3,2,6);
bode(Gz);
title('Discrete Bode diagram');