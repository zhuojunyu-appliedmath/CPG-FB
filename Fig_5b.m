% To plot Fig. 5(b): from precomputed data ir_pitchfork_left.mat
% For ir_pitchfork_left.mat, f array contains Floquet multipliers (row 42 to 48) and the time discretization,
% so one can tell the stability of the limit cycle based on f.
% And x Array contains the phase variables (row 1 to 1128) and parameters (row 1129).
% To make the figure clearly show the bifurcation, select only a few cases around the bifurcation point.

load ir_pitchfork_left.mat

x11=zeros(161,28);
x21=zeros(161,28);
x12=zeros(161,213);
x22=zeros(161,213);
z1=x1(1129,:);
z2=x2(1129,:);
for i = 1:28
    for j = 1:161
        x11(j,i)=x1(7*j-6,i);
        x21(j,i)=x1(7*j-5,i);
    end
end
for i = 1:213
    for j = 1:161
        x12(j,i)=x2(7*j-6,i);
        x22(j,i)=x2(7*j-5,i);
    end
end

figure(1)
%plot stable and symmetric limit cycles
plot3(x22(:,18),x12(:,18),ones(161,1)*z2(18),'b-','LineWidth',1)
hold on
plot3(x22(:,20),x12(:,20),ones(161,1)*z2(20),'b-','LineWidth',1)
plot3(x22(:,22),x12(:,22),ones(161,1)*z2(22),'b-','LineWidth',1)
plot3(x22(:,24),x12(:,24),ones(161,1)*z2(24),'b-','LineWidth',1)
%plot pairs of unstable and asymmetric limit cycles coexisting with the stable limit cycles
plot3(x22(:,46),x12(:,46),ones(161,1)*z2(46),'k--','LineWidth',1)
plot3(x12(:,46),x22(:,46),ones(161,1)*z2(46),'r--','LineWidth',1)
plot3(x22(:,63),x12(:,63),ones(161,1)*z2(63),'k--','LineWidth',1)
plot3(x12(:,63),x22(:,63),ones(161,1)*z2(63),'r--','LineWidth',1)
plot3(x22(:,83),x12(:,83),ones(161,1)*z2(83),'k--','LineWidth',1)
plot3(x12(:,83),x22(:,83),ones(161,1)*z2(83),'r--','LineWidth',1)
plot3(x22(:,101),x12(:,101),ones(161,1)*z2(101),'k--','LineWidth',1)
plot3(x12(:,101),x22(:,101),ones(161,1)*z2(101),'r--','LineWidth',1)
%plot the limit cycle on the bifurcation
plot3(x21(:,15),x11(:,15),ones(161,1)*z1(15),'color',[0.5 0.5 0.5],'LineWidth',1)
%plot the unstable and symmetric limit cycles
plot3(x21(:,16),x11(:,16),ones(161,1)*z1(16),'b--','LineWidth',1)
plot3(x21(:,17),x11(:,17),ones(161,1)*z1(17),'b--','LineWidth',1)
plot3(x21(:,18),x11(:,18),ones(161,1)*z1(18),'b--','LineWidth',1)
hold off
axis([-inf inf -inf inf -inf inf])

xlabel('V_2');
ylabel('V_1');
zlabel('g_{syn}^{FB}');