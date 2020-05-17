% To plot Fig. 21(a) from precomputed data compare_inh_ex.mat
% In the uniform range [0:0.0004:0.014]¡Á[0:0.0004:0.012], 
% compare_inh_ex.mat records the absolute difference of the responses to
% external perturbation between the two inhibition-mediated systems.
% In the area without intersection, set the response=-0.0008.

load compare_inh_ex.mat

figure(1)
imagesc(-compare_inh_ex) %to make the area with larger absolute difference darker, plot reversely

colormap(hot)
h=colorbar;
set(h,'YTick',-0.016:0.004:0,'YTicklabel',0.016:-0.004:0)
set(h,'direction','reverse')

clear gca
xlabel('CPG synaptic conductance');
ylabel('Feedback synaptic conductance');
set(gca,'xtick',5:5:35,'xticklabel',0.002:0.002:0.014)  
set(gca,'ytick',1.5:5:36.5,'yticklabel',0.012:-0.002:0)  