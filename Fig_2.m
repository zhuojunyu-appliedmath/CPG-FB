% To plot Fig. 2: (V,N) phase plane for a single Morris-Lecar model neuron.

Iapp=0.8;                      
Vk=-80; Vl=-50; Vca=100;       
gk=0.02; gl=0.005; gca=0.015; 
c=1;                           
E1=0; E3=0;    
E2=15; E4=15;
Ethresh=0;   %0 for escape; 30 for release          
Eslope=2;                     
phi=0.0005;          
Esyn=-80;          
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
gfb=0;  

t0 =0; tF=5500;
initials = [-50  50   0.1    0.5777    0.9050   -0.0000    2.1737];
max1V=110; min1V=-76.63;  % the voltage range of the flow-invariant set

gsyn = 0; 
V = min1V:0.01:max1V;
N = 0.5*(1+tanh((V-E3)/E4)); % N-nullcline
N11_n = (Iapp-gca*0.5*(1+tanh((V-E1)/E2)).*(V-Vca)-gl*(V-Vl))./(gk*(V-Vk));  % V-nullcline
[T1,P1] = ode15s(@CPG_FB,[t0 tF],initials,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,a0,g,tau,beta,F0,b,gfb,Efb,x10,Lslope);
V11=P1(:,1); V21=P1(:,2); N11=P1(:,3); N21=P1(:,4);  % trajectory

gsyn = 0.008;
V = min1V:0.01:max1V;
max2V=58.8240; min2V=-44.7241;  % voltage range
N12_n = (Iapp-gca*0.5*(1+tanh((V-E1)/E2)).*(V-Vca)-gl*(V-Vl)-gsyn*0.5*(1+tanh((max2V-Ethresh)/Eslope)).*(V-Esyn))./(gk*(V-Vk)); % inhibited V-nullcline
N22_n = (Iapp-gca*0.5*(1+tanh((V-E1)/E2)).*(V-Vca)-gl*(V-Vl)-gsyn*0.5*(1+tanh((min2V-Ethresh)/Eslope)).*(V-Esyn))./(gk*(V-Vk)); % active V-nullcline
[T2,P2] = ode15s(@CPG_FB,[t0 tF],initials,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,a0,g,tau,beta,F0,b,gfb,Efb,x10,Lslope);
V12=P2(:,1); V22=P2(:,2); N12=P2(:,3); N22=P2(:,4);  % trajectory

figure(2)
plot(V,N,'-g','LineWidth',2.2)
hold on
plot(V,N11_n,'-r','LineWidth',2.2)
plot(V11,N11,'-k','LineWidth',2.2)
plot(V,N12_n,'-b','LineWidth',2.2)
plot(V12,N12,'--k','LineWidth',2.2)
plot(Ethresh*ones(length(N),1),N,'--m','LineWidth',2)
hold off
xlabel('V_1'); ylabel('N_1')
axis([-inf inf 0 1])