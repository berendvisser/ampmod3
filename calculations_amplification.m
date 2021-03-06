clear all;
close all;
clc;

%% parameters SSEC
Vcc = 10; %[volt]
Rb1 = 47e3; %[ohm]
Rb2 = 10e3; %[ohm]
Re = 1e3; %[ohm]
Rc = 5e3; %[ohm]
Rx =200; %[ohm]
Ic =1.06e-3; %[A] large signal
alpha =380; %[unitless]


%% Derived from large signal

gm = 40 * Ic; %[A/V]

Ib = Ic/alpha; %[A] large signal
Ibiasresistors = Vcc/(Rb1 + Rb2); %[A] largesignal
Ratio_Ib_Ibiasres = Ibiasresistors/Ib %[unitless]
Rb1Rb2_par = (Rb1*Rb2)/(Rb1+Rb2); % [Ohm]
ReRx_par = (Re*Rx)/(Re+Rx); %[Ohm]

%% derived small signal
v_in = 10; %[V]

v_be = v_in*(1/(1+gm*((alpha+1)/(alpha))*ReRx_par));


%% Revelent equations small signal\

H = (-Rc*gm)/(1+gm*ReRx_par*((alpha+1)/(alpha)))
i_in = v_in/Rb1Rb2_par + v_be/(alpha/gm);
rin = v_in/i_in

%% Rout assume v_in =0 force v_out
v_out = 1;
v_in = 0;
v_be = v_in*(1/(1+gm*((alpha+1)/(alpha))*ReRx_par));
i_out = v_out/Rc + gm*v_be;
r_out = v_out/i_out


