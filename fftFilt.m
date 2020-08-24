function [signalFilt] = fftFilt(signal,Fs,f_cut)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%% Definitions
% Fs=1; % sampling freq
L=length(signal); % signal length
%% main
Y=fft(signal); % perform fft transform
%% remove data from signale
frequency = Fs*(0:(L/2))/L; % hz, create frequency array (for single sided spectrum)
% f_cut = 1/500;
r = find(frequency>f_cut, 1 ); % range of frequencies we want to preserve
rectangle = zeros(size(Y));
rectangle(1:r+1) = 1;               % preserve low +ve frequencies
rectangle(end-r+1:end) = 1;         % preserve low -ve frequencies
% rectangle = abs(rectangle-1);
signalFilt = ifft(Y.*rectangle);   % full low-pass filtered signal
end

