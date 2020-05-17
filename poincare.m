% Table 1: Calculate eigenvalues of the Poincare map on the bifurcation 
% point and distinguish the bifurcation type

function [B,v,mu] = poincare(type,gsyn,gfb,initials1)
% fold: ER-mechanism gCPG=0.008, gfb=0.005565 
%   initials1=[29.2345551650604,22.6192984607499,0.779718894934344,0.648062696422137,0.844191590602943,0.620718134826459,4.29321328685580]
% pitchfork; IE-mechanism gCPG=0.0004, gfb=0.00355 
%   initials1=[14.046842725143584,-11.045838013434722,0.698041320125908,0.406083535403089,1.545232408448713e-09,-3.678811984725414e-39,4.9684335340366]
% pitchfork: IR-mechanism gCPG=0.008, gfb=0.00692
%   initials1=[-30.0290462919041,20.9778783042901,0.411375957963820,0.479819749123293,-8.79323090786871e-34,0.580766775732738,-2.68273473593841]
% pitchfork: IR-mechanism gCPG=0.0016, gfb=0.002664
%   initials1=[-20.1373987337723,18.9519598631017,0.487197102296745,0.687664318179940,-5.26460516664499e-23,0.457595574776204,-2.36087520130523]

switch type
    case 'IR'  %inhibition-release
        Ethresh=30;
        Efb=-80;
    case 'IE'  %inhibition-escape
        Ethresh=0;
        Efb=-80;
    case 'ER'  %excitation-release
        Ethresh=30;
        Efb=80;
    case 'EE'  %excitation-escape
        Ethresh=0;
        Efb=80;
end

% CPG parameters
Iapp=0.8;                      
Vk=-80; Vl=-50; Vca=100;       
gk=0.02; gl=0.005; gca=0.015; 
c=1;                           
E1=0; E3=0;    
E2=15; E4=15;      
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

t0=0; T0=3000;  %no less than period

% find the range
[~,P2] = ode15s(@CPG_FB,[t0:0.01:T0],initials1,[],Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
V1=P2(:,1); V2=P2(:,2); N1=P2(:,3); N2=P2(:,4); A1=P2(:,5); A2=P2(:,6); x=P2(:,7);
initials2=P2(end,:);

% find the point on the limit cycle where V1=0 and dV1/dt>0
options = odeset('Events',@CPG_FB_Event1);
[~,~,~,Pend,~] = ode15s(@CPG_FB,[0 T0],initials2,options,Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
p0=Pend;

% apply perturbation and find the point on the perturbed trajectory where V2=0 and dV2/dt>0
mag=0.01;
perV2=mag*(max(V2)-min(V2));
options = odeset('Events',@CPG_FB_Event2);
initials3=p0+[0 perV2 0 0 0 0 0];
[~,~,~,Pend,~] = ode15s(@CPG_FB,[t0 T0],initials3,options,Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
qV2=Pend;
pV2=[0 1 0 0 0 0 0; 1 0 0 0 0 0 0; 0 0 0 1 0 0 0; 0 0 1 0 0 0 0; 0 0 0 0 0 1 0; 0 0 0 0 1 0 0; 0 0 0 0 0 0 -1]*qV2';

perN1=mag*(max(N1)-min(N1));
options = odeset('Events',@CPG_FB_Event2);
initials3=p0+[0 0 perN1 0 0 0 0];
[~,~,~,Pend,~] = ode15s(@CPG_FB,[0 T0],initials3,options,Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
qN1=Pend;
pN1=[0 1 0 0 0 0 0; 1 0 0 0 0 0 0; 0 0 0 1 0 0 0; 0 0 1 0 0 0 0; 0 0 0 0 0 1 0; 0 0 0 0 1 0 0; 0 0 0 0 0 0 -1]*qN1';

perN2=mag*(max(N2)-min(N2));
options = odeset('Events',@CPG_FB_Event2);
initials3=p0+[0 0 0 perN2 0 0 0];
[~,~,~,Pend,~] = ode15s(@CPG_FB,[0 T0],initials3,options,Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
qN2=Pend;
pN2=[0 1 0 0 0 0 0; 1 0 0 0 0 0 0; 0 0 0 1 0 0 0; 0 0 1 0 0 0 0; 0 0 0 0 0 1 0; 0 0 0 0 1 0 0; 0 0 0 0 0 0 -1]*qN2';

perA1=mag*(max(A1)-min(A1));
options = odeset('Events',@CPG_FB_Event2);
initials3=p0+[0 0 0 0 perA1 0 0];
[~,~,~,Pend,~] = ode15s(@CPG_FB,[0 T0],initials3,options,Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
qA1=Pend;
pA1=[0 1 0 0 0 0 0; 1 0 0 0 0 0 0; 0 0 0 1 0 0 0; 0 0 1 0 0 0 0; 0 0 0 0 0 1 0; 0 0 0 0 1 0 0; 0 0 0 0 0 0 -1]*qA1';

perA2=mag*(max(A2)-min(A2));
options = odeset('Events',@CPG_FB_Event2);
initials3=p0+[0 0 0 0 0 perA2 0];
[~,~,~,Pend,~] = ode15s(@CPG_FB,[0 T0],initials3,options,Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
qA2=Pend;
pA2=[0 1 0 0 0 0 0; 1 0 0 0 0 0 0; 0 0 0 1 0 0 0; 0 0 1 0 0 0 0; 0 0 0 0 0 1 0; 0 0 0 0 1 0 0; 0 0 0 0 0 0 -1]*qA2';

perx=mag*(max(x)-min(x));
options = odeset('Events',@CPG_FB_Event2);
initials3=p0+[0 0 0 0 0 0 perx];
[~,~,~,Pend,~] = ode15s(@CPG_FB,[0 T0],initials3,options,Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope);
qx=Pend;
px=[0 1 0 0 0 0 0; 1 0 0 0 0 0 0; 0 0 0 1 0 0 0; 0 0 1 0 0 0 0; 0 0 0 0 0 1 0; 0 0 0 0 1 0 0; 0 0 0 0 0 0 -1]*qx';

% calculate the Jacobian matrix of Q
B=[pV2'-p0; pN1'-p0; pN2'-p0; pA1'-p0; pA2'-p0; px'-p0];
B=B(:,2:end)';
B(:,1)=B(:,1)/perV2;
B(:,2)=B(:,2)/perN1;
B(:,3)=B(:,3)/perN2;
B(:,4)=B(:,4)/perA1;
B(:,5)=B(:,5)/perA2;
B(:,6)=B(:,6)/perx;

% calculate the Jacobian matrix, eigenvalues & eigenvectors of the Poincare map
A=B*B;
[v mu]=eig(A);
mu=diag(mu)

% distiguish the type of bifurcation: fold or pitchfork
disp('|B*v+v|')
n1=norm(B*v(:,1)+v(:,1))
disp('|B*v-v|')
n2=norm(B*v(:,1)-v(:,1))
if n1>n2
    disp('fold')
elseif n2>n1
    disp('pitchfork')
end

end