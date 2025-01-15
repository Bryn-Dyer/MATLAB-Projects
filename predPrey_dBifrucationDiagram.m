function [s,t] = predPrey_dBifrucationDiagram(x,r,y,c,dStart,dEnd,noPoint)
d = linspace(dStart,dEnd,noPoint);
hold on
s = zeros([noPoint 20 1]);
t = zeros([noPoint 20 1]);
for i = 1:length(c)
    [u,v] = predPreySysLoop(x,r,y,c,d(i),200);
    k = zeros(2,20);
    k(1,:) = u(181:1:200);
    k(2,:) = v(181:1:200);
    s(i,:) = k(1);
    t(i,:) = k(2);
end
plot(d,s,".","MarkerEdgeColor",[0.25 0.33 0.98],"MarkerFaceColor",[0.25 0.33 0.98]);
xlabel('d');
ylabel({'x for suitable large iterations',});
title('Prey dynamics of the predator prey system')
figure()
plot(d,t,".","MarkerEdgeColor",[0.25 0.33 0.98],"MarkerFaceColor",[0.25 0.33 0.98]);
xlabel('d');
ylabel({'y for suitable large iterations',});
title('Predator dynamics of the predator prey system')