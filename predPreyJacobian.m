function [df, eigen] = predPreyJacobian(x,r,y,b,c,d)
df = zeros(2,2);
df(1,1) = (x.*-r.*exp(r.*(1-x))+exp(r.*(1-x)))-(b.*y);
df(1,2) = -b.*x;
df(2,1) = c.*y;
df(2,2) = (c.*x)-d;
eigen = eig(df);