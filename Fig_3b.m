% To plot Fig. 3(b): the inhibition-release mechanism with gCPG=0.008 and
% gFB=0.008 has an asymmetric limit cycle solution with period=2361. The
% outcome is the components of the asymmetric limit cycle after reflection
% operation.

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
gfb=0.008;       %Feedback synaptic conductance is 0.008.
% initials
initials = [-25.8027824176709,11.8347677573382,0.314715593288461,0.524640362753718,-5.82393505982091e-38,3.86313532340483e-09,-3.16483486768380];
t0=0; tF=4722;   %tF=2*period

%% solve and plot
[T,P] = ode15s(@CPG_FB,[t0:0.01:tF],initials,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
Ps=[0 1 0 0 0 0 0; 1 0 0 0 0 0 0; 0 0 0 1 0 0 0; 0 0 1 0 0 0 0; 0 0 0 0 0 1 0; 0 0 0 0 1 0 0; 0 0 0 0 0 0 -1]*P';  %Matrix [0 1 0 ... 0 0 -1] is a reflection operator.
V1=Ps(1,:); V2=Ps(2,:); N1=Ps(3,:); N2=Ps(4,:); A1=Ps(5,:); A2=Ps(6,:); x=Ps(7,:);
z=zeros(1,length(T));
for i=2:length(T)
    z(i)=(x(i)-x(i-1))/0.1;
end

figure(1)
subplot(3,2,1)
plot(T',V1,'-b','LineWidth',1)
hold on
plot(T',V2,'-r','LineWidth',1);
hold off
axis([0,tF,-44,36])
xlabel('T'); ylabel('V');
subplot(3,2,2)
plot(T',N1,'-b','LineWidth',1)
hold on
plot(T',N2,'-r','LineWidth',1);
hold off
xlabel('T'); ylabel('N');
axis([0,tF,0.22,0.58])
subplot(3,2,3)
plot(T',A1,'-b','LineWidth',1)
hold on
plot(T',A2,'-r','LineWidth',1);
hold off
axis([0,tF,-0.095,0.94])
xlabel('T'); ylabel('A');
subplot(3,2,4)
plot(x(2:end),z(2:end),'-k','LineWidth',1);
axis([-3.6,3.6,-0.0025,0.0025])
xlabel('x'); ylabel('z');
subplot(3,2,5)
plot(V1,N1,'-b','LineWidth',1);
axis([-42,34,0.2,0.6])
xlabel('V_1'); ylabel('N_1');
subplot(3,2,6)
plot(V2,N2,'-r','LineWidth',1);
axis([-42,34,0.2,0.6])
xlabel('V_2'); ylabel('N_2');