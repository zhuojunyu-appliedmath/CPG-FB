% To plot Fig. 19: from precomputed data er_fold.mat
% In er_fold.mat, f array contains Floquet multipliers (row 42 to 48) and the time discretization,
% so one can tell the stability of the limit cycle based on f.
% And x array contains the phase variables (row 1 to 1128) and parameters (row 1129).
% Y: in unstable cases, the value of N1 when V1=20 and dV1/dt>0, picked from er_fold.mat

load er_fold.mat

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
gsyn=0.008;   %varied from [0,1]   
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

X = zeros(7,46);
t0=0; tF=3000;
options = odeset('Events',@CPG_FB_Event4);
for i = 1:46
    gfb=x(1129,i);    %varied from [0,1]  
    initials = x(1:7,i)';
    [~,~,~,Pend,~] = ode15s(@CPG_FB,[0 tF],initials,options,Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
    X(:,i) = Pend';
end

gfb = x(1129,55);
initials = [-20.3560   31.4122    0.6834    0.7435   -0.0000    0.8806   -2.6628];
[T,P] = ode15s(@CPG_FB,[t0 tF],initials,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
V1 = P(:,1); N1 = P(:,3);

V1_un = zeros(161,1); N1_un = zeros(161,1);
for j = 1:161
    V1_un(j) = x(7*j-6,55);
    N1_un(j) = x(7*j-4,55);
end

V1_a = zeros(161,1); N1_a = zeros(161,1);
for j = 1:161
    V1_a(j) = x(7*j-6,46);
    N1_a(j) = x(7*j-4,46);
end

figure(1)
plot(x(1129,1:46)',X(3,:),'-b','LineWidth',2)
hold on
plot(x(1129,46:end)',Y,'--r','LineWidth',2)
hold off
xlabel('g_{syn}^{FB}')
ylabel('N_1');
figure(2)
plot(V1,N1,'-b','LineWidth',2)
hold on
plot(V1_un,N1_un,'--r','LineWidth',2)
hold off
figure(3)
plot(V1_a,N1_a,'-k','LineWidth',2)