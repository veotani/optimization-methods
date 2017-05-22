function [x] = Golden()
a = 0.8; b=1.2; eps = 0.05;
f = @(x) (x-0.9)^2+(x-1.1)^4;
while ((b-a)/2>eps)
    c = ((3-5^(1/2))/2)*(b-a) + a;
    d = ((5^(1/2)-1)/2)*(b-a) + a;
    if (f(c)>f(d))
        a=c;
    end
    if (f(c)<f(d))
        b = d;
    end
end
x = (a+b)/2;
end

