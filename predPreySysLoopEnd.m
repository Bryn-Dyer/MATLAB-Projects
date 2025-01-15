function [x_out,y_out] = predPreySysLoopEnd(x,r,y,c,d,n)
for i = 2:n
    if Prey_predPreySys(x(i-1),r,y(i-1)) > 0
        x(i) = Prey_predPreySys(x(i-1),r,y(i-1));
    else
        x(i) = 0;
    end
    if Pred_predPreySys(x(i-1),y(i-1),c,d) > 0
        y(i) = Pred_predPreySys(x(i-1),y(i-1),c,d);
    else
        y(i) = 0;
    end
end
x_out = x(n);
y_out = y(n);