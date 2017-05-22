 function [x] = Chord()
a = 0.8; b=1.2; eps = 0.05;
f = @(x) (x-0.9)^2+(x-1.1)^4;
f1 = @(x) 2*(x-0.9) + 4*(x-1.1)^3; %производная
x0 = a;
x1 = b;
x2 = x1 - (x1 - x0)*f1(x0)/(f1(x1)-f1(x0));
while (abs(f(x2)) > eps)
    temp = x2;
    x2 = x2 - f1(x2)*(x2-x1)/(f1(x2)-f1(x1));
    x1 = temp;
end
x = x2;
end

