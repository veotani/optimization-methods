function [x, iter, odnomeriter] = Comb(x0)
%овражный метод
eps = 0.05; odnomeriter = 0;
f = @(x) x(1)^2 + 2*x(2)^2 + x(1)^2*x(2)^2 + 2*x(3) + exp(x(2)^2 + x(3)^2) - x(2);
f1 = @(x) [ 2*x(1) + 2*x(1)*x(2)^2;
            4*x(2) + 2*x(1)^2*x(2) + 2*x(2)*exp(x(2)^2 + x(3)^2) - 1;
            2 + 2*x(3)*exp(x(2)^2 + x(3)^2)];
fun = f1(x0);
iter = 0;
while ((fun(1)^2+fun(2)^2+fun(3)^2)^(1/2)>eps)
    x1 = 0.1+x0;
    %МНГС из x0
    fa = @(alpha) f(x0 - alpha.*f1(x0));
    [alpha0, odno] = fibon(fa);
    odnomeriter = odnomeriter + o dno;
    x0 = x0 - alpha0*f1(x0);
    iter = iter + 1;    
    %МНГС из x1    
    fa = @(alpha) f(x0 - alpha.*f1(x0));
    alpha0 = fminsearch(fa, 1);
    x1 = x1 - alpha0*f1(x1);
    iter = iter + 1;
    fa = @(alpha) f(x0 + alpha*(x1-x0));
    alpha = fminsearch(fa, 1);
    x0 = x0 + alpha*(x1-x0);
    fun = f1(x0);
    iter = iter + 1;
end
x = x0;
%15 итераций метода + 35 итераций одномерной минимизации (фиббоначи)
end


