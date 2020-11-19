% To plot Fig. 12(b) from precomputed data ie_multiplier.mat
% In the uniform range [0:0.0004:0.014]¡Á[0:0.0004:0.012], ie_multiplier.mat records the data of the magnitude of the second multiplier.
% In the area without ability to generate stable periodic orbits, set magnitude=-0.05.

load ie_multiplier.mat

figure(1)
imagesc(-ie_multiplier) %to make the area with larger magnitude darker, plot reversely

colormap(hot)
h=colorbar;
set(h,'YTick',-0.9:0.2:-0.1,'YTicklabel',0.9:-0.2:0.1)
set(h,'direction','reverse')

clear gca
set(gca,'xtick',5:5:35,'xticklabel',0.002:0.002:0.014)  
set(gca,'ytick',1.5:5:36.5,'yticklabel',0.012:-0.002:0)  
xlabel('CPG synaptic conductance');
ylabel('Feedback synaptic conductance');