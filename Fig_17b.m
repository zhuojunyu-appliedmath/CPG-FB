% To plot Fig. 17(b) from precomputed data ie_internal.mat
% In the uniform range [0:0.0004:0.014]��[0:0.0004:0.012], ie_internal.mat records the response to internal noise.
% In the area without ability to generate stable periodic orbits, set the response=-0.0014.

load ie_internal.mat

figure(1)
imagesc(-ie_internal) %to make the area with larger response darker, plot reversely

colormap(hot)
h=colorbar;
set(h,'YTick',-0.05:0.01:0,'YTicklabel',0.05:-0.01:0)
set(h,'direction','reverse')

clear gca
set(gca,'xtick',5:5:35,'xticklabel',0.002:0.002:0.014)  
set(gca,'ytick',1.5:5:36.5,'yticklabel',0.012:-0.002:0)  
xlabel('CPG synaptic conductance');
ylabel('Feedback synaptic conductance');