% To plot Fig. 14(b) from precomputed data er_multiplier.mat
% In the uniform range [0:0.0004:0.014]¡Á[0:0.0004:0.012], er_multiplier.mat records the data of the magnitude of the second multiplier.
% In the area without ability to generate stable periodic orbits, set magnitude=-0.06.

load er_multiplier.mat

figure(1)
imagesc(-er_multiplier) %to make the area with larger magnitude darker, plot reversely

colormap(hot)
h=colorbar;
set(h,'YTick',-0.8:0.2:0,'YTicklabel',0.8:-0.2:0)
set(h,'direction','reverse')

clear gca
set(gca,'xtick',5:5:35,'xticklabel',0.002:0.002:0.014)  
set(gca,'ytick',1.5:5:36.5,'yticklabel',0.012:-0.002:0)  
xlabel('CPG synaptic conductance');
ylabel('Feedback synaptic conductance');