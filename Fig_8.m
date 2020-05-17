% To plot Fig. 7: Inhibition-release system (gCPG=0.006 and gFB=0.006)
% with internal noise in feedback signal over 100 periods.

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
t0=0; T0=2286; tF=T0*101; 
initials = [7.6443 17.2454 0.6253 0.3352 0 0.1571 3.80]; % the point with maximum x on the limit cycle

%% solve
minf = @(x) 0.5*(1+tanh((x-E1)/E2));
winf = @(x) 0.5*(1+tanh((x-E3)/E4));
tauw = @(x) 1/cosh((x-E3)/(2*E4));
sinffw = @(x) 0.5*(1+tanh((x-Ethresh)/Eslope));
sinffb = @(x) 1-0.5*tanh((x-x10)/Lslope); 

% solution without noise
[Tl,Pl] = ode15s(@CPG_FB,[t0:0.01:T0],initials,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
xl=Pl(:,7);
zl=zeros(length(Tl),1); 
for i=2:length(Tl)
     zl(i)=(xl(i)-xl(i-1))/0.01;
end

% solution with noise
dt=0.01;
T=[t0:dt:tF]';
V1=zeros(length(T),1); V2=zeros(length(T),1); 
N1=zeros(length(T),1); N2=zeros(length(T),1);
A1=zeros(length(T),1); A2=zeros(length(T),1); 
x=zeros(length(T),1); z=zeros(length(T),1);
V1(1)=initials(1); V2(1)=initials(2); 
N1(1)=initials(3); N2(1)=initials(4);
A1(1)=initials(5); A2(1)=initials(6); 
x(1)=initials(7); 

for i=2:length(T)
    
    L1 = 50+0.8*x(i-1); L2 = 50-0.8*x(i-1);
    Isyn1 = gsyn*sinffw(V2(i-1))*(V1(i-1)-Esyn);
    Isyn2 = gsyn*sinffw(V1(i-1))*(V2(i-1)-Esyn);
    Ifb1 = gfb*sinffb(L2)*(V1(i-1)-Efb);  
    Ifb2 = gfb*sinffb(L1)*(V2(i-1)-Efb);   
    
    V1(i) = V1(i-1)+dt*(Iapp-gca*minf(V1(i-1))*(V1(i-1)-Vca)-gk*N1(i-1)*(V1(i-1)-Vk)-gl*(V1(i-1)-Vl)-Isyn1-Ifb1)/c+0.2*gfb*(V1(i-1)-Efb)*sqrt(sinffb(L2)*(1-sinffb(L2)))*sqrt(dt)*randn/c;
    V2(i) = V2(i-1)+dt*(Iapp-gca*minf(V2(i-1))*(V2(i-1)-Vca)-gk*N2(i-1)*(V2(i-1)-Vk)-gl*(V2(i-1)-Vl)-Isyn2-Ifb2)/c; %+0.2*gfb*(V2(i-1)-Efb)*sqrt(sinffb(L1)*(1-sinffb(L1)))*sqrt(dt)*randn/c
    N1(i) = N1(i-1)+dt*phi*(winf(V1(i-1))-N1(i-1))/tauw(V1(i-1));
    N2(i) = N2(i-1)+dt*phi*(winf(V2(i-1))-N2(i-1))/tauw(V2(i-1));
    
    u1 = (1/2)*V1(i-1); u2 = (1/2)*V2(i-1);
    U1 = (1.03-4.31*exp(-0.198*u1))*(u1>=8);
    U2 = (1.03-4.31*exp(-0.198*u2))*(u2>=8);
    LT1 = -5.27*10^(-4)*L1^2+0.1054*L1-4.27;
    LT2 = -5.27*10^(-4)*L2^2+0.1054*L2-4.27;
    a1 = g*(A1(i-1)-a0); a2 = g*(A2(i-1)-a0);
    F1 = (F0*a1*LT1)*(u1>=8)*(a1>=0); 
    F2 = (F0*a2*LT2)*(u2>=8)*(a2>=0);
    
    A1(i) = A1(i-1)+dt*(1/tau)*(U1-(beta+(1-beta)*U1)*A1(i-1));
    A2(i) = A2(i-1)+dt*(1/tau)*(U2-(beta+(1-beta)*U2)*A2(i-1));
    x(i) = x(i-1)+dt*(1/b)*(F2-F1); 
    z(i) = (x(i)-x(i-1))/dt;
    
end

% to find a unique maximum x over each period
mark0=zeros(length(T),1);
for i=2:length(T)-1
    if (x(i)>0)&&(((x(i)>=x(i-1))&&(x(i)>x(i+1)))||((x(i)>x(i-1))&&(x(i)>=x(i+1))))
            mark0(i)=i;   
    end
end
mark=find(mark0~=0);
Q0=mark(2:end)-mark(1:end-1);
Q=find(Q0>100000);

% to compute the standard deviation of the raltive error between the 
% maximum x of the perturbed and unperturbed trajectory
es=0;   %average
for k=1:100
    e(k)=(x(mark(Q(k)+1))-max(xl))/max(xl);
    es=es+e(k);
end
ea=es/100;
va=0;   %variance
for k=1:100
    va=va+(e(k)-ea)^2;
end
error_in=sqrt(va/100);
disp(error_in);

%% plot
figure(1)
plot(x(2:end),z(2:end),'-r','LineWidth',1.5);
hold on
plot(xl(2:end),zl(2:end),'-k','LineWidth',1.3);
hold off
h=legend('Noise','No noise');
set(h,'FontSize',12);
xlabel('Pendulum position, x');
ylabel('Pendulum velocity, z');