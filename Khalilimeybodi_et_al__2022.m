function [T,Y,yinit,param, allNames, allValues] = Khalilimeybodi_et_al__2022(argTimeSpan,argYinit,argParam)
% [T,Y,yinit,param] = Khalilimeybodi_et_al__2022(argTimeSpan,argYinit,argParam)
%
% input:
%     argTimeSpan is a vector of start and stop times (e.g. timeSpan = [0 10.0])
%     argYinit is a vector of initial conditions for the state variables (optional)
%     argParam is a vector of values for the parameters (optional)
%
% output:
%     T is the vector of times
%     Y is the vector of state variables
%     yinit is the initial conditions that were used
%     param is the parameter vector that was used
%     allNames is the output solution variable names
%     allValues is the output solution variable values corresponding to the names
%
%     example of running this file: [T,Y,yinit,param,allNames,allValues] = myMatlabFunc; <-(your main function name)


%%% Copyright (c) 2022 Ali Khalilimeybodi  %%%%

%
% Default time span
%
timeSpan = [0.0 100000.0];

% output variable lengh and names
numVars = 231;
allNames = {'LaminA';'L_GR';'CaM';'JNK';'DAG';'MST12';'PLCB_GqGTP';'Ca_Ext';'GqGTP';'LATS12_P';'Fak';'Cofilin';'GR_GqGDP';'TG';'Myo';'PP2Ac';'ROCK_S';'Ligand';'Ca_Cyt';'PLCB_Ca';'PA';'NPC_S';'G_actin';'PLCB';'AKTPP';'Pyk2';'GqGDP';'mDia_S';'Pyk2_p';'Ca_ER';'Fakp';'nPKC';'RhoAGDP';'NPC';'GR';'Buffercyt_Ca';'TGSm';'MST12P';'LIMK_S';'Buffercyt';'Arp23';'cPKC_Ca_DAG';'PLCB_Ca_GqGTP';'IP3';'CaMKII';'F_actin';'Merlin';'ROCK';'YAPTAZnuc';'LIMK';'JNK_p';'L_GR_GqGDP';'Myo_S';'AKT';'cPKC_Ca';'Merlin_S';'nPKC_DAG';'cPKC_Ca_DAG_S';'Arp23_S';'LATS12';'mDia';'aPKC';'YAPTAZc';'LaminAp';'CaMKIIP';'L_GR_GqGDP_P';'Ca_CaM';'YAPTAZcP';'TGS';'PP2Ac_S';'RhoAGTP_MEM';'CofilinP';'cPKC';'Kf_R46';'Kf_R45';'Kf_R44';'Kf_R43';'Kf_R42';'Kf_R41';'Kf_R40';'PIP2';'Kf_R39';'Kf_R38';'Kf_R36';'Kf_R34';'Kf_R32';'Kf_R28';'Kf_R26';'Kf_R22';'Kf_R20';'Kf_R1';'Kr_R1';'TGdose';'KFlux_PM_Cyto';'Kf_R6S';'J_R6S';'Kr_R58';'Kf_R58';'J_R58';'Kf_R57';'J_R57';'Kr_R56';'Kf_R56';'J_R56';'Kr_R55';'Kf_R55';'J_R55';'Vmax_R54';'J_R54';'Kr_R53';'Kf_R53';'J_R53';'Ecyt';'Kf_R52';'J_R52';'Kr_R51';'Kf_R51';'J_R51';'Vmax_R50';'Km_R50';'J_R50';'Km_R49';'Kf1_LATS';'Vmax_R49';'J_R49';'Vmax_R48';'Km_R48';'J_R48';'Vmax_R47';'Km_R47';'J_R47';'J_R46';'J_R45';'Kr_R44';'J_R44';'Kr_R43';'J_R43';'Kr_R42';'J_R42';'J_R41';'J_R40';'J_R39';'J_R38';'J_R37';'J_R36';'J_R35';'J_R34';'J_R33';'Kr_R32';'J_R32';'J_R31';'J_R30';'J_R29';'Kr_R28';'J_R28';'Vmax_R27';'J_R27';'J_R26';'Vmax_R25';'J_R25';'J_R24';'Vmax_R23';'J_R23';'J_R22';'Kr_R21';'kf_R21';'J_R21';'Kr_R20';'J_R20';'J_PMCA';'J_R19';'J_R18';'J_R17';'J_R16';'Vmax_R15';'Km_R15';'J_R15';'Vmax_R14';'Km_R14';'J_R14';'J_R13';'J_R12';'J_R11';'J_R10';'KFlux_ERM_ER';'J_TRP';'KFlux_PM_ECM';'X_Serca_flux';'J_Serca_flux';'J_PM_leak';'KFlux_ERM_Cyto';'J_IP3R';'J_R9';'J_R8';'J_R7';'J_R6';'J_R5';'J_R4';'J_R3';'J_R2';'J_R1';'KFlux_NM_Cyto';'J_ER_leak';'KFlux_NM_Nuc';'J_SOCE';'UnitFactor_uM_um3_molecules_neg_1';'X';'FakConservation';'RhoAConservation';'LIMKConservation';'YAPTAZConservation';'MyoConservation';'mDiaConservation';'ROCKConservation';'CofilinConservation';'LaminAConservation';'NPCConservation';'pyk2Conservation';'PLCBConsevation';'nPKCConservation';'MST12Conservation';'LATS12Conservation';'GRConservation';'cPKCConservation';'CaMKIIConservation';'CaMConservation';'BufferConservation';'Arp23Conservation';'AktConservation';'RhoAact';'YAPTAZratio'};

if nargin >= 1
	if length(argTimeSpan) > 0
		%
		% TimeSpan overridden by function arguments
		%
		timeSpan = argTimeSpan;
	end
end
%
% Default Initial Conditions
%
yinit = [
	0.0;		% yinit(1) is the initial condition for 'LaminA'
	0.0;		% yinit(2) is the initial condition for 'L_GR'
	6.0;		% yinit(3) is the initial condition for 'CaM'
	1.0;		% yinit(4) is the initial condition for 'JNK'
	0.463;		% yinit(5) is the initial condition for 'DAG'
	1.0;		% yinit(6) is the initial condition for 'MST12'
	0.0;		% yinit(7) is the initial condition for 'PLCB_GqGTP'
	950.0;		% yinit(8) is the initial condition for 'Ca_Ext'
	0.0;		% yinit(9) is the initial condition for 'GqGTP'
	0.0;		% yinit(10) is the initial condition for 'LATS12_P'
	1.0;		% yinit(11) is the initial condition for 'Fak'
	2.0;		% yinit(12) is the initial condition for 'Cofilin'
	1.07;		% yinit(13) is the initial condition for 'GR_GqGDP'
	0.0;		% yinit(14) is the initial condition for 'TG'
	5.0;		% yinit(15) is the initial condition for 'Myo'
	1.0;		% yinit(16) is the initial condition for 'PP2Ac'
	0.0;		% yinit(17) is the initial condition for 'ROCK_S'
	0.0;		% yinit(18) is the initial condition for 'Ligand'
	0.095;		% yinit(19) is the initial condition for 'Ca_Cyt'
	8.63;		% yinit(20) is the initial condition for 'PLCB_Ca'
	1000.0;		% yinit(21) is the initial condition for 'PA'
	0.0;		% yinit(22) is the initial condition for 'NPC_S'
	500.0;		% yinit(23) is the initial condition for 'G_actin'
	90.9;		% yinit(24) is the initial condition for 'PLCB'
	0.0;		% yinit(25) is the initial condition for 'AKTPP'
	1.0;		% yinit(26) is the initial condition for 'Pyk2'
	10000.0;		% yinit(27) is the initial condition for 'GqGDP'
	0.0;		% yinit(28) is the initial condition for 'mDia_S'
	0.0;		% yinit(29) is the initial condition for 'Pyk2_p'
	400.0;		% yinit(30) is the initial condition for 'Ca_ER'
	0.0;		% yinit(31) is the initial condition for 'Fakp'
	0.33;		% yinit(32) is the initial condition for 'nPKC'
	1.0;		% yinit(33) is the initial condition for 'RhoAGDP'
	6.5;		% yinit(34) is the initial condition for 'NPC'
	2.93;		% yinit(35) is the initial condition for 'GR'
	0.0;		% yinit(36) is the initial condition for 'Buffercyt_Ca'
	0.0;		% yinit(37) is the initial condition for 'TGSm'
	0.0;		% yinit(38) is the initial condition for 'MST12P'
	0.0;		% yinit(39) is the initial condition for 'LIMK_S'
	350.0;		% yinit(40) is the initial condition for 'Buffercyt'
	5.0;		% yinit(41) is the initial condition for 'Arp23'
	0.0;		% yinit(42) is the initial condition for 'cPKC_Ca_DAG'
	0.0;		% yinit(43) is the initial condition for 'PLCB_Ca_GqGTP'
	0.0;		% yinit(44) is the initial condition for 'IP3'
	20.0;		% yinit(45) is the initial condition for 'CaMKII'
	0.0;		% yinit(46) is the initial condition for 'F_actin'
	1.0;		% yinit(47) is the initial condition for 'Merlin'
	1.0;		% yinit(48) is the initial condition for 'ROCK'
	0.0;		% yinit(49) is the initial condition for 'YAPTAZnuc'
	2.0;		% yinit(50) is the initial condition for 'LIMK'
	0.0;		% yinit(51) is the initial condition for 'JNK_p'
	0.0;		% yinit(52) is the initial condition for 'L_GR_GqGDP'
	0.0;		% yinit(53) is the initial condition for 'Myo_S'
	0.04;		% yinit(54) is the initial condition for 'AKT'
	0.0;		% yinit(55) is the initial condition for 'cPKC_Ca'
	0.0;		% yinit(56) is the initial condition for 'Merlin_S'
	0.0;		% yinit(57) is the initial condition for 'nPKC_DAG'
	0.0;		% yinit(58) is the initial condition for 'cPKC_Ca_DAG_S'
	0.0;		% yinit(59) is the initial condition for 'Arp23_S'
	1.0;		% yinit(60) is the initial condition for 'LATS12'
	0.8;		% yinit(61) is the initial condition for 'mDia'
	0.1;		% yinit(62) is the initial condition for 'aPKC'
	1.0;		% yinit(63) is the initial condition for 'YAPTAZc'
	3500.0;		% yinit(64) is the initial condition for 'LaminAp'
	0.0;		% yinit(65) is the initial condition for 'CaMKIIP'
	0.0;		% yinit(66) is the initial condition for 'L_GR_GqGDP_P'
	0.0;		% yinit(67) is the initial condition for 'Ca_CaM'
	0.0;		% yinit(68) is the initial condition for 'YAPTAZcP'
	1.0;		% yinit(69) is the initial condition for 'TGS'
	0.0;		% yinit(70) is the initial condition for 'PP2Ac_S'
	0.0;		% yinit(71) is the initial condition for 'RhoAGTP_MEM'
	0.0;		% yinit(72) is the initial condition for 'CofilinP'
	0.57;		% yinit(73) is the initial condition for 'cPKC'
];
if nargin >= 2
	if length(argYinit) > 0
		%
		% initial conditions overridden by function arguments
		%
		yinit = argYinit;
	end
end
%
% Default Parameters
%   constants are only those "Constants" from the Math Description that are just floating point numbers (no identifiers)
%   note: constants of the form "A_init" are really initial conditions and are treated in "yinit"
%
param = [
	500.0;		% param(1) is 'G_actin_init_uM'
	1.0;		% param(2) is 'netValence_R6S'
	0.005;		% param(3) is 'kdmdia'
	1.0;		% param(4) is 'KmMSTPP2A_R48'
	4.6;		% param(5) is 'K11'
	1.0E-4;		% param(6) is 'Kf1_R22'
	0.0;		% param(7) is 'RhoAGTP_MEM_init_molecules_um_2'
	2.7E-4;		% param(8) is 'Kbas'
	0.625;		% param(9) is 'Kf_R37'
	100.0;		% param(10) is 'Clam'
	1.0;		% param(11) is 'Amp'
	0.035;		% param(12) is 'Kf_R35'
	0.015;		% param(13) is 'Kf_R33'
	20.0;		% param(14) is 'CaMKII_init_uM'
	0.008;		% param(15) is 'Kf_R31'
	0.6;		% param(16) is 'Kf_R30'
	950.0;		% param(17) is 'Ca_Ext_init_uM'
	1000.0;		% param(18) is 'PA_init_molecules_um_2'
	96485.3321;		% param(19) is 'mlabfix_F_'
	6.0E-4;		% param(20) is 'Kf_R29'
	1.0;		% param(21) is 'netValence_R56'
	1.0;		% param(22) is 'netValence_R53'
	1.0;		% param(23) is 'netValence_R52'
	350.0;		% param(24) is 'Buffercyt_init_uM'
	602.2;		% param(25) is 'unitconversionfactor'
	0.0167;		% param(26) is 'Kf_R9'
	0.042;		% param(27) is 'Kf_R8'
	0.15;		% param(28) is 'Kf_R7'
	0.0622;		% param(29) is 'Kf_R6'
	22.2;		% param(30) is 'Kf_R5'
	0.602;		% param(31) is 'Kf_R4'
	2.75E-4;		% param(32) is 'Kf_R3'
	1.0;		% param(33) is 'Kf_R2'
	1.0;		% param(34) is 'MST12_init_uM'
	350.27;		% param(35) is 'Kf_R19'
	0.0;		% param(36) is 'Fakp_init_uM'
	6.0;		% param(37) is 'Kf_R13'
	6.0;		% param(38) is 'Kf_R12'
	0.0334;		% param(39) is 'Kf_R11'
	1.0;		% param(40) is 'netValence_R40'
	0.042;		% param(41) is 'Kf_R10'
	0.01;		% param(42) is 'IP30'
	1.0;		% param(43) is 'netValence_SOCE'
	0.0;		% param(44) is 'mDia_S_init_uM'
	1.0;		% param(45) is 'netValence_R38'
	1.0;		% param(46) is 'netValence_R37'
	1.0;		% param(47) is 'netValence_R36'
	1.0;		% param(48) is 'netValence_R34'
	3.9E-4;		% param(49) is 'Kr_pyk'
	2.0;		% param(50) is 'kr_R43'
	0.0;		% param(51) is 'Voltage_ERM'
	1.0;		% param(52) is 'YAPTAZc_init_uM'
	1.0;		% param(53) is 'TGS_init_uM'
	1.0;		% param(54) is 'netValence_R19'
	1.0;		% param(55) is 'netValence_R18'
	1.0;		% param(56) is 'netValence_R15'
	1.0;		% param(57) is 'netValence_R14'
	1.0;		% param(58) is 'netValence_R13'
	1.0;		% param(59) is 'netValence_R12'
	1.0;		% param(60) is 'netValence_R11'
	1.0;		% param(61) is 'netValence_R10'
	0.0;		% param(62) is 'PLCB_GqGTP_init_molecules_um_2'
	1.0E-4;		% param(63) is 'Kf_TRP'
	1.0;		% param(64) is 'n_s'
	1000.0;		% param(65) is 'K_millivolts_per_volt'
	1.0;		% param(66) is 'K_STIM1'
	0.0;		% param(67) is 'AKTPP_init_uM'
	3500.0;		% param(68) is 'LaminAp_init_molecules_um_2'
	5.0;		% param(69) is 'Myo_init_uM'
	1.0E-4;		% param(70) is 'KfArp'
	40.0;		% param(71) is 'KflatsPP2A'
	2.0;		% param(72) is 'n_P'
	0.0167;		% param(73) is 'Kr_R9'
	1.0;		% param(74) is 'Kr_R8'
	0.0;		% param(75) is 'Kr_R7'
	0.0;		% param(76) is 'Kr_R6'
	0.0;		% param(77) is 'Kr_R5'
	9.03E-4;		% param(78) is 'Kr_R4'
	7.535;		% param(79) is 'Kr_R3'
	0.001;		% param(80) is 'Kr_R2'
	1.0;		% param(81) is 'netValence_R9'
	1.0;		% param(82) is 'netValence_R8'
	1.0;		% param(83) is 'netValence_R7'
	1.0;		% param(84) is 'netValence_R6'
	1.0;		% param(85) is 'netValence_R5'
	1.0;		% param(86) is 'netValence_R4'
	1.0;		% param(87) is 'netValence_R3'
	1.0;		% param(88) is 'netValence_R2'
	1.0;		% param(89) is 'netValence_R1'
	25000.0;		% param(90) is 'Size_ECM'
	2.8E-7;		% param(91) is 'kfNPC'
	0.5;		% param(92) is 'Km_s'
	1000.0;		% param(93) is 'Kf_CaM_R21'
	6.5;		% param(94) is 'NPC_init_molecules_um_2'
	0.0366;		% param(95) is 'Kdg_IP3'
	1.0;		% param(96) is 'netValence_TRP'
	0.8;		% param(97) is 'kdrock'
	0.2;		% param(98) is 'Km_P'
	5.0;		% param(99) is 'time_reg_P'
	230.0;		% param(100) is 'KrhoA1'
	0.00229;		% param(101) is 'Kcat_27'
	15.0;		% param(102) is 'Kcat_25'
	0.01;		% param(103) is 'PP2A'
	1.0;		% param(104) is 'ROCK_init_uM'
	0.0;		% param(105) is 'Kr_R6S'
	1.0E-6;		% param(106) is 'Kbasal_TRP'
	0.0;		% param(107) is 'MST12P_init_uM'
	1.0;		% param(108) is 'Pyk2_init_uM'
	0.0;		% param(109) is 'nPKC_DAG_init_uM'
	0.4;		% param(110) is 'Kf11LATS'
	0.449;		% param(111) is 'PP1'
	4.2;		% param(112) is 'n_so'
	0.0168;		% param(113) is 'kfkp'
	0.0;		% param(114) is 'TGSm_init_uM'
	1260.0;		% param(115) is 'Size_PM'
	9.44E-5;		% param(116) is 'Kr_R57'
	0.001;		% param(117) is 'Kr_R52'
	8.7;		% param(118) is 'krNPC'
	10.0;		% param(119) is 'KfMST'
	90.9;		% param(120) is 'PLCB_init_molecules_um_2'
	9.7549;		% param(121) is 'KIP3_2'
	0.7778;		% param(122) is 'KIP3_1'
	0.1;		% param(123) is 'Kr_R46'
	1.0;		% param(124) is 'Kr_R45'
	0.0;		% param(125) is 'Kr_R41'
	0.0;		% param(126) is 'Kr_R40'
	0.0;		% param(127) is 'Emol'
	0.095;		% param(128) is 'Ca_Cyt_init_uM'
	1.128E-6;		% param(129) is 'Kf2_R57'
	393.0;		% param(130) is 'Size_NM'
	0.0;		% param(131) is 'Kr_R39'
	0.0;		% param(132) is 'Kr_R38'
	0.0;		% param(133) is 'Kr_R37'
	0.0;		% param(134) is 'Kr_R36'
	0.0;		% param(135) is 'Kr_R35'
	0.0;		% param(136) is 'Kr_R34'
	1.0;		% param(137) is 'KmMSTPP2A'
	0.0;		% param(138) is 'Kr_R33'
	8.6348;		% param(139) is 'Kr_R31'
	0.5;		% param(140) is 'Kr_R30'
	0.1;		% param(141) is 'aPKC_init_uM'
	0.0;		% param(142) is 'LIMK_S_init_uM'
	55.49;		% param(143) is 'tau'
	20.0;		% param(144) is 'Kf2_R42'
	0.1;		% param(145) is 'Kr_R29'
	0.0;		% param(146) is 'LATS12_P_init_uM'
	0.0;		% param(147) is 'Kr_R26'
	0.0;		% param(148) is 'Kr_R22'
	1.0;		% param(149) is 'Kcat2'
	0.013;		% param(150) is 'cPKC_F_THR'
	120.0;		% param(151) is 'Kcat1'
	0.0;		% param(152) is 'Ligand_init_uM'
	4000.0;		% param(153) is 'PIP2_init_molecules_um_2'
	10000.0;		% param(154) is 'Kr_R19'
	1.0;		% param(155) is 'JNK_init_uM'
	50.0;		% param(156) is 'alpha'
	0.0;		% param(157) is 'Kr_R13'
	0.0;		% param(158) is 'Kr_R12'
	0.00334;		% param(159) is 'Kr_R11'
	1.0;		% param(160) is 'Kr_R10'
	1.0;		% param(161) is 'PP1param'
	1.0E-10;		% param(162) is 'Kact_STIM1'
	4.0;		% param(163) is 'kin2'
	1.0;		% param(164) is 'kout2'
	2.0E-4;		% param(165) is 'Kf2_R22'
	0.001660538783162726;		% param(166) is 'KMOLE'
	0.57;		% param(167) is 'cPKC_init_uM'
	10000.0;		% param(168) is 'GqGDP_init_molecules_um_2'
	1.0;		% param(169) is 'kNC'
	4.7E-4;		% param(170) is 'Kcat'
	1.9;		% param(171) is 'Vmax_Serca'
	5.0;		% param(172) is 'Kf_r1'
	1.0;		% param(173) is 'Fak_init_uM'
	100.0;		% param(174) is 'KY'
	0.0021;		% param(175) is 'kf_ERleak'
	0.0;		% param(176) is 'YAPTAZnuc_init_uM'
	0.0;		% param(177) is 'cPKC_Ca_DAG_S_init_uM'
	1.0;		% param(178) is 'netValence_PM_leak'
	3.8E-5;		% param(179) is 'KE'
	0.0;		% param(180) is 'IP3_init_uM'
	0.0;		% param(181) is 'L_GR_GqGDP_init_molecules_um_2'
	0.0;		% param(182) is 'F_actin_init_uM'
	4.0;		% param(183) is 'kfc1'
	12.5;		% param(184) is 'KMST'
	0.067;		% param(185) is 'kdmy'
	1000.0;		% param(186) is 'Kf_CaM'
	10.0;		% param(187) is 'Kd_Buffer'
	0.001;		% param(188) is 'Kf_STIM1'
	100.0;		% param(189) is 'Clamin'
	1.0;		% param(190) is 'Km_R54'
	425.0;		% param(191) is 'Size_ER'
	0.0;		% param(192) is 'PLCB_Ca_GqGTP_init_molecules_um_2'
	21.26;		% param(193) is 'Km_so'
	0.0;		% param(194) is 'YAPTAZcP_init_uM'
	0.165;		% param(195) is 'mDiaT'
	1.0;		% param(196) is 'Kj_LATS'
	1.0;		% param(197) is 'netValence_ER_leak'
	0.07;		% param(198) is 'kf1_R43'
	0.4;		% param(199) is 'kf1_R42'
	550.0;		% param(200) is 'Size_Nuc'
	1.0;		% param(201) is 'netValence_Serca_flux'
	0.0;		% param(202) is 'LaminA_init_molecules_um_2'
	0.0011;		% param(203) is 'Km_R27'
	3.0;		% param(204) is 'Km_R25'
	0.067;		% param(205) is 'Km_R23'
	4.0;		% param(206) is 'kmCof'
	1.0;		% param(207) is 'netValence_PMCA'
	0.0;		% param(208) is 'L_GR_init_molecules_um_2'
	0.06;		% param(209) is 'Kflam'
	1.0;		% param(210) is 'PP2Ac_init_uM'
	0.41;		% param(211) is 'TGS1'
	10.0;		% param(212) is 'v1'
	0.4;		% param(213) is 'TGS0'
	0.2;		% param(214) is 'kCY1'
	0.3;		% param(215) is 'ROCKT'
	0.01;		% param(216) is 'KfMerlin'
	6.0;		% param(217) is 'CaM_init_uM'
	7.6E-6;		% param(218) is 'kCY'
	0.0;		% param(219) is 'kCN'
	0.0055;		% param(220) is 'Kdg_DAG'
	1.0;		% param(221) is 'KmlatsPP2A'
	0.379;		% param(222) is 'ksf'
	0.0;		% param(223) is 'cPKC_Ca_DAG_init_uM'
	0.8;		% param(224) is 'mDia_init_uM'
	0.0;		% param(225) is 'GqGTP_init_molecules_um_2'
	2300.0;		% param(226) is 'Size_Cyto'
	10.0;		% param(227) is 'Kcat_R14'
	3.141592653589793;		% param(228) is 'mlabfix_PI_'
	0.648;		% param(229) is 'krp'
	6.02214179E11;		% param(230) is 'mlabfix_N_pmol_'
	0.0;		% param(231) is 'Merlin_S_init_uM'
	3.5;		% param(232) is 'kdep'
	0.4;		% param(233) is 'kra'
	1.0;		% param(234) is 'Merlin_init_uM'
	0.04;		% param(235) is 'kturnover'
	0.6;		% param(236) is 'Y_PMCA'
	400.0;		% param(237) is 'Ca_ER_init_uM'
	1.8;		% param(238) is 'SAV'
	4.0;		% param(239) is 'kr2'
	3.5;		% param(240) is 'kr1'
	2.0;		% param(241) is 'Cofilin_init_uM'
	0.01;		% param(242) is 'Kr_STIM1'
	0.0;		% param(243) is 'NPC_S_init_molecules_um_2'
	40.0;		% param(244) is 'KfMSTPP2A_R48'
	0.00171;		% param(245) is 'Kf_26'
	0.0;		% param(246) is 'Arp23_S_init_uM'
	2.1;		% param(247) is 'ne'
	40.0;		% param(248) is 'KfMSTPP2A'
	0.0;		% param(249) is 'ROCK_S_init_uM'
	0.03;		% param(250) is 'kmr'
	0.002;		% param(251) is 'kmp'
	5.0;		% param(252) is 'n2'
	0.04;		% param(253) is 'AKT_init_uM'
	3.31E-5;		% param(254) is 'kf_PMleak'
	120.0;		% param(255) is 'kly'
	16.0;		% param(256) is 'kll'
	2.0;		% param(257) is 'kr'
	300.0;		% param(258) is 'mlabfix_T_'
	0.0;		% param(259) is 'cPKC_Ca_init_uM'
	1.0;		% param(260) is 'Kr_CaM'
	0.015;		% param(261) is 'kf'
	60.0;		% param(262) is 'gamma'
	9.1E-4;		% param(263) is 'CF_R15'
	9.1E-4;		% param(264) is 'CF_R14'
	0.0;		% param(265) is 'K_TRP'
	0.33;		% param(266) is 'nPKC_init_uM'
	0.5;		% param(267) is 'Km_Serca'
	0.0;		% param(268) is 'PP2Ac_S_init_uM'
	0.0027;		% param(269) is 'Kf_pyk'
	0.0;		% param(270) is 'L_GR_GqGDP_P_init_molecules_um_2'
	1.0;		% param(271) is 'Kf2_LATS'
	8314.46261815;		% param(272) is 'mlabfix_R_'
	5.0;		% param(273) is 'Arp23_init_uM'
	10.0;		% param(274) is 'Km2'
	1.0;		% param(275) is 'Km1'
	0.00135;		% param(276) is 'KfTG'
	1.0;		% param(277) is 'RhoAGDP_init_uM'
	9.64853321E-5;		% param(278) is 'mlabfix_F_nmol_'
	2.93;		% param(279) is 'GR_init_molecules_um_2'
	1.0;		% param(280) is 'netValence_IP3R'
	1.0;		% param(281) is 'LATS12_init_uM'
	0.0;		% param(282) is 'Ca_CaM_init_uM'
	2.0;		% param(283) is 'LIMK_init_uM'
	0.0;		% param(284) is 'Pyk2_p_init_uM'
	0.0;		% param(285) is 'CofilinP_init_uM'
	1.0;		% param(286) is 'Kr_CaM_R21'
	36.0;		% param(287) is 'epsilon'
	0.0;		% param(288) is 'JNK_p_init_uM'
	21000.0;		% param(289) is 'Size_ERM'
	1.0;		% param(290) is 'kinSolo2'
	0.0;		% param(291) is 'Voltage_PM'
	0.0;		% param(292) is 'Buffercyt_Ca_init_uM'
	100.0;		% param(293) is 'Kf3_LATS'
	1.0;		% param(294) is 'Kc_LATS'
	0.0;		% param(295) is 'CaMKIIP_init_uM'
	8.63;		% param(296) is 'PLCB_Ca_init_molecules_um_2'
	1.07;		% param(297) is 'GR_GqGDP_init_molecules_um_2'
	0.018;		% param(298) is 'Krfn'
	1.0;		% param(299) is 'Kfn'
	3.882E-6;		% param(300) is 'kf3'
	0.625;		% param(301) is 'kdp'
	0.0055;		% param(302) is 'kf2'
	0.07;		% param(303) is 'kf1'
	3.0;		% param(304) is 'C_TRP'
	2.13E-4;		% param(305) is 'Ymax_SOCE'
	10.0;		% param(306) is 'v1_IP3R'
	0.035;		% param(307) is 'kdf'
	0.0;		% param(308) is 'Voltage_NM'
	0.463;		% param(309) is 'DAG_init_uM'
	0.0;		% param(310) is 'TG_init_uM'
	0.6;		% param(311) is 'Y'
	1.0E-9;		% param(312) is 'mlabfix_K_GHK_'
	0.08234;		% param(313) is 'd4'
	0.0094;		% param(314) is 'd3'
	0.5;		% param(315) is 'd2'
	0.13;		% param(316) is 'd1'
	60.0;		% param(317) is 'Kf3'
	0.0;		% param(318) is 'RRR'
	3.25;		% param(319) is 'C'
	4.7E-5;		% param(320) is 'Kf1_R57'
	1.9;		% param(321) is 'Vmax_s'
	0.1;		% param(322) is 'KbasalMSTPdeg'
	20.0;		% param(323) is 'sc1'
	0.53;		% param(324) is 'Kmit'
	500.0;		% param(325) is 'Kf_Buffer'
	2.5878;		% param(326) is 'Vmax_P'
	0.34;		% param(327) is 'kcatcof'
	0.0;		% param(328) is 'Myo_S_init_uM'
	16.0;		% param(329) is 'k11'
];
if nargin >= 3
	if length(argParam) > 0
		%
		% parameter values overridden by function arguments
		%
		param = argParam;
	end
end
%
% invoke the integrator
%
[T,Y] = ode15s(@f,timeSpan,yinit,odeset('OutputFcn',[]),param,yinit);

% get the solution
all = zeros(length(T), numVars);
for i = 1:length(T)
	all(i,:) = getRow(T(i), Y(i,:), yinit, param);
end

allValues = all;
end

% -------------------------------------------------------
% get row data
function rowValue = getRow(t,y,y0,p)
	% State Variables
	LaminA = y(1);
	L_GR = y(2);
	CaM = y(3);
	JNK = y(4);
	DAG = y(5);
	MST12 = y(6);
	PLCB_GqGTP = y(7);
	Ca_Ext = y(8);
	GqGTP = y(9);
	LATS12_P = y(10);
	Fak = y(11);
	Cofilin = y(12);
	GR_GqGDP = y(13);
	TG = y(14);
	Myo = y(15);
	PP2Ac = y(16);
	ROCK_S = y(17);
	Ligand = y(18);
	Ca_Cyt = y(19);
	PLCB_Ca = y(20);
	PA = y(21);
	NPC_S = y(22);
	G_actin = y(23);
	PLCB = y(24);
	AKTPP = y(25);
	Pyk2 = y(26);
	GqGDP = y(27);
	mDia_S = y(28);
	Pyk2_p = y(29);
	Ca_ER = y(30);
	Fakp = y(31);
	nPKC = y(32);
	RhoAGDP = y(33);
	NPC = y(34);
	GR = y(35);
	Buffercyt_Ca = y(36);
	TGSm = y(37);
	MST12P = y(38);
	LIMK_S = y(39);
	Buffercyt = y(40);
	Arp23 = y(41);
	cPKC_Ca_DAG = y(42);
	PLCB_Ca_GqGTP = y(43);
	IP3 = y(44);
	CaMKII = y(45);
	F_actin = y(46);
	Merlin = y(47);
	ROCK = y(48);
	YAPTAZnuc = y(49);
	LIMK = y(50);
	JNK_p = y(51);
	L_GR_GqGDP = y(52);
	Myo_S = y(53);
	AKT = y(54);
	cPKC_Ca = y(55);
	Merlin_S = y(56);
	nPKC_DAG = y(57);
	cPKC_Ca_DAG_S = y(58);
	Arp23_S = y(59);
	LATS12 = y(60);
	mDia = y(61);
	aPKC = y(62);
	YAPTAZc = y(63);
	LaminAp = y(64);
	CaMKIIP = y(65);
	L_GR_GqGDP_P = y(66);
	Ca_CaM = y(67);
	YAPTAZcP = y(68);
	TGS = y(69);
	PP2Ac_S = y(70);
	RhoAGTP_MEM = y(71);
	CofilinP = y(72);
	cPKC = y(73);
	% Constants
	G_actin_init_uM = p(1);
	netValence_R6S = p(2);
	kdmdia = p(3);
	KmMSTPP2A_R48 = p(4);
	K11 = p(5);
	Kf1_R22 = p(6);
	RhoAGTP_MEM_init_molecules_um_2 = p(7);
	Kbas = p(8);
	Kf_R37 = p(9);
	Clam = p(10);
	Amp = p(11);
	Kf_R35 = p(12);
	Kf_R33 = p(13);
	CaMKII_init_uM = p(14);
	Kf_R31 = p(15);
	Kf_R30 = p(16);
	Ca_Ext_init_uM = p(17);
	PA_init_molecules_um_2 = p(18);
	mlabfix_F_ = p(19);
	Kf_R29 = p(20);
	netValence_R56 = p(21);
	netValence_R53 = p(22);
	netValence_R52 = p(23);
	Buffercyt_init_uM = p(24);
	unitconversionfactor = p(25);
	Kf_R9 = p(26);
	Kf_R8 = p(27);
	Kf_R7 = p(28);
	Kf_R6 = p(29);
	Kf_R5 = p(30);
	Kf_R4 = p(31);
	Kf_R3 = p(32);
	Kf_R2 = p(33);
	MST12_init_uM = p(34);
	Kf_R19 = p(35);
	Fakp_init_uM = p(36);
	Kf_R13 = p(37);
	Kf_R12 = p(38);
	Kf_R11 = p(39);
	netValence_R40 = p(40);
	Kf_R10 = p(41);
	IP30 = p(42);
	netValence_SOCE = p(43);
	mDia_S_init_uM = p(44);
	netValence_R38 = p(45);
	netValence_R37 = p(46);
	netValence_R36 = p(47);
	netValence_R34 = p(48);
	Kr_pyk = p(49);
	kr_R43 = p(50);
	Voltage_ERM = p(51);
	YAPTAZc_init_uM = p(52);
	TGS_init_uM = p(53);
	netValence_R19 = p(54);
	netValence_R18 = p(55);
	netValence_R15 = p(56);
	netValence_R14 = p(57);
	netValence_R13 = p(58);
	netValence_R12 = p(59);
	netValence_R11 = p(60);
	netValence_R10 = p(61);
	PLCB_GqGTP_init_molecules_um_2 = p(62);
	Kf_TRP = p(63);
	n_s = p(64);
	K_millivolts_per_volt = p(65);
	K_STIM1 = p(66);
	AKTPP_init_uM = p(67);
	LaminAp_init_molecules_um_2 = p(68);
	Myo_init_uM = p(69);
	KfArp = p(70);
	KflatsPP2A = p(71);
	n_P = p(72);
	Kr_R9 = p(73);
	Kr_R8 = p(74);
	Kr_R7 = p(75);
	Kr_R6 = p(76);
	Kr_R5 = p(77);
	Kr_R4 = p(78);
	Kr_R3 = p(79);
	Kr_R2 = p(80);
	netValence_R9 = p(81);
	netValence_R8 = p(82);
	netValence_R7 = p(83);
	netValence_R6 = p(84);
	netValence_R5 = p(85);
	netValence_R4 = p(86);
	netValence_R3 = p(87);
	netValence_R2 = p(88);
	netValence_R1 = p(89);
	Size_ECM = p(90);
	kfNPC = p(91);
	Km_s = p(92);
	Kf_CaM_R21 = p(93);
	NPC_init_molecules_um_2 = p(94);
	Kdg_IP3 = p(95);
	netValence_TRP = p(96);
	kdrock = p(97);
	Km_P = p(98);
	time_reg_P = p(99);
	KrhoA1 = p(100);
	Kcat_27 = p(101);
	Kcat_25 = p(102);
	PP2A = p(103);
	ROCK_init_uM = p(104);
	Kr_R6S = p(105);
	Kbasal_TRP = p(106);
	MST12P_init_uM = p(107);
	Pyk2_init_uM = p(108);
	nPKC_DAG_init_uM = p(109);
	Kf11LATS = p(110);
	PP1 = p(111);
	n_so = p(112);
	kfkp = p(113);
	TGSm_init_uM = p(114);
	Size_PM = p(115);
	Kr_R57 = p(116);
	Kr_R52 = p(117);
	krNPC = p(118);
	KfMST = p(119);
	PLCB_init_molecules_um_2 = p(120);
	KIP3_2 = p(121);
	KIP3_1 = p(122);
	Kr_R46 = p(123);
	Kr_R45 = p(124);
	Kr_R41 = p(125);
	Kr_R40 = p(126);
	Emol = p(127);
	Ca_Cyt_init_uM = p(128);
	Kf2_R57 = p(129);
	Size_NM = p(130);
	Kr_R39 = p(131);
	Kr_R38 = p(132);
	Kr_R37 = p(133);
	Kr_R36 = p(134);
	Kr_R35 = p(135);
	Kr_R34 = p(136);
	KmMSTPP2A = p(137);
	Kr_R33 = p(138);
	Kr_R31 = p(139);
	Kr_R30 = p(140);
	aPKC_init_uM = p(141);
	LIMK_S_init_uM = p(142);
	tau = p(143);
	Kf2_R42 = p(144);
	Kr_R29 = p(145);
	LATS12_P_init_uM = p(146);
	Kr_R26 = p(147);
	Kr_R22 = p(148);
	Kcat2 = p(149);
	cPKC_F_THR = p(150);
	Kcat1 = p(151);
	Ligand_init_uM = p(152);
	PIP2_init_molecules_um_2 = p(153);
	Kr_R19 = p(154);
	JNK_init_uM = p(155);
	alpha = p(156);
	Kr_R13 = p(157);
	Kr_R12 = p(158);
	Kr_R11 = p(159);
	Kr_R10 = p(160);
	PP1param = p(161);
	Kact_STIM1 = p(162);
	kin2 = p(163);
	kout2 = p(164);
	Kf2_R22 = p(165);
	KMOLE = p(166);
	cPKC_init_uM = p(167);
	GqGDP_init_molecules_um_2 = p(168);
	kNC = p(169);
	Kcat = p(170);
	Vmax_Serca = p(171);
	Kf_r1 = p(172);
	Fak_init_uM = p(173);
	KY = p(174);
	kf_ERleak = p(175);
	YAPTAZnuc_init_uM = p(176);
	cPKC_Ca_DAG_S_init_uM = p(177);
	netValence_PM_leak = p(178);
	KE = p(179);
	IP3_init_uM = p(180);
	L_GR_GqGDP_init_molecules_um_2 = p(181);
	F_actin_init_uM = p(182);
	kfc1 = p(183);
	KMST = p(184);
	kdmy = p(185);
	Kf_CaM = p(186);
	Kd_Buffer = p(187);
	Kf_STIM1 = p(188);
	Clamin = p(189);
	Km_R54 = p(190);
	Size_ER = p(191);
	PLCB_Ca_GqGTP_init_molecules_um_2 = p(192);
	Km_so = p(193);
	YAPTAZcP_init_uM = p(194);
	mDiaT = p(195);
	Kj_LATS = p(196);
	netValence_ER_leak = p(197);
	kf1_R43 = p(198);
	kf1_R42 = p(199);
	Size_Nuc = p(200);
	netValence_Serca_flux = p(201);
	LaminA_init_molecules_um_2 = p(202);
	Km_R27 = p(203);
	Km_R25 = p(204);
	Km_R23 = p(205);
	kmCof = p(206);
	netValence_PMCA = p(207);
	L_GR_init_molecules_um_2 = p(208);
	Kflam = p(209);
	PP2Ac_init_uM = p(210);
	TGS1 = p(211);
	v1 = p(212);
	TGS0 = p(213);
	kCY1 = p(214);
	ROCKT = p(215);
	KfMerlin = p(216);
	CaM_init_uM = p(217);
	kCY = p(218);
	kCN = p(219);
	Kdg_DAG = p(220);
	KmlatsPP2A = p(221);
	ksf = p(222);
	cPKC_Ca_DAG_init_uM = p(223);
	mDia_init_uM = p(224);
	GqGTP_init_molecules_um_2 = p(225);
	Size_Cyto = p(226);
	Kcat_R14 = p(227);
	mlabfix_PI_ = p(228);
	krp = p(229);
	mlabfix_N_pmol_ = p(230);
	Merlin_S_init_uM = p(231);
	kdep = p(232);
	kra = p(233);
	Merlin_init_uM = p(234);
	kturnover = p(235);
	Y_PMCA = p(236);
	Ca_ER_init_uM = p(237);
	SAV = p(238);
	kr2 = p(239);
	kr1 = p(240);
	Cofilin_init_uM = p(241);
	Kr_STIM1 = p(242);
	NPC_S_init_molecules_um_2 = p(243);
	KfMSTPP2A_R48 = p(244);
	Kf_26 = p(245);
	Arp23_S_init_uM = p(246);
	ne = p(247);
	KfMSTPP2A = p(248);
	ROCK_S_init_uM = p(249);
	kmr = p(250);
	kmp = p(251);
	n2 = p(252);
	AKT_init_uM = p(253);
	kf_PMleak = p(254);
	kly = p(255);
	kll = p(256);
	kr = p(257);
	mlabfix_T_ = p(258);
	cPKC_Ca_init_uM = p(259);
	Kr_CaM = p(260);
	kf = p(261);
	gamma = p(262);
	CF_R15 = p(263);
	CF_R14 = p(264);
	K_TRP = p(265);
	nPKC_init_uM = p(266);
	Km_Serca = p(267);
	PP2Ac_S_init_uM = p(268);
	Kf_pyk = p(269);
	L_GR_GqGDP_P_init_molecules_um_2 = p(270);
	Kf2_LATS = p(271);
	mlabfix_R_ = p(272);
	Arp23_init_uM = p(273);
	Km2 = p(274);
	Km1 = p(275);
	KfTG = p(276);
	RhoAGDP_init_uM = p(277);
	mlabfix_F_nmol_ = p(278);
	GR_init_molecules_um_2 = p(279);
	netValence_IP3R = p(280);
	LATS12_init_uM = p(281);
	Ca_CaM_init_uM = p(282);
	LIMK_init_uM = p(283);
	Pyk2_p_init_uM = p(284);
	CofilinP_init_uM = p(285);
	Kr_CaM_R21 = p(286);
	epsilon = p(287);
	JNK_p_init_uM = p(288);
	Size_ERM = p(289);
	kinSolo2 = p(290);
	Voltage_PM = p(291);
	Buffercyt_Ca_init_uM = p(292);
	Kf3_LATS = p(293);
	Kc_LATS = p(294);
	CaMKIIP_init_uM = p(295);
	PLCB_Ca_init_molecules_um_2 = p(296);
	GR_GqGDP_init_molecules_um_2 = p(297);
	Krfn = p(298);
	Kfn = p(299);
	kf3 = p(300);
	kdp = p(301);
	kf2 = p(302);
	kf1 = p(303);
	C_TRP = p(304);
	Ymax_SOCE = p(305);
	v1_IP3R = p(306);
	kdf = p(307);
	Voltage_NM = p(308);
	DAG_init_uM = p(309);
	TG_init_uM = p(310);
	Y = p(311);
	mlabfix_K_GHK_ = p(312);
	d4 = p(313);
	d3 = p(314);
	d2 = p(315);
	d1 = p(316);
	Kf3 = p(317);
	RRR = p(318);
	C = p(319);
	Kf1_R57 = p(320);
	Vmax_s = p(321);
	KbasalMSTPdeg = p(322);
	sc1 = p(323);
	Kmit = p(324);
	Kf_Buffer = p(325);
	Vmax_P = p(326);
	kcatcof = p(327);
	Myo_S_init_uM = p(328);
	k11 = p(329);
	% Functions
	Kf_R46 = (KfArp .* CaMKIIP);
	Kf_R45 = (KfMerlin .* Ca_Cyt .* F_actin);
	Kf_R44 = kturnover;
	Kf_R43 = ((kf1_R43 .* (1.0 + (0.5 .* tau .* (1.0 + tanh((20.0 .* (ROCK_S - ROCKT)))) .* ROCK_S))) + (kf2 .* CaMKIIP));
	Kf_R42 = ((kf1_R42 .* (1.0 + (0.5 .* alpha .* (1.0 + tanh((20.0 .* (mDia_S - mDiaT)))) .* mDia_S))) + (Arp23_S .* Kf2_R42) + (Ca_Cyt .* Kf3));
	Kf_R41 = kdmdia;
	Kf_R40 = (kmp .* RhoAGTP_MEM);
	PIP2 = PIP2_init_molecules_um_2;
	Kf_R39 = kdrock;
	Kf_R38 = (krp .* RhoAGTP_MEM);
	Kf_R36 = ((kfkp .* (1.0 + (gamma .* (Fakp ^ n2))) .* unitconversionfactor .* SAV) + (KrhoA1 .* Pyk2_p));
	Kf_R34 = (ksf .* Emol .* unitconversionfactor .* SAV ./ (C + Emol));
	Kf_R32 = (Kfn .* F_actin);
	Kf_R28 = (Kf_pyk .* CaMKIIP);
	Kf_R26 = (Kf_26 .* Ca_Cyt);
	Kf_R22 = ((Kf1_R22 .* CaMKIIP) + (Kf2_R22 .* Fakp));
	Kf_R20 = Kf_Buffer;
	Kf_R1 = Kf_r1;
	Kr_R1 = (0.0015 .* Kf_r1);
	TGdose = TG;
	KFlux_PM_Cyto = (Size_PM ./ Size_Cyto);
	Kf_R6S = RRR;
	J_R6S = ((Kf_R6S .* L_GR_GqGDP_P) - (((Kr_R6S .* Ligand) .* GR) .* GqGDP));
	Kr_R58 = (4.0 .* Kbas);
	Kf_R58 = ((KfTG .* TGdose) + Kbas);
	J_R58 = ((Kf_R58 .* TGS) - (Kr_R58 .* TGSm));
	Kf_R57 = ((Kf1_R57 .* Ligand) + kf3 + (Kf2_R57 .* TG));
	J_R57 = ((Kf_R57 .* PP2Ac) - (Kr_R57 .* PP2Ac_S));
	Kr_R56 = kout2;
	Kf_R56 = ((kin2 .* NPC_S) + kinSolo2);
	J_R56 = ((Kf_R56 .* YAPTAZc) - (Kr_R56 .* YAPTAZnuc));
	Kr_R55 = kNC;
	Kf_R55 = (kCY1 .* (Myo_S .* F_actin));
	J_R55 = ((Kf_R55 .* YAPTAZcP) - (Kr_R55 .* YAPTAZc));
	Vmax_R54 = (KY .* LATS12_P);
	J_R54 = ((Vmax_R54 .* YAPTAZc) ./ (Km_R54 + YAPTAZc));
	Kr_R53 = krNPC;
	Kf_R53 = (kfNPC .* Myo_S .* F_actin .* LaminA);
	J_R53 = ((Kf_R53 .* NPC) - (Kr_R53 .* NPC_S));
	Ecyt = (KE .* (F_actin ^ ne));
	Kf_R52 = ((Kflam .* Ecyt) ./ (Clam + Ecyt));
	J_R52 = ((Kf_R52 .* LaminAp) - (Kr_R52 .* LaminA));
	Kr_R51 = kdmy;
	Kf_R51 = (kmr .* (1.0 + (0.5 .* epsilon .* (1.0 + tanh((sc1 .* (ROCK_S - ROCKT)))) .* ROCK_S)));
	J_R51 = ((Kf_R51 .* Myo) - (Kr_R51 .* Myo_S));
	Vmax_R50 = (KflatsPP2A .* PP2Ac_S);
	Km_R50 = KmlatsPP2A;
	J_R50 = ((Vmax_R50 .* LATS12_P) ./ (Km_R50 + LATS12_P));
	Km_R49 = ((Kj_LATS .* JNK_p) + (Kc_LATS .* cPKC_Ca_DAG_S));
	Kf1_LATS = (Kf11LATS ./ aPKC);
	Vmax_R49 = ((Kf2_LATS .* Merlin_S) + (Kf3_LATS .* nPKC_DAG) + (Kf1_LATS .* MST12P));
	J_R49 = ((Vmax_R49 .* LATS12) ./ (Km_R49 + LATS12));
	Vmax_R48 = (KfMSTPP2A_R48 .* PP2Ac_S);
	Km_R48 = KmMSTPP2A_R48;
	J_R48 = ((Vmax_R48 .* MST12P) ./ (Km_R48 + MST12P));
	Vmax_R47 = ((KfMST .* (cPKC_Ca_DAG_S - cPKC_F_THR)) .* (cPKC_Ca_DAG_S > cPKC_F_THR));
	Km_R47 = (KbasalMSTPdeg + AKTPP);
	J_R47 = ((Vmax_R47 .* MST12) ./ (Km_R47 + MST12));
	J_R46 = ((Kf_R46 .* Arp23) - (Kr_R46 .* Arp23_S));
	J_R45 = ((Kf_R45 .* Merlin) - (Kr_R45 .* Merlin_S));
	Kr_R44 = (kcatcof .* LIMK_S ./ (kmCof + Cofilin));
	J_R44 = ((Kf_R44 .* CofilinP) - (Kr_R44 .* Cofilin));
	Kr_R43 = kr_R43;
	J_R43 = ((Kf_R43 .* LIMK) - (Kr_R43 .* LIMK_S));
	Kr_R42 = (kr1 + (kr2 .* Cofilin));
	J_R42 = ((Kf_R42 .* G_actin) - (Kr_R42 .* F_actin));
	J_R41 = ((Kf_R41 .* mDia_S) - (Kr_R41 .* mDia));
	J_R40 = ((Kf_R40 .* mDia) - (Kr_R40 .* mDia_S));
	J_R39 = ((Kf_R39 .* ROCK_S) - (Kr_R39 .* ROCK));
	J_R38 = ((Kf_R38 .* ROCK) - (Kr_R38 .* ROCK_S));
	J_R37 = ((Kf_R37 .* RhoAGTP_MEM) - (Kr_R37 .* RhoAGDP));
	J_R36 = ((Kf_R36 .* RhoAGDP) - (Kr_R36 .* RhoAGTP_MEM));
	J_R35 = ((Kf_R35 .* Fakp) - (Kr_R35 .* Fak));
	J_R34 = ((Kf_R34 .* Fak) - (Kr_R34 .* Fakp));
	J_R33 = ((Kf_R33 .* Fak) - (Kr_R33 .* Fakp));
	Kr_R32 = Krfn;
	J_R32 = ((Kf_R32 .* cPKC_Ca_DAG) - (Kr_R32 .* cPKC_Ca_DAG_S));
	J_R31 = (((Kf_R31 .* DAG) .* cPKC_Ca) - (Kr_R31 .* cPKC_Ca_DAG));
	J_R30 = (((Kf_R30 .* Ca_Cyt) .* cPKC) - (Kr_R30 .* cPKC_Ca));
	J_R29 = (((Kf_R29 .* nPKC) .* DAG) - (Kr_R29 .* nPKC_DAG));
	Kr_R28 = Kr_pyk;
	J_R28 = ((Kf_R28 .* Pyk2) - (Kr_R28 .* Pyk2_p));
	Vmax_R27 = (Kcat_27 .* PP2Ac_S);
	J_R27 = ((Vmax_R27 .* JNK_p) ./ (Km_R27 + JNK_p));
	J_R26 = ((Kf_R26 .* JNK) - (Kr_R26 .* JNK_p));
	Vmax_R25 = (Kcat_25 .* PP1);
	J_R25 = ((Vmax_R25 .* CaMKIIP) ./ (Km_R25 + CaMKIIP));
	J_R24 = (((Kcat1 .* (Ca_CaM ^ 4.0) .* CaMKII) ./ ((Km1 ^ 4.0) + (Ca_CaM ^ 4.0))) + ((Kcat2 .* CaMKIIP .* CaMKII) ./ (Km2 + CaMKII)));
	Vmax_R23 = (Kcat .* PP2Ac_S);
	J_R23 = ((Vmax_R23 .* AKTPP) ./ (Km_R23 + AKTPP));
	J_R22 = ((Kf_R22 .* AKT) - (Kr_R22 .* AKTPP));
	Kr_R21 = Kr_CaM_R21;
	kf_R21 = Kf_CaM_R21;
	J_R21 = ((kf_R21 .* (Ca_Cyt ^ 4.0) .* CaM) - (Kr_R21 .* Ca_CaM));
	Kr_R20 = (Kf_Buffer .* Kd_Buffer);
	J_R20 = (((Kf_R20 .* Ca_Cyt) .* Buffercyt) - (Kr_R20 .* Buffercyt_Ca));
	J_PMCA = ( - Y_PMCA .* ((Vmax_P .* (Ca_Cyt ^ n_P)) ./ ((Ca_Cyt ^ n_P) + (Km_P ^ n_P))));
	J_R19 = ((Kf_R19 .* PA) - (Kr_R19 .* DAG));
	J_R18 = (K11 .* Ligand);
	J_R17 = (Kdg_DAG .* DAG);
	J_R16 = (Kdg_IP3 .* IP3);
	Vmax_R15 = (KIP3_2 .* PLCB_Ca_GqGTP);
	Km_R15 = (5.0 ./ CF_R15);
	J_R15 = ((Vmax_R15 .* PIP2) ./ (Km_R15 + PIP2));
	Vmax_R14 = (KIP3_1 .* PLCB_Ca);
	Km_R14 = (19.8 ./ CF_R14);
	J_R14 = ((Vmax_R14 .* PIP2) ./ (Km_R14 + PIP2));
	J_R13 = ((Kf_R13 .* PLCB_GqGTP) - ((Kr_R13 .* GqGDP) .* PLCB));
	J_R12 = ((Kf_R12 .* PLCB_Ca_GqGTP) - ((Kr_R12 .* GqGDP) .* PLCB_Ca));
	J_R11 = (((Kf_R11 .* Ca_Cyt) .* PLCB_GqGTP) - (Kr_R11 .* PLCB_Ca_GqGTP));
	J_R10 = (((Kf_R10 .* GqGTP) .* PLCB_Ca) - (Kr_R10 .* PLCB_Ca_GqGTP));
	KFlux_ERM_ER = (Size_ERM ./ Size_ER);
	J_TRP = ((Kf_TRP .* Emol ./ (C_TRP + Emol)) .* (Ca_Ext - Ca_Cyt));
	KFlux_PM_ECM = (Size_PM ./ Size_ECM);
	X_Serca_flux = ((TGS - TGS0) .* (TGS > TGS0));
	J_Serca_flux = (X_Serca_flux .* (Vmax_s .* (Ca_Cyt ^ n_s)) ./ ((Ca_Cyt ^ n_s) + (Km_s ^ n_s)));
	J_PM_leak = ((Amp .* kf_PMleak .* (Ca_Ext - Ca_Cyt)) - (Kmit .* (TGSm - TGS1) .* (TGSm > TGS1)));
	KFlux_ERM_Cyto = (Size_ERM ./ Size_Cyto);
	J_IP3R = ((v1_IP3R .* (((Ca_Cyt .* IP3 .* d2) ./ (((Ca_Cyt .* IP3) + (IP3 .* d2) + (d1 .* d2) + (Ca_Cyt .* d3)) .* (Ca_Cyt + d4))) ^ 3.0)) .* (Ca_Cyt - Ca_ER));
	J_R9 = (((Kf_R9 .* PLCB) .* Ca_Cyt) - (Kr_R9 .* PLCB_Ca));
	J_R8 = (((Kf_R8 .* PLCB) .* GqGTP) - (Kr_R8 .* PLCB_GqGTP));
	J_R7 = ((Kf_R7 .* GqGTP) - (Kr_R7 .* GqGDP));
	J_R6 = ((Kf_R6 .* L_GR_GqGDP) - (Kr_R6 .* L_GR_GqGDP_P));
	J_R5 = ((Kf_R5 .* L_GR_GqGDP) - ((Kr_R5 .* L_GR) .* GqGTP));
	J_R4 = (((Kf_R4 .* Ligand) .* GR_GqGDP) - (Kr_R4 .* L_GR_GqGDP));
	J_R3 = (((Kf_R3 .* GqGDP) .* GR) - (Kr_R3 .* GR_GqGDP));
	J_R2 = (((Kf_R2 .* GqGDP) .* L_GR) - (Kr_R2 .* L_GR_GqGDP));
	J_R1 = (((Kf_R1 .* Ligand) .* GR) - (Kr_R1 .* L_GR));
	KFlux_NM_Cyto = (Size_NM ./ Size_Cyto);
	J_ER_leak = (kf_ERleak .* (Ca_Cyt - Ca_ER));
	KFlux_NM_Nuc = (Size_NM ./ Size_Nuc);
	J_SOCE = ((Ymax_SOCE .* (1.0 - (1.0 ./ (1.0 + ((Km_so ./ Ca_ER) ^ n_so))))) .* (Ca_Ext - Ca_Cyt));
	UnitFactor_uM_um3_molecules_neg_1 = (1000000.0 ./ 6.02214179E8);
	X = (0.4 - TGSm);
	% OutputFunctions
	FakConservation = (Fak + Fakp);
	RhoAConservation = (RhoAGDP + (RhoAGTP_MEM .* 1260.0 ./ 2300.0 .* 1.0E15 ./ 6.022E17));
	LIMKConservation = (LIMK_S + LIMK);
	YAPTAZConservation = (((YAPTAZc + YAPTAZcP) .* 2300.0) + (YAPTAZnuc .* 550.0));
	MyoConservation = (Myo + Myo_S);
	mDiaConservation = (mDia + mDia_S);
	ROCKConservation = (ROCK + ROCK_S);
	CofilinConservation = (Cofilin + CofilinP);
	LaminAConservation = (LaminAp + LaminA);
	NPCConservation = (NPC + NPC_S);
	pyk2Conservation = (Pyk2 + Pyk2_p);
	PLCBConsevation = (PLCB + PLCB_Ca + PLCB_Ca_GqGTP + PLCB_GqGTP);
	nPKCConservation = (nPKC + nPKC_DAG);
	MST12Conservation = (MST12 + MST12P);
	LATS12Conservation = (LATS12_P + LATS12);
	GRConservation = (L_GR + L_GR_GqGDP + L_GR_GqGDP_P + GR + GR_GqGDP);
	cPKCConservation = (cPKC + cPKC_Ca + cPKC_Ca_DAG + cPKC_Ca_DAG_S);
	CaMKIIConservation = (CaMKII + CaMKIIP);
	CaMConservation = (CaM + Ca_CaM);
	BufferConservation = (Buffercyt + Buffercyt_Ca);
	Arp23Conservation = (Arp23 + Arp23_S);
	AktConservation = (AKT + AKTPP);
	RhoAact = (RhoAGTP_MEM ./ RhoAGDP);
	YAPTAZratio = (YAPTAZnuc ./ (YAPTAZc + YAPTAZcP));

	rowValue = [LaminA L_GR CaM JNK DAG MST12 PLCB_GqGTP Ca_Ext GqGTP LATS12_P Fak Cofilin GR_GqGDP TG Myo PP2Ac ROCK_S Ligand Ca_Cyt PLCB_Ca PA NPC_S G_actin PLCB AKTPP Pyk2 GqGDP mDia_S Pyk2_p Ca_ER Fakp nPKC RhoAGDP NPC GR Buffercyt_Ca TGSm MST12P LIMK_S Buffercyt Arp23 cPKC_Ca_DAG PLCB_Ca_GqGTP IP3 CaMKII F_actin Merlin ROCK YAPTAZnuc LIMK JNK_p L_GR_GqGDP Myo_S AKT cPKC_Ca Merlin_S nPKC_DAG cPKC_Ca_DAG_S Arp23_S LATS12 mDia aPKC YAPTAZc LaminAp CaMKIIP L_GR_GqGDP_P Ca_CaM YAPTAZcP TGS PP2Ac_S RhoAGTP_MEM CofilinP cPKC Kf_R46 Kf_R45 Kf_R44 Kf_R43 Kf_R42 Kf_R41 Kf_R40 PIP2 Kf_R39 Kf_R38 Kf_R36 Kf_R34 Kf_R32 Kf_R28 Kf_R26 Kf_R22 Kf_R20 Kf_R1 Kr_R1 TGdose KFlux_PM_Cyto Kf_R6S J_R6S Kr_R58 Kf_R58 J_R58 Kf_R57 J_R57 Kr_R56 Kf_R56 J_R56 Kr_R55 Kf_R55 J_R55 Vmax_R54 J_R54 Kr_R53 Kf_R53 J_R53 Ecyt Kf_R52 J_R52 Kr_R51 Kf_R51 J_R51 Vmax_R50 Km_R50 J_R50 Km_R49 Kf1_LATS Vmax_R49 J_R49 Vmax_R48 Km_R48 J_R48 Vmax_R47 Km_R47 J_R47 J_R46 J_R45 Kr_R44 J_R44 Kr_R43 J_R43 Kr_R42 J_R42 J_R41 J_R40 J_R39 J_R38 J_R37 J_R36 J_R35 J_R34 J_R33 Kr_R32 J_R32 J_R31 J_R30 J_R29 Kr_R28 J_R28 Vmax_R27 J_R27 J_R26 Vmax_R25 J_R25 J_R24 Vmax_R23 J_R23 J_R22 Kr_R21 kf_R21 J_R21 Kr_R20 J_R20 J_PMCA J_R19 J_R18 J_R17 J_R16 Vmax_R15 Km_R15 J_R15 Vmax_R14 Km_R14 J_R14 J_R13 J_R12 J_R11 J_R10 KFlux_ERM_ER J_TRP KFlux_PM_ECM X_Serca_flux J_Serca_flux J_PM_leak KFlux_ERM_Cyto J_IP3R J_R9 J_R8 J_R7 J_R6 J_R5 J_R4 J_R3 J_R2 J_R1 KFlux_NM_Cyto J_ER_leak KFlux_NM_Nuc J_SOCE UnitFactor_uM_um3_molecules_neg_1 X FakConservation RhoAConservation LIMKConservation YAPTAZConservation MyoConservation mDiaConservation ROCKConservation CofilinConservation LaminAConservation NPCConservation pyk2Conservation PLCBConsevation nPKCConservation MST12Conservation LATS12Conservation GRConservation cPKCConservation CaMKIIConservation CaMConservation BufferConservation Arp23Conservation AktConservation RhoAact YAPTAZratio];
end

% -------------------------------------------------------
% ode rate
function dydt = f(t,y,p,y0)
	% State Variables
	LaminA = y(1);
	L_GR = y(2);
	CaM = y(3);
	JNK = y(4);
	DAG = y(5);
	MST12 = y(6);
	PLCB_GqGTP = y(7);
	Ca_Ext = y(8);
	GqGTP = y(9);
	LATS12_P = y(10);
	Fak = y(11);
	Cofilin = y(12);
	GR_GqGDP = y(13);
	TG = y(14);
	Myo = y(15);
	PP2Ac = y(16);
	ROCK_S = y(17);
	Ligand = y(18);
	Ca_Cyt = y(19);
	PLCB_Ca = y(20);
	PA = y(21);
	NPC_S = y(22);
	G_actin = y(23);
	PLCB = y(24);
	AKTPP = y(25);
	Pyk2 = y(26);
	GqGDP = y(27);
	mDia_S = y(28);
	Pyk2_p = y(29);
	Ca_ER = y(30);
	Fakp = y(31);
	nPKC = y(32);
	RhoAGDP = y(33);
	NPC = y(34);
	GR = y(35);
	Buffercyt_Ca = y(36);
	TGSm = y(37);
	MST12P = y(38);
	LIMK_S = y(39);
	Buffercyt = y(40);
	Arp23 = y(41);
	cPKC_Ca_DAG = y(42);
	PLCB_Ca_GqGTP = y(43);
	IP3 = y(44);
	CaMKII = y(45);
	F_actin = y(46);
	Merlin = y(47);
	ROCK = y(48);
	YAPTAZnuc = y(49);
	LIMK = y(50);
	JNK_p = y(51);
	L_GR_GqGDP = y(52);
	Myo_S = y(53);
	AKT = y(54);
	cPKC_Ca = y(55);
	Merlin_S = y(56);
	nPKC_DAG = y(57);
	cPKC_Ca_DAG_S = y(58);
	Arp23_S = y(59);
	LATS12 = y(60);
	mDia = y(61);
	aPKC = y(62);
	YAPTAZc = y(63);
	LaminAp = y(64);
	CaMKIIP = y(65);
	L_GR_GqGDP_P = y(66);
	Ca_CaM = y(67);
	YAPTAZcP = y(68);
	TGS = y(69);
	PP2Ac_S = y(70);
	RhoAGTP_MEM = y(71);
	CofilinP = y(72);
	cPKC = y(73);
	% Constants
	G_actin_init_uM = p(1);
	netValence_R6S = p(2);
	kdmdia = p(3);
	KmMSTPP2A_R48 = p(4);
	K11 = p(5);
	Kf1_R22 = p(6);
	RhoAGTP_MEM_init_molecules_um_2 = p(7);
	Kbas = p(8);
	Kf_R37 = p(9);
	Clam = p(10);
	Amp = p(11);
	Kf_R35 = p(12);
	Kf_R33 = p(13);
	CaMKII_init_uM = p(14);
	Kf_R31 = p(15);
	Kf_R30 = p(16);
	Ca_Ext_init_uM = p(17);
	PA_init_molecules_um_2 = p(18);
	mlabfix_F_ = p(19);
	Kf_R29 = p(20);
	netValence_R56 = p(21);
	netValence_R53 = p(22);
	netValence_R52 = p(23);
	Buffercyt_init_uM = p(24);
	unitconversionfactor = p(25);
	Kf_R9 = p(26);
	Kf_R8 = p(27);
	Kf_R7 = p(28);
	Kf_R6 = p(29);
	Kf_R5 = p(30);
	Kf_R4 = p(31);
	Kf_R3 = p(32);
	Kf_R2 = p(33);
	MST12_init_uM = p(34);
	Kf_R19 = p(35);
	Fakp_init_uM = p(36);
	Kf_R13 = p(37);
	Kf_R12 = p(38);
	Kf_R11 = p(39);
	netValence_R40 = p(40);
	Kf_R10 = p(41);
	IP30 = p(42);
	netValence_SOCE = p(43);
	mDia_S_init_uM = p(44);
	netValence_R38 = p(45);
	netValence_R37 = p(46);
	netValence_R36 = p(47);
	netValence_R34 = p(48);
	Kr_pyk = p(49);
	kr_R43 = p(50);
	Voltage_ERM = p(51);
	YAPTAZc_init_uM = p(52);
	TGS_init_uM = p(53);
	netValence_R19 = p(54);
	netValence_R18 = p(55);
	netValence_R15 = p(56);
	netValence_R14 = p(57);
	netValence_R13 = p(58);
	netValence_R12 = p(59);
	netValence_R11 = p(60);
	netValence_R10 = p(61);
	PLCB_GqGTP_init_molecules_um_2 = p(62);
	Kf_TRP = p(63);
	n_s = p(64);
	K_millivolts_per_volt = p(65);
	K_STIM1 = p(66);
	AKTPP_init_uM = p(67);
	LaminAp_init_molecules_um_2 = p(68);
	Myo_init_uM = p(69);
	KfArp = p(70);
	KflatsPP2A = p(71);
	n_P = p(72);
	Kr_R9 = p(73);
	Kr_R8 = p(74);
	Kr_R7 = p(75);
	Kr_R6 = p(76);
	Kr_R5 = p(77);
	Kr_R4 = p(78);
	Kr_R3 = p(79);
	Kr_R2 = p(80);
	netValence_R9 = p(81);
	netValence_R8 = p(82);
	netValence_R7 = p(83);
	netValence_R6 = p(84);
	netValence_R5 = p(85);
	netValence_R4 = p(86);
	netValence_R3 = p(87);
	netValence_R2 = p(88);
	netValence_R1 = p(89);
	Size_ECM = p(90);
	kfNPC = p(91);
	Km_s = p(92);
	Kf_CaM_R21 = p(93);
	NPC_init_molecules_um_2 = p(94);
	Kdg_IP3 = p(95);
	netValence_TRP = p(96);
	kdrock = p(97);
	Km_P = p(98);
	time_reg_P = p(99);
	KrhoA1 = p(100);
	Kcat_27 = p(101);
	Kcat_25 = p(102);
	PP2A = p(103);
	ROCK_init_uM = p(104);
	Kr_R6S = p(105);
	Kbasal_TRP = p(106);
	MST12P_init_uM = p(107);
	Pyk2_init_uM = p(108);
	nPKC_DAG_init_uM = p(109);
	Kf11LATS = p(110);
	PP1 = p(111);
	n_so = p(112);
	kfkp = p(113);
	TGSm_init_uM = p(114);
	Size_PM = p(115);
	Kr_R57 = p(116);
	Kr_R52 = p(117);
	krNPC = p(118);
	KfMST = p(119);
	PLCB_init_molecules_um_2 = p(120);
	KIP3_2 = p(121);
	KIP3_1 = p(122);
	Kr_R46 = p(123);
	Kr_R45 = p(124);
	Kr_R41 = p(125);
	Kr_R40 = p(126);
	Emol = p(127);
	Ca_Cyt_init_uM = p(128);
	Kf2_R57 = p(129);
	Size_NM = p(130);
	Kr_R39 = p(131);
	Kr_R38 = p(132);
	Kr_R37 = p(133);
	Kr_R36 = p(134);
	Kr_R35 = p(135);
	Kr_R34 = p(136);
	KmMSTPP2A = p(137);
	Kr_R33 = p(138);
	Kr_R31 = p(139);
	Kr_R30 = p(140);
	aPKC_init_uM = p(141);
	LIMK_S_init_uM = p(142);
	tau = p(143);
	Kf2_R42 = p(144);
	Kr_R29 = p(145);
	LATS12_P_init_uM = p(146);
	Kr_R26 = p(147);
	Kr_R22 = p(148);
	Kcat2 = p(149);
	cPKC_F_THR = p(150);
	Kcat1 = p(151);
	Ligand_init_uM = p(152);
	PIP2_init_molecules_um_2 = p(153);
	Kr_R19 = p(154);
	JNK_init_uM = p(155);
	alpha = p(156);
	Kr_R13 = p(157);
	Kr_R12 = p(158);
	Kr_R11 = p(159);
	Kr_R10 = p(160);
	PP1param = p(161);
	Kact_STIM1 = p(162);
	kin2 = p(163);
	kout2 = p(164);
	Kf2_R22 = p(165);
	KMOLE = p(166);
	cPKC_init_uM = p(167);
	GqGDP_init_molecules_um_2 = p(168);
	kNC = p(169);
	Kcat = p(170);
	Vmax_Serca = p(171);
	Kf_r1 = p(172);
	Fak_init_uM = p(173);
	KY = p(174);
	kf_ERleak = p(175);
	YAPTAZnuc_init_uM = p(176);
	cPKC_Ca_DAG_S_init_uM = p(177);
	netValence_PM_leak = p(178);
	KE = p(179);
	IP3_init_uM = p(180);
	L_GR_GqGDP_init_molecules_um_2 = p(181);
	F_actin_init_uM = p(182);
	kfc1 = p(183);
	KMST = p(184);
	kdmy = p(185);
	Kf_CaM = p(186);
	Kd_Buffer = p(187);
	Kf_STIM1 = p(188);
	Clamin = p(189);
	Km_R54 = p(190);
	Size_ER = p(191);
	PLCB_Ca_GqGTP_init_molecules_um_2 = p(192);
	Km_so = p(193);
	YAPTAZcP_init_uM = p(194);
	mDiaT = p(195);
	Kj_LATS = p(196);
	netValence_ER_leak = p(197);
	kf1_R43 = p(198);
	kf1_R42 = p(199);
	Size_Nuc = p(200);
	netValence_Serca_flux = p(201);
	LaminA_init_molecules_um_2 = p(202);
	Km_R27 = p(203);
	Km_R25 = p(204);
	Km_R23 = p(205);
	kmCof = p(206);
	netValence_PMCA = p(207);
	L_GR_init_molecules_um_2 = p(208);
	Kflam = p(209);
	PP2Ac_init_uM = p(210);
	TGS1 = p(211);
	v1 = p(212);
	TGS0 = p(213);
	kCY1 = p(214);
	ROCKT = p(215);
	KfMerlin = p(216);
	CaM_init_uM = p(217);
	kCY = p(218);
	kCN = p(219);
	Kdg_DAG = p(220);
	KmlatsPP2A = p(221);
	ksf = p(222);
	cPKC_Ca_DAG_init_uM = p(223);
	mDia_init_uM = p(224);
	GqGTP_init_molecules_um_2 = p(225);
	Size_Cyto = p(226);
	Kcat_R14 = p(227);
	mlabfix_PI_ = p(228);
	krp = p(229);
	mlabfix_N_pmol_ = p(230);
	Merlin_S_init_uM = p(231);
	kdep = p(232);
	kra = p(233);
	Merlin_init_uM = p(234);
	kturnover = p(235);
	Y_PMCA = p(236);
	Ca_ER_init_uM = p(237);
	SAV = p(238);
	kr2 = p(239);
	kr1 = p(240);
	Cofilin_init_uM = p(241);
	Kr_STIM1 = p(242);
	NPC_S_init_molecules_um_2 = p(243);
	KfMSTPP2A_R48 = p(244);
	Kf_26 = p(245);
	Arp23_S_init_uM = p(246);
	ne = p(247);
	KfMSTPP2A = p(248);
	ROCK_S_init_uM = p(249);
	kmr = p(250);
	kmp = p(251);
	n2 = p(252);
	AKT_init_uM = p(253);
	kf_PMleak = p(254);
	kly = p(255);
	kll = p(256);
	kr = p(257);
	mlabfix_T_ = p(258);
	cPKC_Ca_init_uM = p(259);
	Kr_CaM = p(260);
	kf = p(261);
	gamma = p(262);
	CF_R15 = p(263);
	CF_R14 = p(264);
	K_TRP = p(265);
	nPKC_init_uM = p(266);
	Km_Serca = p(267);
	PP2Ac_S_init_uM = p(268);
	Kf_pyk = p(269);
	L_GR_GqGDP_P_init_molecules_um_2 = p(270);
	Kf2_LATS = p(271);
	mlabfix_R_ = p(272);
	Arp23_init_uM = p(273);
	Km2 = p(274);
	Km1 = p(275);
	KfTG = p(276);
	RhoAGDP_init_uM = p(277);
	mlabfix_F_nmol_ = p(278);
	GR_init_molecules_um_2 = p(279);
	netValence_IP3R = p(280);
	LATS12_init_uM = p(281);
	Ca_CaM_init_uM = p(282);
	LIMK_init_uM = p(283);
	Pyk2_p_init_uM = p(284);
	CofilinP_init_uM = p(285);
	Kr_CaM_R21 = p(286);
	epsilon = p(287);
	JNK_p_init_uM = p(288);
	Size_ERM = p(289);
	kinSolo2 = p(290);
	Voltage_PM = p(291);
	Buffercyt_Ca_init_uM = p(292);
	Kf3_LATS = p(293);
	Kc_LATS = p(294);
	CaMKIIP_init_uM = p(295);
	PLCB_Ca_init_molecules_um_2 = p(296);
	GR_GqGDP_init_molecules_um_2 = p(297);
	Krfn = p(298);
	Kfn = p(299);
	kf3 = p(300);
	kdp = p(301);
	kf2 = p(302);
	kf1 = p(303);
	C_TRP = p(304);
	Ymax_SOCE = p(305);
	v1_IP3R = p(306);
	kdf = p(307);
	Voltage_NM = p(308);
	DAG_init_uM = p(309);
	TG_init_uM = p(310);
	Y = p(311);
	mlabfix_K_GHK_ = p(312);
	d4 = p(313);
	d3 = p(314);
	d2 = p(315);
	d1 = p(316);
	Kf3 = p(317);
	RRR = p(318);
	C = p(319);
	Kf1_R57 = p(320);
	Vmax_s = p(321);
	KbasalMSTPdeg = p(322);
	sc1 = p(323);
	Kmit = p(324);
	Kf_Buffer = p(325);
	Vmax_P = p(326);
	kcatcof = p(327);
	Myo_S_init_uM = p(328);
	k11 = p(329);
	% Functions
	Kf_R46 = (KfArp .* CaMKIIP);
	Kf_R45 = (KfMerlin .* Ca_Cyt .* F_actin);
	Kf_R44 = kturnover;
	Kf_R43 = ((kf1_R43 .* (1.0 + (0.5 .* tau .* (1.0 + tanh((20.0 .* (ROCK_S - ROCKT)))) .* ROCK_S))) + (kf2 .* CaMKIIP));
	Kf_R42 = ((kf1_R42 .* (1.0 + (0.5 .* alpha .* (1.0 + tanh((20.0 .* (mDia_S - mDiaT)))) .* mDia_S))) + (Arp23_S .* Kf2_R42) + (Ca_Cyt .* Kf3));
	Kf_R41 = kdmdia;
	Kf_R40 = (kmp .* RhoAGTP_MEM);
	PIP2 = PIP2_init_molecules_um_2;
	Kf_R39 = kdrock;
	Kf_R38 = (krp .* RhoAGTP_MEM);
	Kf_R36 = ((kfkp .* (1.0 + (gamma .* (Fakp ^ n2))) .* unitconversionfactor .* SAV) + (KrhoA1 .* Pyk2_p));
	Kf_R34 = (ksf .* Emol .* unitconversionfactor .* SAV ./ (C + Emol));
	Kf_R32 = (Kfn .* F_actin);
	Kf_R28 = (Kf_pyk .* CaMKIIP);
	Kf_R26 = (Kf_26 .* Ca_Cyt);
	Kf_R22 = ((Kf1_R22 .* CaMKIIP) + (Kf2_R22 .* Fakp));
	Kf_R20 = Kf_Buffer;
	Kf_R1 = Kf_r1;
	Kr_R1 = (0.0015 .* Kf_r1);
	TGdose = TG;
	KFlux_PM_Cyto = (Size_PM ./ Size_Cyto);
	Kf_R6S = RRR;
	J_R6S = ((Kf_R6S .* L_GR_GqGDP_P) - (((Kr_R6S .* Ligand) .* GR) .* GqGDP));
	Kr_R58 = (4.0 .* Kbas);
	Kf_R58 = ((KfTG .* TGdose) + Kbas);
	J_R58 = ((Kf_R58 .* TGS) - (Kr_R58 .* TGSm));
	Kf_R57 = ((Kf1_R57 .* Ligand) + kf3 + (Kf2_R57 .* TG));
	J_R57 = ((Kf_R57 .* PP2Ac) - (Kr_R57 .* PP2Ac_S));
	Kr_R56 = kout2;
	Kf_R56 = ((kin2 .* NPC_S) + kinSolo2);
	J_R56 = ((Kf_R56 .* YAPTAZc) - (Kr_R56 .* YAPTAZnuc));
	Kr_R55 = kNC;
	Kf_R55 = (kCY1 .* (Myo_S .* F_actin));
	J_R55 = ((Kf_R55 .* YAPTAZcP) - (Kr_R55 .* YAPTAZc));
	Vmax_R54 = (KY .* LATS12_P);
	J_R54 = ((Vmax_R54 .* YAPTAZc) ./ (Km_R54 + YAPTAZc));
	Kr_R53 = krNPC;
	Kf_R53 = (kfNPC .* Myo_S .* F_actin .* LaminA);
	J_R53 = ((Kf_R53 .* NPC) - (Kr_R53 .* NPC_S));
	Ecyt = (KE .* (F_actin ^ ne));
	Kf_R52 = ((Kflam .* Ecyt) ./ (Clam + Ecyt));
	J_R52 = ((Kf_R52 .* LaminAp) - (Kr_R52 .* LaminA));
	Kr_R51 = kdmy;
	Kf_R51 = (kmr .* (1.0 + (0.5 .* epsilon .* (1.0 + tanh((sc1 .* (ROCK_S - ROCKT)))) .* ROCK_S)));
	J_R51 = ((Kf_R51 .* Myo) - (Kr_R51 .* Myo_S));
	Vmax_R50 = (KflatsPP2A .* PP2Ac_S);
	Km_R50 = KmlatsPP2A;
	J_R50 = ((Vmax_R50 .* LATS12_P) ./ (Km_R50 + LATS12_P));
	Km_R49 = ((Kj_LATS .* JNK_p) + (Kc_LATS .* cPKC_Ca_DAG_S));
	Kf1_LATS = (Kf11LATS ./ aPKC);
	Vmax_R49 = ((Kf2_LATS .* Merlin_S) + (Kf3_LATS .* nPKC_DAG) + (Kf1_LATS .* MST12P));
	J_R49 = ((Vmax_R49 .* LATS12) ./ (Km_R49 + LATS12));
	Vmax_R48 = (KfMSTPP2A_R48 .* PP2Ac_S);
	Km_R48 = KmMSTPP2A_R48;
	J_R48 = ((Vmax_R48 .* MST12P) ./ (Km_R48 + MST12P));
	Vmax_R47 = ((KfMST .* (cPKC_Ca_DAG_S - cPKC_F_THR)) .* (cPKC_Ca_DAG_S > cPKC_F_THR));
	Km_R47 = (KbasalMSTPdeg + AKTPP);
	J_R47 = ((Vmax_R47 .* MST12) ./ (Km_R47 + MST12));
	J_R46 = ((Kf_R46 .* Arp23) - (Kr_R46 .* Arp23_S));
	J_R45 = ((Kf_R45 .* Merlin) - (Kr_R45 .* Merlin_S));
	Kr_R44 = (kcatcof .* LIMK_S ./ (kmCof + Cofilin));
	J_R44 = ((Kf_R44 .* CofilinP) - (Kr_R44 .* Cofilin));
	Kr_R43 = kr_R43;
	J_R43 = ((Kf_R43 .* LIMK) - (Kr_R43 .* LIMK_S));
	Kr_R42 = (kr1 + (kr2 .* Cofilin));
	J_R42 = ((Kf_R42 .* G_actin) - (Kr_R42 .* F_actin));
	J_R41 = ((Kf_R41 .* mDia_S) - (Kr_R41 .* mDia));
	J_R40 = ((Kf_R40 .* mDia) - (Kr_R40 .* mDia_S));
	J_R39 = ((Kf_R39 .* ROCK_S) - (Kr_R39 .* ROCK));
	J_R38 = ((Kf_R38 .* ROCK) - (Kr_R38 .* ROCK_S));
	J_R37 = ((Kf_R37 .* RhoAGTP_MEM) - (Kr_R37 .* RhoAGDP));
	J_R36 = ((Kf_R36 .* RhoAGDP) - (Kr_R36 .* RhoAGTP_MEM));
	J_R35 = ((Kf_R35 .* Fakp) - (Kr_R35 .* Fak));
	J_R34 = ((Kf_R34 .* Fak) - (Kr_R34 .* Fakp));
	J_R33 = ((Kf_R33 .* Fak) - (Kr_R33 .* Fakp));
	Kr_R32 = Krfn;
	J_R32 = ((Kf_R32 .* cPKC_Ca_DAG) - (Kr_R32 .* cPKC_Ca_DAG_S));
	J_R31 = (((Kf_R31 .* DAG) .* cPKC_Ca) - (Kr_R31 .* cPKC_Ca_DAG));
	J_R30 = (((Kf_R30 .* Ca_Cyt) .* cPKC) - (Kr_R30 .* cPKC_Ca));
	J_R29 = (((Kf_R29 .* nPKC) .* DAG) - (Kr_R29 .* nPKC_DAG));
	Kr_R28 = Kr_pyk;
	J_R28 = ((Kf_R28 .* Pyk2) - (Kr_R28 .* Pyk2_p));
	Vmax_R27 = (Kcat_27 .* PP2Ac_S);
	J_R27 = ((Vmax_R27 .* JNK_p) ./ (Km_R27 + JNK_p));
	J_R26 = ((Kf_R26 .* JNK) - (Kr_R26 .* JNK_p));
	Vmax_R25 = (Kcat_25 .* PP1);
	J_R25 = ((Vmax_R25 .* CaMKIIP) ./ (Km_R25 + CaMKIIP));
	J_R24 = (((Kcat1 .* (Ca_CaM ^ 4.0) .* CaMKII) ./ ((Km1 ^ 4.0) + (Ca_CaM ^ 4.0))) + ((Kcat2 .* CaMKIIP .* CaMKII) ./ (Km2 + CaMKII)));
	Vmax_R23 = (Kcat .* PP2Ac_S);
	J_R23 = ((Vmax_R23 .* AKTPP) ./ (Km_R23 + AKTPP));
	J_R22 = ((Kf_R22 .* AKT) - (Kr_R22 .* AKTPP));
	Kr_R21 = Kr_CaM_R21;
	kf_R21 = Kf_CaM_R21;
	J_R21 = ((kf_R21 .* (Ca_Cyt ^ 4.0) .* CaM) - (Kr_R21 .* Ca_CaM));
	Kr_R20 = (Kf_Buffer .* Kd_Buffer);
	J_R20 = (((Kf_R20 .* Ca_Cyt) .* Buffercyt) - (Kr_R20 .* Buffercyt_Ca));
	J_PMCA = ( - Y_PMCA .* ((Vmax_P .* (Ca_Cyt ^ n_P)) ./ ((Ca_Cyt ^ n_P) + (Km_P ^ n_P))));
	J_R19 = ((Kf_R19 .* PA) - (Kr_R19 .* DAG));
	J_R18 = (K11 .* Ligand);
	J_R17 = (Kdg_DAG .* DAG);
	J_R16 = (Kdg_IP3 .* IP3);
	Vmax_R15 = (KIP3_2 .* PLCB_Ca_GqGTP);
	Km_R15 = (5.0 ./ CF_R15);
	J_R15 = ((Vmax_R15 .* PIP2) ./ (Km_R15 + PIP2));
	Vmax_R14 = (KIP3_1 .* PLCB_Ca);
	Km_R14 = (19.8 ./ CF_R14);
	J_R14 = ((Vmax_R14 .* PIP2) ./ (Km_R14 + PIP2));
	J_R13 = ((Kf_R13 .* PLCB_GqGTP) - ((Kr_R13 .* GqGDP) .* PLCB));
	J_R12 = ((Kf_R12 .* PLCB_Ca_GqGTP) - ((Kr_R12 .* GqGDP) .* PLCB_Ca));
	J_R11 = (((Kf_R11 .* Ca_Cyt) .* PLCB_GqGTP) - (Kr_R11 .* PLCB_Ca_GqGTP));
	J_R10 = (((Kf_R10 .* GqGTP) .* PLCB_Ca) - (Kr_R10 .* PLCB_Ca_GqGTP));
	KFlux_ERM_ER = (Size_ERM ./ Size_ER);
	J_TRP = ((Kf_TRP .* Emol ./ (C_TRP + Emol)) .* (Ca_Ext - Ca_Cyt));
	KFlux_PM_ECM = (Size_PM ./ Size_ECM);
	X_Serca_flux = ((TGS - TGS0) .* (TGS > TGS0));
	J_Serca_flux = (X_Serca_flux .* (Vmax_s .* (Ca_Cyt ^ n_s)) ./ ((Ca_Cyt ^ n_s) + (Km_s ^ n_s)));
	J_PM_leak = ((Amp .* kf_PMleak .* (Ca_Ext - Ca_Cyt)) - (Kmit .* (TGSm - TGS1) .* (TGSm > TGS1)));
	KFlux_ERM_Cyto = (Size_ERM ./ Size_Cyto);
	J_IP3R = ((v1_IP3R .* (((Ca_Cyt .* IP3 .* d2) ./ (((Ca_Cyt .* IP3) + (IP3 .* d2) + (d1 .* d2) + (Ca_Cyt .* d3)) .* (Ca_Cyt + d4))) ^ 3.0)) .* (Ca_Cyt - Ca_ER));
	J_R9 = (((Kf_R9 .* PLCB) .* Ca_Cyt) - (Kr_R9 .* PLCB_Ca));
	J_R8 = (((Kf_R8 .* PLCB) .* GqGTP) - (Kr_R8 .* PLCB_GqGTP));
	J_R7 = ((Kf_R7 .* GqGTP) - (Kr_R7 .* GqGDP));
	J_R6 = ((Kf_R6 .* L_GR_GqGDP) - (Kr_R6 .* L_GR_GqGDP_P));
	J_R5 = ((Kf_R5 .* L_GR_GqGDP) - ((Kr_R5 .* L_GR) .* GqGTP));
	J_R4 = (((Kf_R4 .* Ligand) .* GR_GqGDP) - (Kr_R4 .* L_GR_GqGDP));
	J_R3 = (((Kf_R3 .* GqGDP) .* GR) - (Kr_R3 .* GR_GqGDP));
	J_R2 = (((Kf_R2 .* GqGDP) .* L_GR) - (Kr_R2 .* L_GR_GqGDP));
	J_R1 = (((Kf_R1 .* Ligand) .* GR) - (Kr_R1 .* L_GR));
	KFlux_NM_Cyto = (Size_NM ./ Size_Cyto);
	J_ER_leak = (kf_ERleak .* (Ca_Cyt - Ca_ER));
	KFlux_NM_Nuc = (Size_NM ./ Size_Nuc);
	J_SOCE = ((Ymax_SOCE .* (1.0 - (1.0 ./ (1.0 + ((Km_so ./ Ca_ER) ^ n_so))))) .* (Ca_Ext - Ca_Cyt));
	UnitFactor_uM_um3_molecules_neg_1 = (1000000.0 ./ 6.02214179E8);
	X = (0.4 - TGSm);
	% Rates
	dydt = [
		J_R52;    % rate for LaminA
		(J_R1 - J_R2 + J_R5);    % rate for L_GR
		 - J_R21;    % rate for CaM
		( - J_R26 + J_R27);    % rate for JNK
		((UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R15) + (UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R14) - J_R17 - J_R31 - J_R29 + (UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R19));    % rate for DAG
		( - J_R47 + J_R48);    % rate for MST12
		(J_R8 - J_R11 - J_R13);    % rate for PLCB_GqGTP
		( - (KFlux_PM_ECM .* J_TRP) - (KFlux_PM_ECM .* J_PMCA) - (KFlux_PM_ECM .* J_SOCE) - (KFlux_PM_ECM .* J_PM_leak));    % rate for Ca_Ext
		(J_R5 - J_R7 - J_R8 - J_R10);    % rate for GqGTP
		( - J_R50 + J_R49);    % rate for LATS12_P
		( - (UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R34) + J_R35 - J_R33);    % rate for Fak
		J_R44;    % rate for Cofilin
		(J_R3 - J_R4);    % rate for GR_GqGDP
		0.0;    % rate for TG
		 - J_R51;    % rate for Myo
		 - J_R57;    % rate for PP2Ac
		((UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R38) - J_R39);    % rate for ROCK_S
		( - (UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_ECM .* J_R1) - (UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_ECM .* J_R4) + (UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_ECM .* J_R6S));    % rate for Ligand
		( - (UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R9) - (UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R11) - J_R30 - J_R20 - J_R21 - (KFlux_ERM_Cyto .* J_ER_leak) - (KFlux_ERM_Cyto .* J_IP3R) - (KFlux_ERM_Cyto .* J_Serca_flux) + (KFlux_PM_Cyto .* J_TRP) + (KFlux_PM_Cyto .* J_PMCA) + (KFlux_PM_Cyto .* J_SOCE) + (KFlux_PM_Cyto .* J_PM_leak));    % rate for Ca_Cyt
		(J_R9 - J_R10 + J_R12);    % rate for PLCB_Ca
		( - J_R19 + J_R18);    % rate for PA
		J_R53;    % rate for NPC_S
		 - J_R42;    % rate for G_actin
		( - J_R8 - J_R9 + J_R13);    % rate for PLCB
		(J_R22 - J_R23);    % rate for AKTPP
		 - J_R28;    % rate for Pyk2
		( - J_R2 - J_R3 + J_R7 + J_R12 + J_R13 + J_R6S);    % rate for GqGDP
		((UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R40) - J_R41);    % rate for mDia_S
		J_R28;    % rate for Pyk2_p
		((KFlux_ERM_ER .* J_ER_leak) + (KFlux_ERM_ER .* J_IP3R) + (KFlux_ERM_ER .* J_Serca_flux));    % rate for Ca_ER
		((UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R34) - J_R35 + J_R33);    % rate for Fakp
		 - J_R29;    % rate for nPKC
		((UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R37) - (UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R36));    % rate for RhoAGDP
		 - J_R53;    % rate for NPC
		( - J_R1 - J_R3 + J_R6S);    % rate for GR
		J_R20;    % rate for Buffercyt_Ca
		J_R58;    % rate for TGSm
		(J_R47 - J_R48);    % rate for MST12P
		J_R43;    % rate for LIMK_S
		 - J_R20;    % rate for Buffercyt
		 - J_R46;    % rate for Arp23
		(J_R31 - J_R32);    % rate for cPKC_Ca_DAG
		(J_R10 + J_R11 - J_R12);    % rate for PLCB_Ca_GqGTP
		((UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R15) + (UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R14) - J_R16);    % rate for IP3
		( - J_R24 + J_R25);    % rate for CaMKII
		J_R42;    % rate for F_actin
		 - J_R45;    % rate for Merlin
		( - (UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R38) + J_R39);    % rate for ROCK
		(UnitFactor_uM_um3_molecules_neg_1 .* KFlux_NM_Nuc .* J_R56);    % rate for YAPTAZnuc
		 - J_R43;    % rate for LIMK
		(J_R26 - J_R27);    % rate for JNK_p
		(J_R2 + J_R4 - J_R5 - J_R6);    % rate for L_GR_GqGDP
		J_R51;    % rate for Myo_S
		( - J_R22 + J_R23);    % rate for AKT
		(J_R30 - J_R31);    % rate for cPKC_Ca
		J_R45;    % rate for Merlin_S
		J_R29;    % rate for nPKC_DAG
		J_R32;    % rate for cPKC_Ca_DAG_S
		J_R46;    % rate for Arp23_S
		(J_R50 - J_R49);    % rate for LATS12
		( - (UnitFactor_uM_um3_molecules_neg_1 .* KFlux_PM_Cyto .* J_R40) + J_R41);    % rate for mDia
		0.0;    % rate for aPKC
		(J_R55 - (UnitFactor_uM_um3_molecules_neg_1 .* KFlux_NM_Cyto .* J_R56) - J_R54);    % rate for YAPTAZc
		 - J_R52;    % rate for LaminAp
		(J_R24 - J_R25);    % rate for CaMKIIP
		(J_R6 - J_R6S);    % rate for L_GR_GqGDP_P
		J_R21;    % rate for Ca_CaM
		( - J_R55 + J_R54);    % rate for YAPTAZcP
		 - J_R58;    % rate for TGS
		J_R57;    % rate for PP2Ac_S
		( - J_R37 + J_R36);    % rate for RhoAGTP_MEM
		 - J_R44;    % rate for CofilinP
		 - J_R30;    % rate for cPKC
	];
end
