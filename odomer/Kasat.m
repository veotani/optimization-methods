function [x] = Kasat()
a = 0.8; b=1.2; eps = 0.05;
f = @(x) (x-0.9)^2+(x-1.1)^4;
f1 = @(x) 2*(x-0.9) + 4*(x-1.1)^3; %производная
c = (f1(a)*a - f(a) + f(b) - f1(b)*b)/(f1(a)-f1(b));
while (f1(c)>eps)
    if (f1(c)>0)
        b = c;
    end
    if(f1(c)<0)
        a = c;
    end    
    c = (f1(a)*a - f(a) + f(b) - f1(b)*b)/(f1(a)-f1(b));
end
x = c;
end

