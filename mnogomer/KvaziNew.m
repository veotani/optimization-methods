function [x,iter, oi] = KvaziNew(x0)
%квазиньютоновский метод
n = 3; iter = 0; oi = 0; eps=0.1;
f = @(x) x(1)^2 + 2*x(2)^2 + x(1)^2*x(2)^2 + 2*x(3) + exp(x(2)^2 + x(3)^2) - x(2);
f1 = @(x) [ 2*x(1) + 2*x(1)*x(2)^2;
            4*x(2) + 2*x(1)^2*x(2) + 2*x(2)*exp(x(2)^2 + x(3)^2) - 1;
            2 + 2*x(3)*exp(x(2)^2 + x(3)^2)];
H0 = eye(3);
fun = f1(x0);
while ((fun(1)^2+fun(2)^2+fun(3)^2)^(1/2)>eps)
    fa = @(a) f(x0 - a*H0*f1(x0));
    [alpha, o] = fibon(fa);
    oi = o + oi;
    x1 = x0 - alpha*H0*f1(x0);
    delta = x1 - x0;
    gamma = f1(x1) - f1(x0);
    if (rem(iter,n) == 0)
        H0 = eye(3);
    else
        H0 = H0 + ((delta - H0*gamma)*(delta - H0*gamma)')/((delta - H0*gamma)'*gamma);
    end
    fun = f1(x1); iter = iter + 1;
    x0 = x1;
end
x = x1;
%получилось 45 итераций с выполнением одномерной минимизации на
%каждой из них. 
end

