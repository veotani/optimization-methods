function [x0] = VneshShtr(x0)
eps = 0.1;
eps1 = 0.01;
r = 1;
f = @(x) x(1)^2+x(2)^2-20*x(1)-16*x(2);
g1 = @(x) -x(1);
g2 = @(x) -x(2);
g3 = @(x) -0.8*x(1)-4+x(2);
g4 = @(x) 0.8*x(1)-12+x(2);
g5 = @(x) x(1) - 6 - x(2);
H = @(x) max(0, g1(x))^2 + max(0, g2(x))^2 + max(0, g3(x))^2 + max(0, g4(x))^2 + max(0, g5(x))^2;
phi = @(x) f(x) + r*H(x);
h = H(x0);
while (h>eps)
    fun = dphi(x0, r);
    while ((fun(1)^2+fun(2)^2)^(1/2) > eps1)
        fa = @(alpha) phi(x0 - alpha.*fun);
        alpha0 = fibon(fa);
        x0 = x0 - alpha0*fun;
        fun = dphi(x0, r);
    end
    h = H(x0);
    r = r*10;
end
end

