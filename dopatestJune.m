// Copyright (c) 2026 Malak Damdoum
// Licensed under the MIT License. See LICENSE file for details.
function dy = dopatestJune(tspan,y)
dy=zeros(16,1);

%Defining rate constants        
 
Coxy= 60e-6; %M Oxygen Concentration
Cth= 17.6e-9; %M TH concentration
Csup= 1e-12;%M Superoxide concentration
 
Qbh4= 10e-9; %M/s

Qtyr= 0.0669e-6; %M/s Normal at 100uM
Kp= 0.167e-9/100e-6; %M/s
Kpr= 1.67e-9/100e-6; %M/s leaving tyrosine
%divided by 100e-6 because that is the normal serum concentration of 
%tyrosine and not all tyrosine converted to L-dopa (Best et al. 2009)

%Qtyr= 0.015e-6; %M/s at 10 um
%Qtyr= 0.0265e-6; %M/s at 20 um
%Qtyr= 0.042e-6; %M/s Normal (lower end, 40uM)



 
Km1= 130e-6; %M   AADC1
Vm1=2.78e-6; %M/s

Km2= 6.95e-6; %M    DHPR temperature paper original
Vm2= 1.114; %M/s 

Km3= 3e-6; %M    dopamine VMAT
Vm3= 1.967e-6; %M/s
 

kcat1= 0.002778; % s-1 cDA 
kpool= 5.5556e-05; % 0.2/3600 ; s-1
ktyr= 5.5556e-05; % 0.2/3600 ; s-1
 
 
    
k1= 0.36e6;%M−1 s−1 Eukaryotic rate constants
k_1= 14;%s-1 
k2= 0.03e6; %M−1 s−1  
k_2= 3.0; %s-1
k3= 300e3; %M−1 s−1  
k_3= 50; %s-1  
k4= 12.7; %s-1 
k5= 22.5; %s-1 
k6= 0.86; %s-1
k7= 0.024; %s-1 
k8= 0.6; %M−1 s−1
k9= 3.9e5; %M−1 s−1
k10= 4.65e4; %M−1 s−1
k11= 3.2e3; %M−1 s−1
k12= 152.5; %s-1

 
 
%Defining rate equations
 
% y1= E1,1; y2= E1,2; y3= E1,3; y4= E1,4; y5= E1,5;
% y6= E1,6; y7= Tyr; y8= Pool; y9= BH4; y10= 4a-HO-MPH3; y11= *BH3 y12= BH2; y13= qBH2 
%y14= L-dopa; y15= cDa; y16= vDa; 
 
dy(1)= k_1*y(2)+k6*y(6)-k1*y(1)*y(9);  % E1,1
dy(2)= k_2*y(3)+k1*y(1)*y(9)-k2*y(2)*y(7)-k_1*y(2); % E1,2
dy(3)= k2*y(7)*y(2)+k_3*y(4)-k3*y(3)*Coxy-k_2*y(3);  % E1,3
dy(4)= k3*y(3)*Coxy-k_3*y(4)-k4*y(4); % E1,4
dy(5)= y(1)+y(2)+y(3)+y(4)+y(5)+y(6)-Cth;   % E1,5
dy(6)= k5*y(5)-k6*y(6);  % E1,6
dy(7)= Qtyr+(Kp*y(8))-k2*y(7)*y(2)-Kpr*y(7)-ktyr*y(7);  % Tyrosine from blood serum with pools
dy(8)= Kpr*y(7)-(Kp*y(8))-kpool*y(8); %Tyrosine pool
dy(9)= Qbh4+(k10*y(11)^2)+((Vm2*y(13))/(Km2+y(13)))-k1*y(9)*y(1)-(k8*y(9)*Coxy)-(k9*y(9)*Csup); % BH4 
dy(10)= k6*y(6)-k7*y(10); % 4a-HO-BH4
dy(11)= (k9*y(9)*Csup)-(2*k10*y(11)^2)-(k11*y(11)*Coxy); %*bh3
dy(12)= (k8*y(9)*Coxy)+(k10*y(11)^2)+(k11*y(11)*Coxy)-k12*y(12);  % BH2
dy(13)= k7*y(10)-((Vm2*y(13))/(Km2+y(13))); %qbh2
dy(14)= k6*y(6)-((Vm1*y(14))/(Km1+y(14)));  % L-dopa
dy(15)= ((Vm1*y(14))/(Km1+y(14)))-((Vm3*y(15))/(Km3+y(15)))-(kcat1*y(15));  % cdopamine with catabolism
dy(16)= (Vm3*y(15))/(Km3+y(15)) ; % vdopamine
end
