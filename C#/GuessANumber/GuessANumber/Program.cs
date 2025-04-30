using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Console;
namespace GuessANumber
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Allows the user to enter their name and passes it to the player object
            Write("Enter your name: ");
            string name = ReadLine();
            // Calls the contructor and defines the player infromation
            Player player = new Player(name, 10);
            NumberGuessingGame game = new NumberGuessingGame();
            game.Game(player);
        }
    }
}
