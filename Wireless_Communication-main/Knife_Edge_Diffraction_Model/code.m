close all;
clear all;
clc;
%exact equation og Gd
nu = -5:5
ind = 0;
for vmuer=-5:5
ind = ind+1;
intfe = quad('exp((-j*pi*x.^2)/2)',vmuer,20);
fe = abs((0.5+0.5*j)*intfe)
gdb_e(ind)= 20*log10(fe)
end
plot(nu,gdb_e,'r');
gtext('Exact')
xlabel('Exact Fresnel Diffraction Parameter')
ylabel('Diffraction Loss (dB)')
hold on
v=-5:0.01:5;
for n=1:length(v)
if v(n) <= -1
G(n)=0;
elseif v(n) <= 0
G(n)=20*log10(0.5-0.62*v(n));
elseif v(n) <= 1
G(n)=20*log10(0.5*exp(-0.95*v(n)));
elseif v(n) <= 2.4
G(n)=20*log10(0.4-sqrt(0.1184-(0.38-0.1*v(n))^2));
else
G(n)=20*log10(0.225/v(n));
end
end
plot(v, G, 'b')
gtext('Approx')
xlabel('Approx Fresnel Diffraction Parameter')
ylabel('Diffraction Loss (dB)')
hold off
