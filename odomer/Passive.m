function [x] = Passive()
a = 0.8; b=1.2; eps = 0.05;
f = @(x) (x-0.9)^2+(x-1.1)^4;
k = (b-a)/eps;
min = f(a);
for i = 1:1:k
    if (f(a+((b-a)/k)*i)<min)
        min = f(a+((b-a)/k)*i);
        xmin = a+((b-a)/k)*i;
    end
end
x = xmin;
end

