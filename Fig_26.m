% To plot Fig. 26 from precomputed data ex_in_relation.mat
% Data sets ir_ex_in.mat ie_ex_in.mat present the correspondence of two 
% inhibitory systems' responses to external noise and internal noise under 
% each combination of (CPG, FB), respectively. The firse column is the
% response to external noise and the second column is to internal noise.

load ex_in_relation.mat

figure(1)
plot(ir_ex_in(:,2),ir_ex_in(:,1),'.k','MarkerSize',6)
hold on
plot(ie_ex_in(:,2),ie_ex_in(:,1),'.b','MarkerSize',6)
hold off
axis([-inf 0.058 -inf 0.058])
h=legend('inhibition-release data','inhibition-escape data');
set(h,'FontSize',12);
xlabel('internal noise')
ylabel('external noise')