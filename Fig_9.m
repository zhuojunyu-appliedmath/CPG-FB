% To plot Fig. 9: Inhibition-release system with gCPG=0.006 and gFB=0.006
% is started with an initial postion with 10% error.

%% parameters and initials
% CPG parameters
Iapp=0.8;                      
Vk=-80; Vl=-50; Vca=100;       
gk=0.02; gl=0.005; gca=0.015; 
c=1;                           
E1=0; E3=0;    
E2=15; E4=15;
Ethresh=30;      
Eslope=2;                     
phi=0.0005;    
Esyn=-80;
gsyn=0.008;      %CPG synaptic conductance is 0.006.
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
gfb=0.006;       %Feedback synaptic conductance is 0.006.
% initials
t0=0; tF1=40000; T0=2286; tF2=T0*4; 
initials1 = [7.6443 17.2454 0.6253 0.3352 0 0.1571 3.80]; % the point with maximum x on the limit cycle
initials2 = initials1.*[1 1 1 1 1 1 1.1]; %apply 10% perturbation to the initial position

%% solve and plot
[Tl,Pl] = ode15s(@CPG_FB,[t0:0.01:T0],initials1,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
xl=Pl(:,7);
[Tp,Pp] = ode15s(@CPG_FB,[t0:0.01:tF2],initials2,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
xp=Pp(:,7);
zl=zeros(length(Tl),1); zp=zeros(length(Tp),1);
for i=2:length(Tl)
     zl(i)=(xl(i)-xl(i-1))/0.01;
end
for i=2:length(Tp)
     zp(i)=(xp(i)-xp(i-1))/0.01;
end

error_ex=abs((min(zp)-min(zl))/min(zl));
disp(error_ex);

figure(1)
plot(xp(2:end),zp(2:end),'-r','LineWidth',2);
hold on
plot(xl(2:end),zl(2:end),'-k','LineWidth',2);
hold off
h=legend('perturbed','unperturbed');
set(h,'FontSize',12);
xlabel('Pendulum position, x');
ylabel('Pendulum velocity, z');