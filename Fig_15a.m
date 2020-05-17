% To plot Fig. 15(a): from precomputed data er_fold.mat
% For er_fold.mat, f array contains Floquet multipliers (row 42 to 48) and the time discretization,
% so one can tell the stability of the limit cycle based on f.
% And x Array contains the phase variables (row 1 to 1128) and parameters (row 1129).

load er_fold.mat

x1=zeros(161,88);
x2=zeros(161,88);
z=x(1129,:);
for i = 1:88
    for j = 1:161
        x1(j,i)=x(7*j-6,i);
        x2(j,i)=x(7*j-4,i);
    end
end

figure(1)
% plot stable limit cycles
for i=1:46
    plot3(x1(:,i),x2(:,i),ones(161,1)*z(i),'b-','LineWidth',1)
    hold on
end
% plot unstable limit cycles (inside the stable ones)
for i=47:88
    plot3(x1(:,i),x2(:,i),ones(161,1)*z(i),'r-','LineWidth',1)
    hold on
end
axis([-inf inf -inf inf -inf inf])

xlabel('V_1');
ylabel('N_1');
zlabel('g_{syn}^{FB}');