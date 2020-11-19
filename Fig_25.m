% To plot Fig. 25: IR system with gFB=0.01 fixedd can produce a continuum of
% asymmetric solutions from in-phase to anti-phase

% CPG parameters
Iapp=0.8;                      
Vk=-80; Vl=-50; Vca=100;       
gk=0.02; gl=0.005; gca=0.015; 
c=1;                           
E1=0; E3=0;    
E2=15; E4=15;
Ethresh=30;   %0 for escape; 30 for release          
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
Efb=-80;      %80 for excitation; -80 for inhibition        
gfb=0.01;    %varied from [0,1]  

gsyn1 = 0;
initials1 = [-24.9928659251780,-30.0381552386344,0.223884885036761,0.280924341938421,0,0,-2.62060000000000];
gsyn2 = 0.0005;
initials2 = [-24.9834854359822,-31.2636084025501,0.223667773378345,0.299767997654462,7.47877268813594e-34,7.20967379964596e-19,-2.69113308599021];
gsyn3 = 0.002;
initials3 = [-24.8890453183385,-35.6129984456724,0.222741912317520,0.388019885559848,-5.07226915670321e-38,-6.87811395386279e-16,-2.64224820104887];
gsyn4 = 0.01;
initials4 = [-24.7752136997236,-35.8934723946189,0.221688125134247,0.403074332146891,0,0,-2.66450000000000];

t0 = 0; tF = 8000;

[T1,P1] = ode15s(@CPG_FB,[t0 tF],initials1,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn1,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
V11=P1(:,1); V21=P1(:,2); 
[T2,P2] = ode15s(@CPG_FB,[t0 tF],initials2,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn2,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
V12=P2(:,1); V22=P2(:,2); 
[T3,P3] = ode15s(@CPG_FB,[t0 tF],initials3,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn3,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
V13=P3(:,1); V23=P3(:,2); 
[T4,P4] = ode15s(@CPG_FB,[t0 tF],initials4,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn4,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
V14=P4(:,1); V24=P4(:,2); 

figure(1)
subplot(2,2,1)
plot(T1,V11,'-b','LineWidth',2)
hold on
plot(T1,V21,'-r','LineWidth',2)
hold off
xlabel('T'); ylabel('V');
subplot(2,2,2)
plot(T2,V12,'-b','LineWidth',2)
hold on
plot(T2,V22,'-r','LineWidth',2)
hold off
xlabel('T');
subplot(2,2,3)
plot(T3,V13,'-b','LineWidth',2)
hold on
plot(T3,V23,'-r','LineWidth',2)
hold off
xlabel('T'); ylabel('V');
subplot(2,2,4)
plot(T4,V14,'-b','LineWidth',2)
hold on
plot(T4,V24,'-r','LineWidth',2)
hold off
xlabel('T');