clear all;
close all;
clc;

%% parameters SSEC
Vcc = 10; %[volt]
Rb1 = 20e3; %[ohm]
Rb2 = 20e3; %[ohm]
Vmult = 1.2;
Ic =0.1; %[A] large signal
Afe1 =4000; %[unitless]
Afe2 = 4000;
Ro1 = 10e3;
Ro2 = 10e3;


%% Derived from large signal

gm = 40 * Ic; %[A/V]

Ib1 = Ic/Afe1; %[A] large signal
Ib2 = Ic/Afe2; %[A] large signal
Ibiasresistors = Vcc/(Rb1 + Rb2); %[A] largesignal
Ratio_Ib_Ibiasres = Ibiasresistors/Ib1 %[unitless]
Rb1Rb2_par = (Rb1*Rb2)/(Rb1+Rb2); % [Ohm]
Ro1Ro2_par = (Ro1*Ro2)/(Ro1+Ro2); % [Ohm]
Afe1Afe2_par = (Afe1*Afe2)/(Afe1+Afe2); %[Dimensionless]


%% derived small signal
v_in = 1; %[V]



%% Revelent equations small signal

v_out = (Ro1Ro2_par*gm*(2+1/Afe1Afe2_par))/(Ro1Ro2_par*gm*(2+1/Afe1Afe2_par)+1);

H = v_out/v_in

v_be = v_in - v_out;

i_in = v_in/Rb1Rb2_par + v_be/(Afe1Afe2_par/gm);


r_in = v_in/i_in

%% Rout assume v_in =0 force v_out
v_out = 1;
v_in = 0;

i_out = v_out/(Afe1Afe2_par)*gm + v_out/(Ro1Ro2_par)+v_out*gm*2;
r_out = v_out/i_out


