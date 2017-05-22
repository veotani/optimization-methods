function [x, iter] = fibon(f)
a = 0; b=5; eps = 0.05;
n = 1;
iter = 0;
while (fib(n + 2) < (b-a)/eps)
    n = n + 1;
end
while (n>1)
    iter = iter + 1;
   c = a + (b-a)*fib(n)/fib(n+2);
   d = a + (b-a)*fib(n+1)/fib(n+2);
   n=n-1;
   if (f(c)>f(d))
      a = c;
      c = d;
      d = b - (c - a)*fib(n+1)/fib(n+2);
      x = c;
   else
       b = d;
       d = c;
       c = a + (b - a)*fib(n)/fib(n+2);
       x = d;
   end
end
end