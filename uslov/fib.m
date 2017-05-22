function [x] = fib(n)
if (n==1) 
    x = 1;
end
if (n==2)
    x = 1;
end
if (n>2) 
    x = fib(n-1) + fib(n-2);
end