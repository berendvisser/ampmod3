clear all;
close all;
clc;

%% parameters SSEC
Vcc = 10; %[volt]
Rb1 = 500e3; %[ohm]
Rb2 = 100e3; %[ohm]
Re = 1e3; %[ohm]
Ic =0.961e-3; %[A] large signal
Afe1 =1; %[unitless]
Afe2 = 1;
Ro1 = 1;
Ro2 = 1;


%% Derived from large signal

gm = 40 * Ic; %[A/V]

Ib = Ic/alpha; %[A] large signal
Ibiasresistors = Vcc/(Rb1 + Rb2); %[A] largesignal
Ratio_Ib_Ibiasres = Ibiasresistors/Ib %[unitless]
Rb1Rb2_par = (Rb1*Rb2)/(Rb1+Rb2); % [Ohm]
Ro1Ro2_par = (Ro1*Ro2)/(Ro1+Ro2);
Afe1Afe2_par = (Afe1*Afe2)/(Afe1+Afe2);


%% derived small signal
v_in = 1; %[V]



%% Revelent equations small signal
v_in = 1;

v_out = (Ro1Ro2_par*gm*(2+Afe1Afe2_par^-1)/((Ro1Ro2_par*gm*(2+Afe1Afe2_par^-1)+1);

H = v_out/v_in;

i_in = v_in/Rb1Rb2_par + v_be/(alpha/gm);


r_in = v_in/i_in

%% Rout assume v_in =0 force v_out
v_out = 1;
v_in = 0;
v_be = v_in - v_out;
i_out = -v_be*gm -(v_in-v_out)/(alpha/gm)+v_out/Re;
r_out = v_out/i_out


