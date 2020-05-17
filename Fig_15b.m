% To plot Fig. 15(b): from precomputed data ee_torus.mat
% For ee_torus.mat, f array contains Floquet multipliers (row 42 to 48) and the time discretization,
% so one can tell the stability of the limit cycle based on f.
% And x Array contains the phase variables (row 1 to 1128) and parameters (row 1129).

load ee_torus.mat

x1=zeros(161,394);
x2=zeros(161,394);
z=x(1129,:);
for i = 1:394
    for j = 1:161
        x1(j,i)=x(7*j-6,i);
        x2(j,i)=x(7*j-4,i);
    end
end

figure(1)
% plot stable limit cycles
for i=1:2:98
    plot3(x1(:,i),x2(:,i),ones(161,1)*z(i),'b-','LineWidth',1)
    hold on
end
% plot unstable limit cycles
for i=99:3:394
    plot3(x1(:,i),x2(:,i),ones(161,1)*z(i),'r-','LineWidth',1)
    hold on
end
axis([-inf inf -inf inf 0.0072 inf])

xlabel('V_1');
ylabel('N_1');
zlabel('g_{syn}^{FB}');