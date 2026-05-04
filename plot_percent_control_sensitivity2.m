// Copyright (c) 2026 Malak Damdoum
// Licensed under the MIT License. See LICENSE file for details.
close all
clear
clc

%% 1) QBH4 CONTROL VALUE
% basecase QBH4 = 10 nM/s
% percent control values:
% 0.1, 0.5, 1, 5, 10 nM/s = 1, 5, 10, 50, 100%
% extra 125,150,175,200%

PercentControl_Q = [50 75 100 125 150 175 200];

BH4_ss_Q   = [2.62768E-06 5.48961E-06 1.13049E-05 2.46998E-05 5.12217E-05 8.91704E-05 1.33883E-04];
BH2_ss_Q   = [6.27026E-13 1.30995E-12 2.69761E-12 5.89394E-12 1.22227E-11 2.12781E-11 3.19476E-11];
Ldopa_ss_Q = [2.15991E-07 3.03761E-07 3.78383E-07 4.34720E-07 4.65732E-07 4.79446E-07 4.85926E-07];
cDA_ss_Q   = [7.01952E-09 9.87464E-09 1.23033E-08 1.41375E-08 1.51476E-08 1.55943E-08 1.58053E-08];
vDA_Q      = [1.84393E-04 2.61834E-04 3.29246E-04 3.83174E-04 4.20086E-04 4.43408E-04 4.58654E-04];

Peak_Ldopa_Q = [1.20429E-07 1.21117E-07 1.21798E-07 1.22472E-07 1.23140E-07 1.23801E-07 1.24456E-07];
Peak_cDA_Q   = [3.87129E-09 3.89271E-09 3.91392E-09 3.93493E-09 3.95573E-09 3.97635E-09 3.99677E-09];
AUC_Ldopa_Q  = [3.76811E-06 3.78963E-06 3.81094E-06 3.83204E-06 3.85293E-06 3.87363E-06 3.89412E-06];
AUC_cDA_Q    = [1.21129E-07 1.21799E-07 1.22463E-07 1.23120E-07 1.23771E-07 1.24416E-07 1.25055E-07];

% normalize to 100% control
BH4_ss_Q_n   = BH4_ss_Q   / BH4_ss_Q(PercentControl_Q==100);
BH2_ss_Q_n   = BH2_ss_Q   / BH2_ss_Q(PercentControl_Q==100);
Ldopa_ss_Q_n = Ldopa_ss_Q / Ldopa_ss_Q(PercentControl_Q==100);
cDA_ss_Q_n   = cDA_ss_Q   / cDA_ss_Q(PercentControl_Q==100);
vDA_Q_n      = vDA_Q      / vDA_Q(PercentControl_Q==100);

Peak_Ldopa_Q_n = Peak_Ldopa_Q / Peak_Ldopa_Q(PercentControl_Q==100);
Peak_cDA_Q_n   = Peak_cDA_Q   / Peak_cDA_Q(PercentControl_Q==100);
AUC_Ldopa_Q_n  = AUC_Ldopa_Q  / AUC_Ldopa_Q(PercentControl_Q==100);
AUC_cDA_Q_n    = AUC_cDA_Q    / AUC_cDA_Q(PercentControl_Q==100);

%% 2) INITIAL BH4 CONTROL VALUE
% basecase initial BH4 = 10 uM
% 1,10,25,50,100 uM = 10,100,250,500,1000%

PercentControl_BH4init = [10 100 250 500 1000];

Peak_Ldopa_BH4init = [2.58225E-08 1.21798E-07 1.85828E-07 2.24625E-07 2.50051E-07];
Peak_cDA_BH4init   = [8.27758E-10 3.91392E-09 5.96759E-09 7.21180E-09 8.02768E-09];
AUC_Ldopa_BH4init  = [8.07964E-07 3.81094E-06 5.81441E-06 7.02832E-06 7.82386E-06];
AUC_cDA_BH4init    = [2.58998E-08 1.22463E-07 1.86721E-07 2.25651E-07 2.51179E-07];

Ldopa_ss_BH4init = [3.78398E-07 3.78383E-07 3.78356E-07 3.78303E-07 3.78163E-07];
cDA_ss_BH4init   = [1.23038E-08 1.23033E-08 1.23024E-08 1.23007E-08 1.22961E-08];
vDA_BH4init      = [3.28292E-04 3.29246E-04 3.30953E-04 3.34136E-04 3.41809E-04];

Peak_Ldopa_BH4init_n = Peak_Ldopa_BH4init / Peak_Ldopa_BH4init(PercentControl_BH4init==100);
Peak_cDA_BH4init_n   = Peak_cDA_BH4init   / Peak_cDA_BH4init(PercentControl_BH4init==100);
AUC_Ldopa_BH4init_n  = AUC_Ldopa_BH4init  / AUC_Ldopa_BH4init(PercentControl_BH4init==100);
AUC_cDA_BH4init_n    = AUC_cDA_BH4init    / AUC_cDA_BH4init(PercentControl_BH4init==100);

Ldopa_ss_BH4init_n = Ldopa_ss_BH4init / Ldopa_ss_BH4init(PercentControl_BH4init==100);
cDA_ss_BH4init_n   = cDA_ss_BH4init   / cDA_ss_BH4init(PercentControl_BH4init==100);
vDA_BH4init_n      = vDA_BH4init      / vDA_BH4init(PercentControl_BH4init==100);

%% 3) SUPEROXIDE CONTROL VALUE
% base case superoxide = 1 pM
% 1,10,100,1000,10000 pM = 100,1000,10000,100000,1000000%

PercentControl_Sup = [100 1000 10000 100000 1000000];

BH4_ss_S   = [1.13049E-05 1.11723E-05 1.00648E-05 5.84491E-06 1.64355E-06];
BH2_ss_S   = [2.69761E-12 2.92310E-12 4.94858E-12 1.62848E-11 4.20903E-11];
Ldopa_ss_S = [3.78383E-07 3.77323E-07 3.67681E-07 3.10765E-07 1.62667E-07];
cDA_ss_S   = [1.23033E-08 1.22688E-08 1.19549E-08 1.01025E-08 5.28566E-09];
vDA_S      = [3.29246E-04 3.28530E-04 3.21826E-04 2.77426E-04 1.47655E-04];

BH4_ss_S_n   = BH4_ss_S   / BH4_ss_S(PercentControl_Sup==100);
BH2_ss_S_n   = BH2_ss_S   / BH2_ss_S(PercentControl_Sup==100);
Ldopa_ss_S_n = Ldopa_ss_S / Ldopa_ss_S(PercentControl_Sup==100);
cDA_ss_S_n   = cDA_ss_S   / cDA_ss_S(PercentControl_Sup==100);
vDA_S_n      = vDA_S      / vDA_S(PercentControl_Sup==100);

%% COMBINED 2x2 FIGURE
fig = figure('Color','w','Name','Sensitivity Figure','Position',[100 100 1300 950]);
tiledlayout(2,2,'TileSpacing','compact','Padding','compact');

% ---------------- Top left: A ----------------
ax1 = nexttile;
plot(PercentControl_BH4init, Peak_Ldopa_BH4init_n, '-o', 'LineWidth', 1.8, 'MarkerSize', 6); hold on
plot(PercentControl_BH4init, Peak_cDA_BH4init_n,   '-s', 'LineWidth', 1.8, 'MarkerSize', 6)
plot(PercentControl_BH4init, AUC_Ldopa_BH4init_n,  '-^', 'LineWidth', 1.8, 'MarkerSize', 6)
plot(PercentControl_BH4init, AUC_cDA_BH4init_n,    '-d', 'LineWidth', 1.8, 'MarkerSize', 6)
xlabel('% Control Value')
ylabel('Normalized transient metric')
title('Sensitivity to initial BH_4 concentration')
text(ax1,0.02,0.98,'A','Units','normalized', ...
    'HorizontalAlignment','left','VerticalAlignment','top', ...
    'FontWeight','bold','FontSize',14)
legend('Peak L-dopa (0-120 min)','Peak cDA (0-120 min)', ...
       'AUC L-dopa (0-120 min)','AUC cDA (0-120 min)', ...
       'Location','best')
grid on
xlim([0 1050])
box on

% ---------------- Top right: B ----------------
ax2 = nexttile;
plot(PercentControl_Q, BH4_ss_Q_n,   '-o', 'LineWidth', 1.8, 'MarkerSize', 6); hold on
plot(PercentControl_Q, Ldopa_ss_Q_n, '-s', 'LineWidth', 1.8, 'MarkerSize', 6)
plot(PercentControl_Q, cDA_ss_Q_n,   '-^', 'LineWidth', 1.8, 'MarkerSize', 6)
plot(PercentControl_Q, vDA_Q_n,      '-d', 'LineWidth', 1.8, 'MarkerSize', 6)
xlabel('% Control Value')
ylabel('Normalized steady-state output')
title('Sensitivity to Q_{BH4}')
text(ax2,0.02,0.98,'B','Units','normalized', ...
    'HorizontalAlignment','left','VerticalAlignment','top', ...
    'FontWeight','bold','FontSize',14)
legend('BH4_{ss}','L-dopa_{ss}','cDA_{ss}','vDA_{final}','Location','best')
grid on
xlim([45 205])
box on

% ---------------- Bottom left: C ----------------
ax3 = nexttile;
semilogx(PercentControl_Sup, BH4_ss_S_n,   '-o', 'LineWidth', 1.8, 'MarkerSize', 6); hold on
semilogx(PercentControl_Sup, BH2_ss_S_n,   '-x', 'LineWidth', 1.8, 'MarkerSize', 6)
semilogx(PercentControl_Sup, Ldopa_ss_S_n, '-s', 'LineWidth', 1.8, 'MarkerSize', 6)
semilogx(PercentControl_Sup, cDA_ss_S_n,   '-^', 'LineWidth', 1.8, 'MarkerSize', 6)
semilogx(PercentControl_Sup, vDA_S_n,      '-d', 'LineWidth', 1.8, 'MarkerSize', 6)
xlabel('% Control Value')
ylabel('Normalized steady-state output')
title('Sensitivity to superoxide concentration')
text(ax3,0.02,0.98,'C','Units','normalized', ...
    'HorizontalAlignment','left','VerticalAlignment','top', ...
    'FontWeight','bold','FontSize',14)
legend('BH4_{ss}','BH2_{ss}','L-dopa_{ss}','cDA_{ss}','vDA_{final}','Location','best')
grid on
xlim([80 1.2e6])
box on

% ---------------- Bottom right: D ----------------
ax4 = nexttile;
plot(PercentControl_BH4init, Ldopa_ss_BH4init_n, '-o', 'LineWidth', 1.8, 'MarkerSize', 6); hold on
plot(PercentControl_BH4init, cDA_ss_BH4init_n,   '-s', 'LineWidth', 1.8, 'MarkerSize', 6)
plot(PercentControl_BH4init, vDA_BH4init_n,      '-d', 'LineWidth', 1.8, 'MarkerSize', 6)
xlabel('% Control Value')
ylabel('Normalized steady-state output')
title('Steady-state sensitivity to initial BH_4')
text(ax4,0.02,0.98,'D','Units','normalized', ...
    'HorizontalAlignment','left','VerticalAlignment','top', ...
    'FontWeight','bold','FontSize',14)
legend('L-dopa_{ss}','cDA_{ss}','vDA_{final}','Location','best')
grid on
xlim([0 1050])
box on

exportgraphics(fig,'sensitfigure.png','Resolution',600);

%% NORMALIZED DATA TO EXCEL
T_Q = table(PercentControl_Q(:), BH4_ss_Q_n(:), Ldopa_ss_Q_n(:), cDA_ss_Q_n(:), vDA_Q_n(:), ...
    'VariableNames', {'PercentControl','BH4_ss_norm','Ldopa_ss_norm','cDA_ss_norm','vDA_final_norm'});
writetable(T_Q, 'Normalized_Qbh4_PercentControl.xlsx');

T_BH4init_transient = table(PercentControl_BH4init(:), Peak_Ldopa_BH4init_n(:), Peak_cDA_BH4init_n(:), ...
    AUC_Ldopa_BH4init_n(:), AUC_cDA_BH4init_n(:), ...
    'VariableNames', {'PercentControl','Peak_Ldopa_norm','Peak_cDA_norm','AUC_Ldopa_norm','AUC_cDA_norm'});
writetable(T_BH4init_transient, 'Normalized_InitialBH4_Transient_PercentControl.xlsx');

T_BH4init_ss = table(PercentControl_BH4init(:), Ldopa_ss_BH4init_n(:), cDA_ss_BH4init_n(:), vDA_BH4init_n(:), ...
    'VariableNames', {'PercentControl','Ldopa_ss_norm','cDA_ss_norm','vDA_final_norm'});
writetable(T_BH4init_ss, 'Normalized_InitialBH4_SteadyState_PercentControl.xlsx');

T_Sup = table(PercentControl_Sup(:), BH4_ss_S_n(:), BH2_ss_S_n(:), Ldopa_ss_S_n(:), cDA_ss_S_n(:), vDA_S_n(:), ...
    'VariableNames', {'PercentControl','BH4_ss_norm','BH2_ss_norm','Ldopa_ss_norm','cDA_ss_norm','vDA_final_norm'});
writetable(T_Sup, 'Normalized_Superoxide_PercentControl.xlsx');

fprintf('\nSaved combined figure:\n');
fprintf('  sensitfigure.png\n');

fprintf('\nSaved normalized tables:\n');
fprintf('  Normalized_Qbh4_PercentControl.xlsx\n');
fprintf('  Normalized_InitialBH4_Transient_PercentControl.xlsx\n');
fprintf('  Normalized_InitialBH4_SteadyState_PercentControl.xlsx\n');
fprintf('  Normalized_Superoxide_PercentControl.xlsx\n');
