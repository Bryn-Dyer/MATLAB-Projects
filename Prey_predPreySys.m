function x = Prey_predPreySys(x,r,y)
x = x.*exp(r.*(1-x))-(1.*x.*y);