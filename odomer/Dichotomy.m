function [ x ] = Dichotomy()
a = 0.8; b=1.2; eps = 0.05; del = 0.5;
f = @(x) (x-0.9)^2+(x-1.1)^4;
while((a-b)/2>eps)
    c = (a+b)/2 - del/2;
    d = (a+b)/2 + del/2;
    if(f(c)>f(d))
        a = c;
    end
    if (f(c)<f(d))
        b=d;
    end
end
x = (a+b)/2;

end

