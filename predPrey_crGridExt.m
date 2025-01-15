function [stable] = predPrey_crGridExt(d,n)
r = linspace(0,4,n);
c = linspace(1+d,5,n);
s = 1;
both = 1;
pred = 1;
u = 1;
un = 1;
for i = 1:n
   for j = 1:n
       [x,y] = predPreyFix(r(i),c(j),d);
       [~,eiVal] = predPreyJacobian(x,r(i),y,1,c(j),d);
       if abs(eiVal(1)) < 1 && abs(eiVal(2)) < 1
           stable(s,1) = r(i);
           stable(s,2) = c(j);
           s = s + 1;
       elseif abs(eiVal(1)) > 1 || abs(eiVal(2)) > 1 
           [a,b] = predPreySysLoopEnd(1.01*x,r(i),1.01*y,c(j),d,10000);
           if a == 0 && b == 0
               bExtinct(both,1) = r(i);
               bExtinct(both,2) = c(j);
               both = both + 1;
           elseif a ~= 0 && b == 0
               predExtinct(pred,1) = r(i);
               predExtinct(pred,2) = c(j);
               pred = pred + 1;
           else
               unstable(u,1) = r(i);
               unstable(u,2) = c(j);
               u = u + 1;
           end
       end
   end
end
figure()
colors = [51/255 204/255 51/255; 1 0 0; 0 102/255 1; 1 102/255 0;];
axes("ColorOrder",colors);
plot(stable(:,1),stable(:,2),'.',unstable(:,1),unstable(:,2),'.',bExtinct(:,1),bExtinct(:,2),'.',predExtinct(:,1),predExtinct(:,2),'.');
title('Stability Analysis for varying values of c and r');
xlabel('r');
ylabel('c');
legend('Stable','Unstable but not extinct','Both Extinct','Predator Extinct');