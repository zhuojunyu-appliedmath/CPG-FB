% To plot Fig. 9(a) from precomputed data ie_period.mat
% In the uniform range [0:0.0004:0.014]¡Á[0:0.0004:0.012], ie_period.mat records the period data.
% In the area without ability to generate stable periodic orbits, set period=2100.

load ie_period.mat

figure(1)
imagesc(-ie_period) %to make the area with larger period darker, plot reversely

colormap(hot)
h=colorbar;
set(h,'YTick',-8000:1000:-3000,'YTicklabel',8000:-1000:3000)
set(h,'direction','reverse')

clear gca
set(gca,'xtick',5:5:35,'xticklabel',0.002:0.002:0.014)  
set(gca,'ytick',1.5:5:36.5,'yticklabel',0.012:-0.002:0)  
xlabel('CPG synaptic conductance');
ylabel('Feedback synaptic conductance');