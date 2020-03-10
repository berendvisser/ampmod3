clear all;
close all;


%% parameters SSEC
Vcc = 10; %[volt]
Rb1 = 50.6e3; %[ohm]
Rb2 = 10e3; %[ohm]
Re = 1e3; %[ohm]
Rc = 5e3; %[ohm]
Rx =100; %[ohm]
Ic =0.961e-3; %[A] large signal
alpha =100; %[unitless]


%% Derived from large signal

gm = 40 * Ic; %[A/V]

Ib = Ic/alpha; %[A] large signal
Ibiasresistors = Vcc/(Rb1 + Rb2); %[A] largesignal
Ratio_Ib_Ibiasres = Ibiasresistors/Ib; %[unitless]
Rb1Rb2_par = (Rb1*Rb2)/(Rb1+Rb2); % [Ohm]
ReRx_par = (Re*Rx)/(Re+Rx); %[Ohm]

%% derived small signal
Vin = 1; %[V]

%Vbe = 

%% Revelent equations small signal
H = (-Rc*gm)/(1+gm*ReRx_par*((alpha+1)/(alpha)));


