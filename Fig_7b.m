% To plot Fig. 7(b) from precomputed data ir_internal.mat
% In the uniform range [0:0.0004:0.014]¡Á[0:0.0004:0.012], ir_internal.mat records the response to internal noise.
% In the area without ability to generate stable periodic orbits, set the response=-0.0005.

load ir_internal.mat

figure(1)
imagesc(-ir_internal) %to make the area with larger response darker, plot reversely

colormap(hot)
h=colorbar;
set(h,'YTick',-0.035:0.01:-0.005,'YTicklabel',0.035:-0.01:0.005)
set(h,'direction','reverse')

clear gca
set(gca,'xtick',5:5:35,'xticklabel',0.002:0.002:0.014)  
set(gca,'ytick',1.5:5:36.5,'yticklabel',0.012:-0.002:0)  
xlabel('CPG synaptic conductance');
ylabel('Feedback synaptic conductance');