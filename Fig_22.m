% To plot Fig. 22: from precomputed data ee_torus.mat
% In ee_torus.mat, f array contains Floquet multipliers (row 42 to 48) and the time discretization,
% so one can tell the stability of the limit cycle based on f.
% And x array contains the phase variables (row 1 to 1128) and parameters (row 1129).
% Y, Z, W: in unstable cases, the value of N1 when V1=20 and dV1/dt>0, picked from ee_torus.mat

load ee_torus.mat

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

X = zeros(7,98);
t0=0; tF=3000;
options = odeset('Events',@CPG_FB_Event4);
for i = 1:98
    gfb=x(1129,i);    %varied from [0,1]  
    initials = x(1:7,i)';
    [~,~,~,Pend,~] = ode15s(@CPG_FB,[0 tF],initials,options,Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
    X(:,i) = Pend';
end

gfb = x(1129,265);
initials = [3.6655 15.1822 0.7897 0.6720 0 0 4.2899];
[T,P] = ode15s(@CPG_FB,[t0 tF],initials,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
V1 = P(:,1); N1 = P(:,3);

V1_un = zeros(161,1); N1_un = zeros(161,1);
for j = 1:161
    V1_un(j) = x(7*j-6,265);
    N1_un(j) = x(7*j-4,265);
end

V1_un1 = zeros(161,1); N1_un1 = zeros(161,1);
V1_un2 = zeros(161,1); N1_un2 = zeros(161,1);
for j = 1:161
    V1_un1(j) = x(7*j-6,110);
    N1_un1(j) = x(7*j-4,110);
    V1_un2(j) = x(7*j-6,215);
    N1_un2(j) = x(7*j-4,215);
end

V1_a = zeros(161,1); N1_a = zeros(161,1);
for j = 1:161
    V1_a(j) = x(7*j-6,160);
    N1_a(j) = x(7*j-4,160);
end

figure(1)
plot(x(1129,1:98)',X(3,:),'-b','LineWidth',2.3)
hold on
plot(x(1129,98:160)',Y,'--r','LineWidth',2.3)
plot(x(1129,160:242)',Z,'--r','LineWidth',2.3)
plot(x(1129,242:290)',W,'--r','LineWidth',2.3)
axis([0.00762 0.00793 0.663 0.74])
hold off
xlabel('g_{syn}^{FB}')
ylabel('N_1');

figure(2)
plot(V1,N1,'-b','LineWidth',2.3)
hold on
plot(V1_un,N1_un,'--r','LineWidth',2.3)
hold off
xlabel('V_1')
ylabel('N_1');

figure(3)
plot(V1_un1,N1_un1,'--r','LineWidth',2.3)
hold on
plot(V1_un2,N1_un2,'--r','LineWidth',2.3)
hold off
xlabel('V_1')
ylabel('N_1');