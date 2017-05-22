function [answ, iter, odnomeriter] = Accel_Grad(x0)
%ускоренный градиентный метод (третьего порядка, т.к. рекомендуется брать 
%n = размерности пространства) (лучше использовать в качестве x0 точку 
%[0; 0; 0], чтобы не наткнуться на NaN в вычислениях)
eps = 0.5; iter = 0; odnomeriter = 0;
f = @(x) x(1)^2 + 2*x(2)^2 + x(1)^2*x(2)^2 + 2*x(3) + exp(x(2)^2 + x(3)^2) - x(2);
f1 = @(x) [ 2*x(1) + 2*x(1)*x(2)^2;
            4*x(2) + 2*x(1)^2*x(2) + 2*x(2)*exp(x(2)^2 + x(3)^2) - 1;
            2 + 2*x(3)*exp(x(2)^2 + x(3)^2)];
x1=x0;
for i=1:1:3
    fa = @(alpha) f(x1 - alpha.*f1(x1));
    [alpha0, it] = fibon(fa);
    odnomeriter = odnomeriter + it;
    x1 = x1 - alpha0*f1(x1);
    iter = iter + 1;
end
%x1 - y^k полученное из МНГС
fun = f1(x0);
while ((fun(1)^2+fun(2)^2+fun(3)^2)^(1/2) > eps)
    fa = @(a) f(x0+a*(x1-x0));
    [alpha, it] = fibon(fa);
    odnomeriter = odnomeriter + it;
    x0 = x0 + alpha*(x1-x0);
    fun = f1(x0);
    iter = iter +1;
end
answ = x0;
end
%из (0, 0, 0) 4 итерации + 21 итерация одномерной оптимизации. 

