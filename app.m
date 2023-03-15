clc
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To load filters in workspace %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cd 'project location'        %
% load('filters.mat')          % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('filters.mat');

%get wave file
[file,path] = uigetfile('*.wav');
info = audioinfo(file);
[x,Fs] = audioread(file);
%gain for each band
gain = [];
g = inputdlg({'Enter the gain for 0-170 Hz band (in db)','Enter the gain for 170-310 Hz band (in db)','Enter the gain for 310-600 Hz band (in db)','Enter the gain for 600-1000 Hz band (in db)','Enter the gain for 1-3 KHz band (in db)','Enter the gain for 3-6 KHz band (in db)','Enter the gain for 6-12 KHz band (in db)','Enter the gain for 12-14 KHz band (in db)','Enter the gain for 14-16 KHz band (in db)'},...
              'Amplification and Attenuation',[1 55]);
for i = 1:9
    gain = [gain str2double(g{i})];
end

%type of filter
index = listdlg('PromptString',{'Choose the type of filters'},...
    'SelectionMode','single','ListString',{'IIR','FIR'});

if index == 1
    type = 'IIR';
else type = 'FIR';
end

Os = str2double(inputdlg({'Enter output sampling rate (in Hz)'})); %output sample rate
 
% Analysis function
% analyze('IIR');

if type == 'IIR'
    y1=filter(iir170,x);
    analyseFilter(y1,x,info,'0-170 Hz IIR Filter');
    y1 = y1 .* db2mag(gain(1));
    
    y2=filter(iir170310,x);
    analyseFilter(y2,x,info,'170-310 Hz IIR Filter');
    y2 = y2 .* db2mag(gain(2));
    
    y3=filter(iir310600,x);
    analyseFilter(y3,x,info,'310-600 Hz IIR Filter');
    y3 = y3 .* db2mag(gain(3));
   
    y4=filter(iir6001000,x);
    analyseFilter(y4,x,info,'600-1000 Hz IIR Filter');
    y4 = y4 .* db2mag(gain(4));
    
    y5=filter(iir13k,x);
    analyseFilter(y5,x,info,'1-3 KHz IIR Filter');
    y5 = y5 .* db2mag(gain(5));
    
    y6=filter(iir36k,x);
    analyseFilter(y6,x,info,'3-6 KHz IIR Filter');
    y6 = y6 .* db2mag(gain(6));
    
    y7=filter(iir612k,x);
    analyseFilter(y7,x,info,'6-12 KHz IIR Filter');
    y7 = y7 .* db2mag(gain(7));
    
    y8=filter(iir1214k,x);
    analyseFilter(y8,x,info,'12-14 KHz IIR Filter');
    y8 = y8 .* db2mag(gain(8));
    
    y9=filter(iir1416k,x);
    analyseFilter(y9,x,info,'14-16 KHz IIR Filter');
    y9 = y9 .* db2mag(gain(9));

else
    y1=filter(fir170,x);
    analyseFilter(y1,x,info,'0-170 Hz FIR Filter');
    y1 = y1 .* db2mag(gain(1));
    
    y2=filter(fir170310,x);
    analyseFilter(y2,x,info,'170-310 Hz FIR Filter');
    y2 = y2 .* db2mag(gain(2));
    
    y3=filter(fir310600,x);
    analyseFilter(y3,x,info,'310-600 Hz FIR Filter');
    y3 = y3 .* db2mag(gain(3));
   
    y4=filter(fir6001000,x);
    analyseFilter(y4,x,info,'600-1000 Hz FIR Filter');
    y4 = y4 .* db2mag(gain(4));
    
    y5=filter(fir13k,x);
    analyseFilter(y5,x,info,'1-3 KHz FIR Filter');
    y5 = y5 .* db2mag(gain(5));
    
    y6=filter(fir36k,x);
    analyseFilter(y6,x,info,'3-6 KHz FIR Filter');
    y6 = y6 .* db2mag(gain(6));
    
    y7=filter(fir612k,x);
    analyseFilter(y7,x,info,'6-12 KHz FIR Filter');
    y7 = y7 .* db2mag(gain(7));
    
    y8=filter(fir1214k,x);
    analyseFilter(y8,x,info,'12-14 KHz FIR Filter');
    y8 = y8 .* db2mag(gain(8));
    
    y9=filter(fir1416k,x);
    analyseFilter(y9,x,info,'14-16 KHz FIR Filter');
    y9 = y9 .* db2mag(gain(9));
end

y = y1 + y2 + y3 + y4 + y5 + y6 + y7 + y8 + y9;
% output of composite
idx = 1:info.TotalSamples;
t = (idx-1)./Os;
Fvec = linspace(-Os/2,Os/2,length(t));
Y = fftshift(fft(y));
    
figure('name','Composite Signal');
subplot(3,2,[1 2]);
plot(t,x);grid;
title('Original Signal (Time domain)');
xlabel('Time (seconds)');
ylabel('x(t)');

subplot(3,2,[3 4]);
plot(t,y);grid;
title('Composite Signal (Time domain)');
xlabel('Time (seconds)');
ylabel('x(t)');

subplot(3,2,5);
plot(Fvec,abs(Y));grid;
title('Magnitude spectrum');
xlabel('Frequency (Hz)');
ylabel('|Y(\omega)|');
xlim([-3,3]);

subplot(3,2,6);
plot(Fvec,angle(Y).*180/pi);grid;
title('Phase spectrum');
xlabel('Frequency (Hz)');
ylabel('Phase (degree)');
xlim([-3,3]);

% sound(y,Os);
audiowrite('composite.wav',x,Os);



% Doubling Fs
fs = Os*2;
idx = 1:info.TotalSamples;
t = (idx-1)./fs;
Fvec = linspace(-fs/2,fs/2,length(t));
Y = fftshift(fft(y));
    
figure('name','Double Sampling');
subplot(3,2,[1 2]);
plot(t,x);grid;
title('Original Signal (Time domain)');
xlabel('Time (seconds)');
ylabel('x(t)');

subplot(3,2,[3 4]);
plot(t,y);grid;
title('Composite Signal (Time domain)');
xlabel('Time (seconds)');
ylabel('x(t)');

subplot(3,2,5);
plot(Fvec,abs(Y));grid;
title('Magnitude spectrum');
xlabel('Frequency (Hz)');
ylabel('|Y(\omega)|');
xlim([-3,3]);

subplot(3,2,6);
plot(Fvec,angle(Y).*180/pi);grid;
title('Phase spectrum');
xlabel('Frequency (Hz)');
ylabel('Phase (degree)');
xlim([-3,3]);

% Decreasing Fs to half
fs = Os/2;
idx = 1:info.TotalSamples;
t = (idx-1)./fs;
Fvec = linspace(-fs/2,fs/2,length(t));
Y = fftshift(fft(y));
    
figure('name','Half sampling');
subplot(3,2,[1 2]);
plot(t,x);grid;
title('Original Signal (Time domain)');
xlabel('Time (seconds)');
ylabel('x(t)');

subplot(3,2,[3 4]);
plot(t,y);grid;
title('Composite Signal (Time domain)');
xlabel('Time (seconds)');
ylabel('x(t)');

subplot(3,2,5);
plot(Fvec,abs(Y));grid;
title('Magnitude spectrum');
xlabel('Frequency (Hz)');
ylabel('|Y(\omega)|');
xlim([-3,3]);

subplot(3,2,6);
plot(Fvec,angle(Y).*180/pi);grid;
title('Phase spectrum');
xlabel('Frequency (Hz)');
ylabel('Phase (degree)');
xlim([-3,3]);



 
% filtered signals analysis
function analyseFilter(y,x,info,name)
    Fs = info.SampleRate;
    idx = 1:info.TotalSamples;
    t = (idx-1)./Fs;
    Fvec = linspace(-Fs/2,Fs/2,length(t));
    Y = fftshift(fft(y));
    
    figure('name',name);
    subplot(3,2,[1 2]);
    plot(t,x);grid;
    title('Original Signal (Time domain)');
    xlabel('Time (seconds)');
    ylabel('x(t)');
    
    subplot(3,2,3);
    plot(t,y);grid;
    title('Filtered Signal (Time domain)');
    xlabel('Time (seconds)');
    ylabel('y(t)');
    
    subplot(3,2,4);
    plot(Fvec,Y);grid;
    title('Filtered Signal (Frequency domain)');
    xlabel('Frequency (Hz)');
    ylabel('Y(\omega)');
    
    subplot(3,2,5);
    plot(Fvec,abs(Y));grid;
    title('Magnitude spectrum');
    xlabel('Frequency (Hz)');
    ylabel('|Y(\omega)|');
    xlim([-3,3]);
    
    subplot(3,2,6);
    plot(Fvec,angle(Y).*180/pi);grid;
    title('Phase spectrum');
    xlabel('Frequency (Hz)');
    ylabel('Phase (degree)');
    xlim([-3,3]);
end

    
% filters' analysis function
function analyze(type)
    load('filters.mat');
    
    if type == 'IIR'
        % IIR Analysis
        % 0-170 Hz band
        analysis(iir170,'4-th order 0-170 Hz BPF');

        % 170-310 Hz band
        analysis(iir170310,'4-th order 170-310 Hz BPF');

        % 310-600 Hz band
        analysis(iir310600,'4-th order 310-600 Hz BPF');

        % 600-1000 Hz band
        analysis(iir6001000,'4-th order 600-1000 Hz BPF');

        % 1-3 KHz band
        analysis(iir13k,'4-th order 1-3 KHz BPF');

        % 3-6 KHz band
        analysis(iir36k,'4-th order 3-6 KHz BPF');

        % 6-12 KHz band
        analysis(iir612k,'4-th order 6-12 KHz BPF');

        % 12-14 KHz band
        analysis(iir1214k,'4-th order 12-14 KHz BPF');

        % 14-16 KHz band
        analysis(iir1416k,'4-th order 14-16 KHz BPF');
        
    else
        
        % FIR Analysis
        % 0-170 Hz band
        analysis(fir170,'800-th order 0-170 Hz BPF');

        % 170-310 Hz band
        analysis(fir170310,'800-th order 170-310 Hz BPF');

        % 310-600 Hz band
        analysis(fir310600,'800-th order 310-600 Hz BPF');

        % 600-1000 Hz band
        analysis(fir6001000,'800-th order 600-1000 Hz BPF');

        % 1-3 KHz band
        analysis(fir13k,'800-th order 1-3 KHz BPF');

        % 3-6 KHz band
        analysis(fir36k,'800-th order 3-6 KHz BPF');

        % 6-12 KHz band
        analysis(fir612k,'800-th order 6-12 KHz BPF');

        % 12-14 KHz band
        analysis(fir1214k,'800-th order 12-14 KHz BPF');

        % 14-16 KHz band
        analysis(fir1416k,'800-th order 14-16 KHz BPF');
    end
end

function analysis(filter,name)
    figure('name',name);
   
    [H,wh] = freqz(filter);
    subplot(4,2,1);
    plot(wh/pi,abs(H));grid;
    title('Magnitude response');
    xlabel('Normalized frequency (\times\pi rad/samples)');
    ylabel('Magnitude');
    
    [P,wp] = phasez(filter);
    subplot(4,2,2);
    plot(wp/pi,P.*180/pi);grid;
    title('Phase response');
    xlabel('Normalized frequency (\times\pi rad/samples)');
    ylabel('Phase (Degrees)');
   
    [h,nh] = impz(filter);
    subplot(4,2,[3 4]);
    stem(nh,h);grid;
    title('Impulse response');
    xlabel('Samples');
    ylabel('Amplitude');
    
    [s,ns] = stepz(filter);
    subplot(4,2,[5 6]);
    stem(ns,s);grid;
    title('Step response');
    xlabel('Samples');
    ylabel('Amplitude');
   
    subplot(4,2,[7 8]);
    [b,a] = tf(filter);
    zplane(b,a);grid;
    title('Pole-Zero plot');
    
end
