% To plot Fig. 16(a) from precomputed data er_external.mat
% In the uniform range [0:0.0004:0.014]¡Á[0:0.0004:0.012], er_external.mat records the response to external perturbation.
% In the area without ability to generate stable periodic orbits, set the response=0.01.

load er_external.mat

figure(1)
imagesc(-er_external) %to make the area with larger response darker, plot reversely

colormap(hot)
h=colorbar;
set(h,'YTick',-0.04:0.005:-0.015,'YTicklabel',0.04:-0.005:0.015)
set(h,'direction','reverse')

clear gca
set(gca,'xtick',5:5:35,'xticklabel',0.002:0.002:0.014)  
set(gca,'ytick',1.5:5:36.5,'yticklabel',0.012:-0.002:0)  
xlabel('CPG synaptic conductance');
ylabel('Feedback synaptic conductance');