function [x] = Newton_Rafson(x0)
eps = 0.05;
f = @(x) (x-0.9)^2+(x-1.1)^4;
f1 = @(x) 2*(x-0.9) + 4*(x-1.1)^3; %производная
f2 = @(x) 2 + 12 * (x-1.1)^2; %вторая производная
while (abs(f(x0)) > eps)
    x0 = x0 - f1(x0)/f2(x0);
end
x = x0;
end

