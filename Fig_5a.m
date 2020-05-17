% To plot Fig. 5(a): from precomputed data ir_pitchfork_middle.mat
% For ir_pitchfork_middle.mat, f array contains Floquet multipliers (row 42 to 48) and the time discretization,
% so one can tell the stability of the limit cycle based on f.
% And x Array contains the phase variables (row 1 to 1128) and parameters (row 1129).
% To make the figure clearly show the bifurcation, select only a few cases around the bifurcation point.

load ir_pitchfork_middle.mat

x1=zeros(161,141);
x2=zeros(161,141);
z=x(1129,:);
for i = 1:141
    for j = 1:161
        x1(j,i)=x(7*j-6,i);
        x2(j,i)=x(7*j-5,i);
    end
end

figure(1)
%plot symmetric limit cycles
plot3(x2(:,62),x1(:,62),ones(161,1)*z(62),'b-','LineWidth',1)
hold on
plot3(x2(:,63),x1(:,63),ones(161,1)*z(63),'b-','LineWidth',1)
plot3(x2(:,64),x1(:,64),ones(161,1)*z(64),'b-','LineWidth',1)
%plot the limit cycle on the bifurcation
plot3(x2(:,65),x1(:,65),ones(161,1)*z(65),'color',[0.5 0.5 0.5],'LineWidth',1)
%plot pairs of asymmetric limit cycles
plot3(x2(:,67),x1(:,67),ones(161,1)*z(67),'k-','LineWidth',1)
plot3(x1(:,67),x2(:,67),ones(161,1)*z(67),'r-','LineWidth',1)
plot3(x2(:,68),x1(:,68),ones(161,1)*z(68),'k-','LineWidth',1)
plot3(x1(:,68),x2(:,68),ones(161,1)*z(68),'r-','LineWidth',1)
plot3(x2(:,69),x1(:,69),ones(161,1)*z(69),'k-','LineWidth',1)
plot3(x1(:,69),x2(:,69),ones(161,1)*z(69),'r-','LineWidth',1)
hold off
axis([-inf inf -inf inf -inf inf])

xlabel('V_2');
ylabel('V_1');
zlabel('g_{syn}^{FB}');