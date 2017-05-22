function [x, iter, oi] = SoprGrad(x0)
%Метод сопряжённых градиентов (направлений) Флетчера-Ривза
iter = 0; eps = 0.05; n = 3; oi = 0;
f = @(x) x(1)^2 + 2*x(2)^2 + x(1)^2*x(2)^2 + 2*x(3) + exp(x(2)^2 + x(3)^2) - x(2);
f1 = @(x) [ 2*x(1) + 2*x(1)*x(2)^2;
            4*x(2) + 2*x(1)^2*x(2) + 2*x(2)*exp(x(2)^2 + x(3)^2) - 1;
            2 + 2*x(3)*exp(x(2)^2 + x(3)^2)];
d0 = -f1(x0);
fun = f1(x0);
while ((fun(1)^2+fun(2)^2+fun(3)^2)^(1/2) > eps)
    if (rem(iter+1,n)==0)
        fa = @(a) f(x0+a*d0);
        [alpha, o] = fibon(fa);
        oi = oi + o;
        x0 = x0 + alpha*d0;
        d0 = -f1(x0);
    else
        fa = @(a) f(x0+a*d0);
        alpha = fminsearch(fa, 1);
        funx0 = f1(x0);
        x0 = x0 + alpha*d0;
        funx1 = f1(x0);
        betta = (funx1(1)^2+funx1(2)^2+funx1(3)^2)/(funx0(1)^2+funx0(2)^2+funx0(3)^2);
        d0 = -f1(x0)+betta*d0;        
    end
    iter = iter + 1;
    fun = f1(x0);
end
x = x0;
%всего 6 итераций с одномерной минимизацией на каждой
end

