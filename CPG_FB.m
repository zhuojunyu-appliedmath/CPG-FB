%% model
function dPdt = CPG_FB(t,P,Iapp,gca,Vca,gk,Vk,gl,Vl,c,gsyn,Esyn,phi,E1,E2,E3,E4,Ethresh,Eslope,g,a0,tau,beta,F0,b,gfb,Efb,x10,Lslope)
V1=P(1); V2=P(2); N1=P(3); N2=P(4); A1=P(5); A2=P(6); x=P(7);

minf1 = 0.5*(1+tanh((V1-E1)/E2));
minf2 = 0.5*(1+tanh((V2-E1)/E2));
winf1 = 0.5*(1+tanh((V1-E3)/E4));
winf2 = 0.5*(1+tanh((V2-E3)/E4));
tauw1 = 1/cosh((V1-E3)/(2*E4));
tauw2 = 1/cosh((V2-E3)/(2*E4));

sinffw1 = 0.5*(1+tanh((V1-Ethresh)/Eslope));
sinffw2 = 0.5*(1+tanh((V2-Ethresh)/Eslope));

L1 = 50+0.8*x;
L2 = 50-0.8*x;

sinffb1 = 1-0.5*tanh((L1-x10)/Lslope);  %1-0.5*tanh((L1-x10)/Lslope) for contraction; 0.5*(1+tanh(L1-x10)/Lslope) for stretching
sinffb2 = 1-0.5*tanh((L2-x10)/Lslope);  %1-0.5*tanh((L2-x10)/Lslope) for contraction; 0.5*(1+tanh(L2-x10)/Lslope) for stretching

Isyn1 = gsyn*sinffw2*(V1-Esyn);    
Isyn2 = gsyn*sinffw1*(V2-Esyn);
Ifb1 = gfb*sinffb2*(V1-Efb);   %gfb*sinffb1*(V1-Efb) for ipsilateral; gfb*sinffb2*(V1-Efb) for contralateral
Ifb2 = gfb*sinffb1*(V2-Efb);   %gfb*sinffb2*(V1-Efb) for ipsilateral; gfb*sinffb1*(V1-Efb) for contralateral

u1 = (1/2)*V1; u2 = (1/2)*V2;
U1 = (1.03-4.31*exp(-0.198*u1))*(u1>=8);
U2 = (1.03-4.31*exp(-0.198*u2))*(u2>=8);
LT1 = -5.27*10^(-4)*L1^2+0.1054*L1-4.27;
LT2 = -5.27*10^(-4)*L2^2+0.1054*L2-4.27;

a1 = g*(A1-a0); 
F1 = (F0*a1*LT1)*(u1>=8)*(a1>=0);
a2 = g*(A2-a0);
F2 = (F0*a2*LT2)*(u2>=8)*(a2>=0);

dV1dt = (Iapp-gca*minf1*(V1-Vca)-gk*N1*(V1-Vk)-gl*(V1-Vl)-Isyn1-Ifb1)/c;
dV2dt = (Iapp-gca*minf2*(V2-Vca)-gk*N2*(V2-Vk)-gl*(V2-Vl)-Isyn2-Ifb2)/c;
dN1dt = phi*(winf1-N1)/tauw1;
dN2dt = phi*(winf2-N2)/tauw2;
dA1dt = (1/tau)*(U1-(beta+(1-beta)*U1)*A1);
dA2dt = (1/tau)*(U2-(beta+(1-beta)*U2)*A2);
dxdt = (1/b)*(F2-F1);

dPdt = [dV1dt;dV2dt;dN1dt;dN2dt;dA1dt;dA2dt;dxdt];
end