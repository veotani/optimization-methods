function [x, iter, oi] = Fastest_Grad(x0)
%МНГС (проверил на [1; 1; 1])
eps = 0.05; iter = 0; oi = 0;
f = @(x) x(1)^2 + 2*x(2)^2 + x(1)^2*x(2)^2 + 2*x(3) + exp(x(2)^2 + x(3)^2) - x(2);
f1 = @(x) [ 2*x(1) + 2*x(1)*x(2)^2;
            4*x(2) + 2*x(1)^2*x(2) + 2*x(2)*exp(x(2)^2 + x(3)^2) - 1;
            2 + 2*x(3)*exp(x(2)^2 + x(3)^2)];
fa = @(alpha) f(x0 - alpha.*f1(x0));
[alpha0, o] = fibon(fa);
oi = oi + o;
x1 = x0 - alpha0*f1(x0);
fun = f1(x1);
iter = iter + 1;
while ((fun(1)^2+fun(2)^2+fun(3)^2)^(1/2) > eps)
    fa = @(alpha) f(x1 - alpha.*f1(x1));
    [alpha0, o] = fibon(fa);
    oi = oi + o;
    x1 = x1 - alpha0*f1(x1);
    fun = f1(x1);
    iter = iter + 1;
end
x = x1;
%7 итераций + 49 итераций метода Фибонначи.
end

