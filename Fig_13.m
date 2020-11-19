% To plot Fig. 13: (V,N) phase plane of the escape mechanism without feedback.

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
Efb=80;      %80 for excitation; -80 for inhibition        
gfb=0;    %varied from [0,1]   

t0 =0; tF=6000;
maxV=65.1071; minV=-47.8656;  % voltage range at gsyn = 0.0108

V = -60:0.01:85;
N = 0.5*(1+tanh((V-E3)/E4));  % N-nullcline

gsyn1 = 0.01;   
N11_null = (Iapp-gca*0.5*(1+tanh((V-E1)/E2)).*(V-Vca)-gl*(V-Vl)-gsyn1*0.5*(1+tanh((maxV-Ethresh)/Eslope)).*(V-Esyn))./(gk*(V-Vk)); %inhibited V-nullcline
N21_null = (Iapp-gca*0.5*(1+tanh((V-E1)/E2)).*(V-Vca)-gl*(V-Vl)-gsyn1*0.5*(1+tanh((minV-Ethresh)/Eslope)).*(V-Esyn))./(gk*(V-Vk)); %active V-nullcline
initials = [64.9137  -46.0042    0.2428    0.7821    1.0160    0.0000   -4.6878];
[T,P] = ode15s(@CPG_FB,[t0 tF],initials,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn1,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,a0,g,tau,beta,F0,b,gfb,Efb,x10,Lslope);
V1=P(:,1); V2=P(:,2); N1=P(:,3); N2=P(:,4);  % trajectory

gsyn2 = 0.0108; 
N12_null = (Iapp-gca*0.5*(1+tanh((V-E1)/E2)).*(V-Vca)-gl*(V-Vl)-gsyn2*0.5*(1+tanh((maxV-Ethresh)/Eslope)).*(V-Esyn))./(gk*(V-Vk)); %inhibited V-nullcline
N22_null = (Iapp-gca*0.5*(1+tanh((V-E1)/E2)).*(V-Vca)-gl*(V-Vl)-gsyn2*0.5*(1+tanh((minV-Ethresh)/Eslope)).*(V-Esyn))./(gk*(V-Vk)); %active V-nullcline

gsyn3 = 0.012; 
N13_null = (Iapp-gca*0.5*(1+tanh((V-E1)/E2)).*(V-Vca)-gl*(V-Vl)-gsyn3*0.5*(1+tanh((maxV-Ethresh)/Eslope)).*(V-Esyn))./(gk*(V-Vk)); %inhibited V-nullcline
N23_null = (Iapp-gca*0.5*(1+tanh((V-E1)/E2)).*(V-Vca)-gl*(V-Vl)-gsyn3*0.5*(1+tanh((minV-Ethresh)/Eslope)).*(V-Esyn))./(gk*(V-Vk)); %active V-nullcline

figure(1)
subplot(1,3,1) %gsyn1 = 0.01
plot(V,N,'-g','LineWidth',2.2)
hold on
plot(V,N11_null,'-b','LineWidth',2.2)
plot(V,N21_null,'-r','LineWidth',2.2)
plot(V1,N1,'-k','LineWidth',2.2)
plot(Ethresh*ones(length(N),1),N,'--m','LineWidth',2)
hold off
axis([-58 79 0 1])
xlabel('V'); ylabel('N')
subplot(1,3,2) %gsyn1 = 0.0108
plot(V,N,'-g','LineWidth',2.2)
hold on
plot(V,N12_null,'-b','LineWidth',2.2)
plot(V,N22_null,'-r','LineWidth',2.2)
plot(Ethresh*ones(length(N),1),N,'--m','LineWidth',2)
hold off
axis([-58 79 0 1])
xlabel('V'); ylabel('N')
subplot(1,3,3) %gsyn1 = 0.012
plot(V,N,'-g','LineWidth',2.2)
hold on
plot(V,N13_null,'-b','LineWidth',2.2)
plot(V,N23_null,'-r','LineWidth',2.2)
plot(Ethresh*ones(length(N),1),N,'--m','LineWidth',2)
hold off
axis([-58 79 0 1])
xlabel('V'); ylabel('N')