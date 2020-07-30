function AddNoise(filename)
% AddNoise  Add simple noise to an audio file.
%   Loads an audio file using audioread, adds a simple noise vector and 
%   writes a wav file using audiowrite to the same folder.
%   The processed audio file is stored as "(filename)_noise.wav".
%   
%   AddNoise(filename) Process audio file given by parameter filename.
%
%   See also audioread, audiowrite.

A = 0.5; %Amplitude of noise
f = 1000; %Hz - Base frequency of noise

[y,Fs] = audioread(filename);
y=y(1:20*Fs,:);

t = (0:1/Fs:length(y)/Fs-1/Fs)';
noise = A*sin(2*pi*f*t);%+A*sin(2*pi*1.3*f*t)+A*sin(2*pi*1.5*f*t);

y(:,1)=y(:,1)+noise;
y(:,2)=y(:,2)+noise;

[pathstr,name,ext] = fileparts(filename);
outfilename = fullfile(pathstr, [name, '_noise', '.wav']);
audiowrite(outfilename,y,Fs);

end
