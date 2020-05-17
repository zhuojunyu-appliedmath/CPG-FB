% A half-center-oscillator CPG model coupled to a simple biomechanics

clear; clc; 

%% parameters
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
Efb=-80;      %80 for excitation; -80 for inhibition        
gfb=0.008;    %varied from [0,1]       

%% initials
V10=140*rand-70; V20=140*rand-70;
N10=rand; N20=rand;
A10=0.5*rand+0.165; A20=0.5*rand+0.165;
x0=100*(rand-0.5);
initials = [V10 V20 N10 N20 A10 A20 x0];
t0=0; tF=10000;

%% solve
[T,P] = ode15s(@CPG_FB,[t0:0.01:tF],initials,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
V1=P(:,1); V2=P(:,2); N1=P(:,3); N2=P(:,4); A1=P(:,5); A2=P(:,6); x=P(:,7);
z=zeros(length(T),1);
for i=2:length(T)
    z(i)=(x(i)-x(i-1))/0.1;
end

figure(1)
plot(x(2:end),z(2:end))