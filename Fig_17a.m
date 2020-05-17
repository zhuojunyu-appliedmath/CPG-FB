% To plot Fig. 17(a) from precomputed data ee_period.mat
% In the uniform range [0:0.0004:0.014]¡Á[0:0.0004:0.012], ee_period.mat records the period data.
% In the area without ability to generate stable periodic orbits, set period=1100.

load ee_period.mat

figure(1)
imagesc(-ee_period) %to make the area with larger period darker, plot reversely

colormap(hot)
h=colorbar;
set(h,'YTick',-8000:2000:-2000,'YTicklabel',8000:-2000:2000)
set(h,'direction','reverse')

clear gca
set(gca,'xtick',5:5:35,'xticklabel',0.002:0.002:0.014)  
set(gca,'ytick',1.5:5:36.5,'yticklabel',0.012:-0.002:0)  
xlabel('CPG synaptic conductance');
ylabel('Feedback synaptic conductance');