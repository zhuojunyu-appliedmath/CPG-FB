% To plot Fig. 8: from precomputed data ir_pitchfork_left.mat
% In ir_pitchfork_left.mat, f array contains Floquet multipliers (row 42 to 48) and the time discretization,
% so one can tell the stability of the limit cycle based on f.
% And x array contains the phase variables (row 1 to 1128) and parameters (row 1129).
% To make the figure clearly show the bifurcation, select only a few cases 
% from ir_pitchfork_left.mat around the bifurcation point.
% X, Y, Z: the value of V2 when V1=20 and dV1/dt>0, picked from ir_pitchfork_left.mat

load ir_pitchfork_left.mat

x11=zeros(161,28);
x21=zeros(161,28);
x12=zeros(161,213);
x22=zeros(161,213);

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

figure(3)
plot(x1(1129,1:14)',X(1:14),'-b','LineWidth',2)
hold on
plot(x1(1129,14:28)',X(14:28),'--b','LineWidth',2)
plot(x2(1129,30:213)',Y,'--r','LineWidth',2)
plot(x2(1129,30:213)',Z,'--k','LineWidth',2)

xlabel('g_{syn}^{FB}');
ylabel('V_2');