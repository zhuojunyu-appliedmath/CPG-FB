% To plot Fig. 4(a): the inhibition-release mechanism with gCPG=0.008 and
% gFB=0.008 has an asymmetric limit cycle solution with period=2361. The
% outcome is the components of the asymmetric limit cycle after a
% half-period shift.

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
t0=0; tF=5903;    %tF=2.5*period

%% solve and plot
[T,P] = ode15s(@CPG_FB,[t0:0.01:tF],initials,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
V1=P(:,1); V2=P(:,2); N1=P(:,3); N2=P(:,4); A1=P(:,5); A2=P(:,6); x=P(:,7);
z=zeros(1,length(T));
for i=2:length(T)
    z(i)=(x(i)-x(i-1))/0.1;
end

figure(1)
subplot(3,2,1)
plot(T(118100:end),V1(118100:end),'-b','LineWidth',1)
hold on
plot(T(118100:end),V2(118100:end),'-r','LineWidth',1);
hold off
axis([1181,tF,-44,36])
xlabel('T'); ylabel('V');
subplot(3,2,2)
plot(T(118100:end),N1(118100:end),'-b','LineWidth',1);
hold on
plot(T(118100:end),N2(118100:end),'-r','LineWidth',1);
hold off
xlabel('T'); ylabel('N');
axis([1181,tF,0.22,0.58])
subplot(3,2,3)
plot(T(118100:end),A1(118100:end),'-b','LineWidth',1);
hold on
plot(T(118100:end),A2(118100:end),'-r','LineWidth',1);
hold off
axis([1181,tF,-0.095,0.94])
xlabel('T'); ylabel('A');
subplot(3,2,4)
plot(x(118100:end),z(118100:end),'-k','LineWidth',1);
axis([-3.6,3.6,-0.0025,0.0025])
xlabel('x'); ylabel('z');
subplot(3,2,5)
plot(V1(118100:end),N1(118100:end),'-b','LineWidth',1);
axis([-42,34,0.2,0.6])
xlabel('V_1'); ylabel('N_1');
subplot(3,2,6)
plot(V2(118100:end),N2(118100:end),'-r','LineWidth',1);
axis([-42,34,0.2,0.6])
xlabel('V_2'); ylabel('N_2');