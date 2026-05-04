// Copyright © 2026 Malak Damdoum. All rights reserved.
  // This code is proprietary and confidential.
  // Unauthorized use is prohibited.
function noDevalTest
close all
clear all
clc
 
%Defining Mass matrix
M=zeros(16,16);
M(1,1)=1;
M(2,2)=1;
M(3,3)=1;
M(4,4)=1;
M(5,5)=0;
M(6,6)=1;
M(7,7)=1;
M(8,8)=1;
M(9,9)=1;
M(10,10)=1;
M(11,11)=1;
M(12,12)=1;
M(13,13)=1;
M(14,14)=1;
M(15,15)=1;
M(16,16)=1;
 
Cth= 17.6e-9;


% Defining the ODE parameters and solver
 
%     E11    E12  E13  E14    E15  E16   Tyr  pool     BH4    4a-PH3   *BH3   BH2   qBH2 ldopa cDa vDa  
%x0=[17.6e-9 0e-9 0e-9 0e-9 0e-9 0e-9 100e-6 100e-6 0e-12 0e-12 0e-12 0e-12 0e-12 0e-12 0e-12];  %intial values at t=0
x0=[Cth*0.5 Cth*0.1 Cth*0.1 Cth*0.1 Cth*0.1 Cth*0.1 100e-6 1e-15 10e-6 1e-15 1e-15 1e-15 1e-15 1e-15 1e-15 1e-15];
%x0=[50e-9 10e-9 10e-9 10e-9 10e-9 10e-9 100e-6 100e-6 0e-12 0e-12 0e-12 0e-12 0e-12 0e-12 0e-12];  %intial values at t=0
 
%options=odeset('Mass',M,'MstateDependence','strong','RelTol',1e-12,'AbsTol',[1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10],'Vectorized','off');
%options=odeset('Mass',M,'MstateDependence','strong','RelTol',1e-12,'AbsTol',[1e-15 1e-15 1e-15 1e-15 1e-15 1e-15 1e-15 1e-15 1e-15 1e-15 1e-15 1e-15 1e-15 1e-15 ],'Vectorized','off');
options=odeset('Mass',M,'MstateDependence','strong','RelTol',1e-15,'AbsTol',[1e-8 1e-8 1e-8 1e-8 1e-8 1e-8 1e-8 1e-8 1e-8 1e-8 1e-8 1e-8 1e-8 1e-8 1e-8 1e-8 ],'Vectorized','off');
%options=odeset('Mass',M,'MstateDependence','strong','RelTol',1e-10,'AbsTol',[1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 1e-10 ],'Vectorized','off');
 
%tspan = [0 4000];
%tspan = [0 50000]; 
tspan = linspace(0, 50000, 500);
%tspan = linspace(0, 120000, 100);

[y,z]= ode23s(@dopatestJune,tspan,x0,options);

  
figure (1)
subplot(5,3,1)
plot(y,z(:,9)*1e6)
title('BH4 (uM)')
  
subplot(5,3,2)
plot(y,z(:,7)*1e6)
title('Tyrosine (uM)')
 
subplot(5,3,3)
plot(y,z(:,1)*1e9)
title('E1,1 (nM)')
 
subplot(5,3,4)
plot(y,z(:,2)*1e9)
title('E1,2 (nM)')
 
subplot(5,3,5)
plot(y,z(:,3)*1e9)
title('E1,3 (nM)')
 
subplot(5,3,6)
plot(y,z(:,4)*1e9)
title('E1,4 (nM)')
 
subplot(5,3,7)
plot(y,z(:,5)*1e9)
title('E1,5 (nM)')
 
subplot(5,3,8)
plot(y,z(:,6)*1e9)
title('E1,6 (nM)')
 
 
subplot(5,3,15)
plot(y,z(:,16)*1e6)
title('vDA (uM)')
 
subplot(5,3,9)
plot(y,z(:,12)*1e12)
title('BH2 (pM)')
 
subplot(5,3,13)
plot(y,z(:,14)*1e6)
title('L-dopa (uM)')
 
 
subplot(5,3,14)
plot(y,z(:,15)*1e9)
title('cDopamine (nM)')
 
 
subplot(5,3,10)
plot(y,z(:,13)*1e6)
title('qBH2 (uM)')
 
subplot(5,3,11)
plot(y,z(:,10)*1e6)
title('4a-HO-BH3 (uM)')
 
subplot(5,3,12)
plot(y,z(:,11)*1e12)
title('*BH3 (pM)')
 

 
Data = [y z];

headers= {'Time','E1,1','E1,2','E1,3','E1,4','E1,5','E1,6','Tyr','Pool','BH4','4a-HO-PH3','*BH3','BH2','qBH2','ldopa','cDopamine','vDopamine'};
tableData = array2table(Data);
tableData.Properties.VariableNames = headers;
 
filename = 'DopamineTestJune.xlsx'; % Define your filename

% Ensure previous file is removed
if exist(filename, 'file')
    delete(filename);
end

writetable(tableData, filename);
 
 
 
 
 
end
