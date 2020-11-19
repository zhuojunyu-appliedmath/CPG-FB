% To plot Fig. 23: Excitation-escape mechanism with gCPG=0.0132. At
% gFB=0.002305, an equilibrium is surrounded by an unstable limit cycle.
% The outcome shows the coexistence of the fixed point and limit cycle.

%% parameters and initials
% CPG parameters
Iapp=0.8;                      
Vk=-80; Vl=-50; Vca=100;       
gk=0.02; gl=0.005; gca=0.015; 
c=1;                           
E1=0; E3=0;    
E2=15; E4=15;
Ethresh=0;      
Eslope=2;                     
phi=0.0005;    
Esyn=-80;
gsyn=0.0132;      %CPG synaptic conductance is 0.0132.
% Muscle model parameters
x10=0;              
tau=2.45;                   
beta=0.703;             
a0=0.165;               
g=2;                    
F0=150;              
b=4000;                
% Feedback parameters
Lslope=200;                   
Efb=80;       
gfb=0.002305;       %Feedback synaptic conductance is 0.002305.
% initials
initials1=[-14.646407151372454,16.248413119826242,0.124242460644479,0.897196461276497,0,0.222234396151083,-8.0491447663710];  %the stable fixed point
initials2=[-25.491575192564174,22.068704390716350,0.202719973426685,0.820487989717460,2.371860510295428e-22,0.630999277780332,-7.5420824668402];  %a point on the limit cycle
t0=0; tF=20000;

%% solve and plot
[T1,P1] = ode15s(@CPG_FB,[t0:0.01:tF],initials1,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
[T2,P2] = ode15s(@CPG_FB,[t0:0.01:tF],initials2,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
V11=P1(:,1); V21=P1(:,2); N11=P1(:,3); N21=P1(:,4); 
V12=P2(:,1); V22=P2(:,2); N12=P2(:,3); N22=P2(:,4); 

figure(1)
subplot(1,2,1)
plot(T2,V12,'-b','LineWidth',2);
hold on
plot(T2,V22,'-r','LineWidth',2);
plot(T1,V11,'--k','LineWidth',2);
plot(T1,V21,'--g','LineWidth',2);
hold off
axis([0 tF -50 70]);
xlabel('T'); ylabel('V');
subplot(1,2,2)
plot(V12(2:end),N12(2:end),'-b','LineWidth',2);
hold on
plot(V11(2:end),N11(2:end),'*k','MarkerSize',5);
axis([-50 70 0.05 0.95]);
xlabel('V_1'); ylabel('N_1');
hold off