% Date      :   2017-12-08
% Author    :   Niko Jozic
% Course    :   AISE-M DSP1
%
% Algorithm based on following literature:
% ----------------------------------------
% <e.g.> Welch, P. D. (1967). The use of fast Fourier transform for the 
% estimation of power spectra: A method based on time averaging over short,
% modified periodograms. IEEE Transactions on audio and electroacoustics, 
% 15(2), 70-73

function [pxx] = mywelch(x,f_axis)
len = floor(length(x)/10);         
n = length(f_axis)*2;
steps = ((length(x)-len/2)/(len/2));
window = hamming(len)';
v = zeros(1,n);  

for i=0:steps-1
    next = len/2*i+1;                          
    Y = fft(x(next:next+len-1).*window,n);
    v = v+abs(Y).^2;                                
end

% Amplitude-Correction
amplitude = len*steps*sum(window.^2);     
v = (v/amplitude);

% return singlesided spectrum
pxx = v(1:length(f_axis)); 
end
    
    

