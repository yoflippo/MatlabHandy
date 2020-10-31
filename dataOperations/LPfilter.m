function[smooth,res]=LPfilter(data,Fs,Fc)

% LPFILTER.M
% LPfilter(data,Fs,Fc)
% Function file for low pass filtering with zero phase-shift.
% A butterworth filter is used. Fs is sample frequency, Fc is cut-off frequency
% This function requires the signal processing toolbox which contains "filtfilt",
% "butter" and other tools.

[m,n]=size(data);
Fs=Fs./2;

[B,A]=butter(2,Fc/Fs); % 2nd order filter.

% 4th order low-pass filter, zero phase lag.
for count=1:n
   smooth(:,count) = filtfilt(B,A,data(:,count));
end

res=sqrt((1/m)*sum((data-smooth).^2));