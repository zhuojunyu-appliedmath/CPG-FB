% To plot Fig. 7: from precomputed data ir_pitchfork_middle.mat
% In ir_pitchfork_middle.mat, f array contains Floquet multipliers (row 42 to 48) and the time discretization,
% so one can tell the stability of the limit cycle based on f.
% And x array contains the phase variables (row 1 to 1128) and parameters (row 1129).
% To make the figure clearly show the bifurcation, select only a few cases 
% from ir_pitchfork_middle.mat around the bifurcation point.

load ir_pitchfork_middle.mat

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

X = zeros(7,67);
Y = zeros(7,75);
Z = zeros(7,75);
t0=0; tF=3000;
options = odeset('Events',@CPG_FB_Event4);
k = [0 1 0 0 0 0 0; 1 0 0 0 0 0 0; 0 0 0 1 0 0 0; 0 0 1 0 0 0 0; 0 0 0 0 0 1 0; 0 0 0 0 1 0 0; 0 0 0 0 0 0 -1]; % Z2 representation matrix
for i = 1:67
    gfb=x(1129,i);    %varied from [0,1]  
    initials = x(1:7,i)';
    [~,~,~,Pend,~] = ode15s(@CPG_FB,[0 tF],initials,options,Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
    X(:,i) = Pend';
end
for i = 1:75
    gfb=x(1129,67+i-1);    %varied from [0,1]  
    initials1 = x(1:7,67+i-1)';
    initials2 = (k*x(1:7,67+i-1))';
    [~,~,~,Pend1,~] = ode15s(@CPG_FB,[0 tF],initials1,options,Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
    [~,~,~,Pend2,~] = ode15s(@CPG_FB,[0 tF],initials2,options,Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
    Y(:,i) = Pend1';
    Z(:,i) = Pend2';
end

figure(1)
plot(x(1129,1:67)',X(2,:),'-b','LineWidth',2)
hold on
plot(x(1129,67:end)',Y(2,:),'-r','LineWidth',2)
plot(x(1129,67:end)',Z(2,:),'-k','LineWidth',2)
hold off
axis([0.0068 0.0073 -36 2])
xlabel('g_{syn}^{FB}')
ylabel('V_2');