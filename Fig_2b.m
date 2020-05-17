% To plot Fig. 2(b): the inhibition-release mechanism with gCPG=0.008 and
% gFB=0.006 has a symmetric limit cycle solution with period=2254. The
% outcome is the components of the symmetric limit cycle after a
% half-period shift and reflection operation.

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
gsyn=0.008;      %CPG synaptic conductance is 0.008.
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
initials = [21.1262 -29.7402 0.5174 0.4456 0.5881 0 2.93]; % a point on the limit cycle
t0=0; tF=4508;   %tF=2*period

%% solve and plot
[T,P] = ode15s(@CPG_FB,[t0:0.01:tF],initials,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
Ps=[0 1 0 0 0 0 0; 1 0 0 0 0 0 0; 0 0 0 1 0 0 0; 0 0 1 0 0 0 0; 0 0 0 0 0 1 0; 0 0 0 0 1 0 0; 0 0 0 0 0 0 -1]*P';  %Matrix [0 1 0 ... 0 0 -1] is the reflection operator.
V1=Ps(1,:); V2=Ps(2,:); N1=Ps(3,:); N2=Ps(4,:); A1=Ps(5,:); A2=Ps(6,:); x=Ps(7,:);
z=zeros(1,length(T));
for i=2:length(T)
    z(i)=(x(i)-x(i-1))/0.1;
end

figure(2)
subplot(3,2,1)
plot(T',V1,'-b','LineWidth',1)
hold on
plot(T',V2,'-r','LineWidth',1);
hold off
axis([0,tF,-47,38])
xlabel('T'); ylabel('V');
subplot(3,2,2)
plot(T',N1,'-b','LineWidth',1)
hold on
plot(T',N2,'-r','LineWidth',1);
hold off
axis([0,tF,0.29,0.66])
xlabel('T'); ylabel('N');
subplot(3,2,3)
plot(T',A1,'-b','LineWidth',1)
hold on
plot(T',A2,'-r','LineWidth',1);
hold off
axis([0,tF,-0.09,0.96])
xlabel('T'); ylabel('A');
subplot(3,2,4)
plot(T',x,'-k','LineWidth',1);
axis([0,tF,-4.6,4.6])
xlabel('T'); ylabel('x');
subplot(3,2,5)
plot(V1,N1,'-b','LineWidth',1);
axis([-45,36,0.29,0.66])
xlabel('V_1'); ylabel('N_1');
subplot(3,2,6)
plot(x(2:end),z(2:end),'-k','LineWidth',1);
axis([-4.3,4.3,-0.0028,0.0028])
xlabel('x'); ylabel('z');