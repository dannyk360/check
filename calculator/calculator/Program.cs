using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace calculator
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("enter first number");
            int first = int.Parse(Console.ReadLine());
           
            Console.WriteLine("enter second number");
            int second = int.Parse(Console.ReadLine());

            Console.Write($"{first} + {second} = {first + second}");

            Console.ReadLine();
        }
    }
}
