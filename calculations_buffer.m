clear all;
close all;
clc;

%% parameters SSEC
Vcc = 10; %[volt]
Rb1 = 120e3; %[ohm]
Rb2 = 120e3; %[ohm]
Re = 4.1e3; %[ohm]
Ic =1e-3; %[A] large signal
alpha =110; %[unitless]


%% Derived from large signal

gm = 40 * Ic; %[A/V]

Ib = Ic/alpha; %[A] large signal
Ibiasresistors = Vcc/(Rb1 + Rb2); %[A] largesignal
Ratio_Ib_Ibiasres = Ibiasresistors/Ib %[unitless]
Rb1Rb2_par = (Rb1*Rb2)/(Rb1+Rb2); % [Ohm]


%% derived small signal
v_in = 1; %[V]



%% Revelent equations small signal
v_in = 1;

H = (gm*((alpha +1 )/(alpha))*Re)/(1+gm*((alpha+1)/(alpha))*Re)
v_be = (v_in)/(1+Re*gm+Re*(gm/alpha));
i_in = v_in/Rb1Rb2_par + v_be/(alpha/gm);


r_in = v_in/i_in

%% Rout assume v_in =0 force v_out
v_out = 1;
v_in = 0;
v_be = v_in - v_out;
i_out = -v_be*gm -(v_in-v_out)/(alpha/gm)+v_out/Re;
r_out = v_out/i_out


