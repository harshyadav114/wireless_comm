close all;
clear all;
clc;
L=input("Enter Number of Paths: ");
Delays=input("Enter Delays of Paths: "); %Delays
in usec
Gains=input("Enter Gains of Paths: "); %Gains in
dB
L=4;
%Convert Gains to linear
for i=1:L
gain_l(i)=10^(Gains(i)/10);
end
TGain=sum(gain_l);
%Delay Spread
Delay_Spread= Delays(end)-Delays(1);
%Calculating Mean Delay
MeanDelay=0;
for i=1:L
MeanDelay=MeanDelay + (gain_l(i).*Delays(i));
end
MeanDelay=MeanDelay/TGain;
%RMS Delay
Delay_RMS=zeros(1,L);
for i=1:L
Delay_RMS(i)= gain_l(i).*(MeanDelay-Delays(i))^2;
end
Delay_RMS=sqrt(sum(Delay_RMS)/TGain);
%PDP plot
stem(Delays,Gains,'linewidth',2);
title("PDP");
xlabel("Delay (in usec)");ylabel("Gain (in dB)");
disp("Delay Spread: ");
disp(Delay_Spread);
disp("Mean Delay: ");
disp(MeanDelay);

disp("RMS Delay: ");
disp(Delay_RMS);
