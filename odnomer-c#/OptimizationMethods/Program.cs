using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OptimizationMethods
{
    abstract class Met
    {

        //12.03--------------------------------------------------------------------------------------------------------------------------
        static double f1(double x)
        {
            return (Math.Pow((x - 0.9), 2) + Math.Pow((x - 1.1), 4));
        }
        static double df1(double x)
        {
            return (2 * (x - 0.9) + 4 * Math.Pow((x - 1.1), 3));
        }
        static double d2f1(double x)
        {
            return (2 + 12 * Math.Pow((x - 1.1), 2));
        }
        public static double kasat(double a, double b, double eps)
        {
            double x = a;
            try
            {
                x = x - (f1(x) / df1(x));
            }
            catch(DivideByZeroException)
            {
                Console.WriteLine("Found x that causes df1(x) = 0");
            }
            //if (Math.Abs(x - a) > eps) kasat(x, b, eps);
            if (Math.Abs(df1(x)) > eps) kasat(x, b, eps);
            return x;
        }
        public static double newraf(double a, double b, double eps)
        {
            double x = a;
            try
            {
                x = (a * d2f1(a) - df1(a)) / d2f1(a);
            }
            catch(DivideByZeroException)
            {
                Console.WriteLine("Found x that causes d^2f(x) = 0");
            }
            if (a - x > eps) x = newraf(x, b, eps);
            return x;
        }
        public static double secuch(double a, double b, double eps)
        {
            double x0 = a;
            double x1 = b;
            double x2 = x1;
            try
            {
                x2 = x1 - ((x1 - x0) * df1(x1)) / (df1(x1) - df1(x0));
            }
            catch(DivideByZeroException)
            {
                Console.WriteLine("Found x that causes [df1(x(k)) - df1(x(k-1))] = 0");
            }
            if (Math.Abs(df1(x2) - df1(x1)) > eps) secuch(b, x2, eps);
            return x2; 
        }

        //02.04--------------------------------------------------------------------------------------------------------------------------
        static double f(double[] x)
        {
            return (x[0] * x[0] + 2 * x[1] * x[1] + x[0] * x[0] * x[1] * x[1] + x[2] + Math.Exp(x[1] * x[1] + x[2] * x[2]) - x[1] + x[2]);
        }
        static double df(double[] x, int varible)
        {
            double h = 0.1;
            double[] delta_x = x;
            delta_x[varible] += h;

            Console.WriteLine("{0} - это приращение {1} -  а это сама госпожа", f(delta_x), f(x));
            return (f(delta_x) - f(x))/h;
        }

        static double d2f(double[] x, int varible)
        {
            double h = 1;
            double[] X = x;
            X[varible] = x[varible] + h;
            return (df(X, varible) - df(x, varible)) / h;
        }

        public static double newrafx1(double[] x0, double eps, int varible)
        {
            //Console.WriteLine("{0} - посчитанная производная по x{1}", d2f(x0, varible), varible+1);
            if (df(x0, varible) > eps)
            {
                x0[varible] = x0[varible] - df(x0, varible)/d2f(x0, varible);
                newraf(x0, eps, varible);
            }
            return x0[varible];
        }


        public static double[] pokoor(double x1, double x2, double x3, double eps)
        {
            for (int i = 0; i < 3; i++)
            {
                x1 = newraf(, eps/10, i);
                Console.WriteLine(x0[i]);
            }
            if (Math.Sqrt(Math.Pow((X[0] - x0[0]), 2) + Math.Pow((X[1] - x0[1]), 2) + Math.Pow((X[2] - x0[2]), 2)) > eps)
                pokoor(x0, eps);
            return x0;

        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            double[] x0 = new double[3] {1, 1, 1};
            x0 = Met.pokoor(x0[0], x0[1], x0[2], 0.005);
            Console.WriteLine("x1 = {0} x2 = {1} x3 = {2}", x0[0], x0[1], x0[2]);
            Console.ReadKey();
        }
    }
}
