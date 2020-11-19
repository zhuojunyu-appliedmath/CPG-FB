% To plot Fig. 27(b) from precomputed data compare_release_in.mat
% In the uniform range [0:0.0004:0.014]¡Á[0:0.0004:0.012], 
% compare_release_inx.mat records the absolute difference of the responses 
% to internal noise between the two release systems.
% In the area without intersection, set the response=-0.0008.

load compare_release_in.mat

figure(1)
imagesc(-compare_release_in) %to make the area with larger absolute difference darker, plot reversely

colormap(hot)
h=colorbar;
set(h,'YTick',-0.016:0.004:0,'YTicklabel',0.016:-0.004:0)
set(h,'direction','reverse')

clear gca
set(gca,'xtick',5:5:35,'xticklabel',0.002:0.002:0.014)  
set(gca,'ytick',1.5:5:36.5,'yticklabel',0.012:-0.002:0)  
xlabel('CPG synaptic conductance');
ylabel('Feedback synaptic conductance');