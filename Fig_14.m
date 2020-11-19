% To plot Fig. 14: Inhibition-escape mechanism with gCPG=0.012. At
% gFB=0.0027145, an equilibrium is surrounded by an unstable limit cycle.
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
gsyn=0.012;      %CPG synaptic conductance is 0.012.
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
Efb=-80;       
gfb=0.0027145;       %Feedback synaptic conductance is 0.0027145.
% initials
initials1=[8.341656907303511,-30.014618298458107,0.752542927870081,0.017951815791372,0,0,6.37];  %the stable fixed point
initials2=[-32.266514756717240,5.676297856597669,0.054860978843350,0.749765386355475,-6.786109957856386e-47,4.115624678277028e-11,-6.7951718908976];  %a point on the limit cycle
t0=0; tF=13000;

%% solve and plot
[T1,P1] = ode15s(@CPG_FB,[t0:tF],initials1,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
[T2,P2] = ode15s(@CPG_FB,[t0:tF],initials2,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
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
axis([0 tF -54 66]);
xlabel('T'); ylabel('V');
subplot(1,2,2)
plot(V12(1:8000),N12(1:8000),'-b','LineWidth',2);
hold on
plot(V11(1:8000),N11(1:8000),'*k','MarkerSize',5);
axis([-56 68 0.02 0.78]);
xlabel('V_1'); ylabel('N_1');
hold off