% To plot Fig. 12: from precomputed data ie_pitchfork.mat
% For ie_pitchfork.mat, f array contains Floquet multipliers (row 42 to 48) and the time discretization,
% so one can tell the stability of the limit cycle based on f.
% And x Array contains the phase variables (row 1 to 1128) and parameters (row 1129).
% To make the figure clearly show the bifurcation, select only a few cases around the bifurcation point.

load ie_pitchfork.mat

x1=zeros(161,114);
x2=zeros(161,114);
z=x(1129,:);
for i = 1:114
    for j = 1:161
        x1(j,i)=x(7*j-6,i);
        x2(j,i)=x(7*j-5,i);
    end
end

figure(1)
%plot symmetric limit cycles
plot3(x2(:,20),x1(:,20),ones(161,1)*z(20),'b-','LineWidth',1)
hold on
plot3(x2(:,21),x1(:,21),ones(161,1)*z(21),'b-','LineWidth',1)
plot3(x2(:,22),x1(:,22),ones(161,1)*z(22),'b-','LineWidth',1)
%plot the limit cycle on the bifurcation
plot3(x2(:,24),x1(:,24),ones(161,1)*z(24),'color',[0.5 0.5 0.5],'LineWidth',1)
%plot pairs of asymmetric limit cycles
plot3(x2(:,39),x1(:,39),ones(161,1)*z(39),'k-','LineWidth',1)
plot3(x1(:,39),x2(:,39),ones(161,1)*z(39),'r-','LineWidth',1)
plot3(x2(:,45),x1(:,45),ones(161,1)*z(45),'k-','LineWidth',1)
plot3(x1(:,45),x2(:,45),ones(161,1)*z(45),'r-','LineWidth',1)
plot3(x2(:,51),x1(:,51),ones(161,1)*z(51),'k-','LineWidth',1)
plot3(x1(:,51),x2(:,51),ones(161,1)*z(51),'r-','LineWidth',1)
plot3(x2(:,55),x1(:,55),ones(161,1)*z(55),'k-','LineWidth',1)
plot3(x1(:,55),x2(:,55),ones(161,1)*z(55),'r-','LineWidth',1)
hold off
axis([-inf inf -inf inf -inf inf])

xlabel('V_2');
ylabel('V_1');
zlabel('g_{syn}^{FB}');