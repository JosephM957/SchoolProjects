using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using static System.Console;
namespace GuessANumber
{

    internal class NumberGuessingGame
    {
        //this sets some global varibles we are going to need throught the entire class
        static Random Randomizer = new Random();
        int number = Randomizer.Next(1, 100);
        int guess = 0;
        int guesses = 1;
        /*this method is the inroduction and leads into other methods in the class. It also accepts a player
        object as a paramater so the player can be passed between the methods.*/

        public void Game(Player player)
        {
            string Title = "Welcome to the Number Guessing Game: " + player.Name;
            string desc = $"You have {player.Guesses} guesses to find the secret number.";
            WriteLine(Title);
            WriteLine(desc);
            WriteLine("");
            guessing();
        }
        //This method is so we can accept and verify the guess is a whole number.
        public int GetGuess()
        {
            int guess = 0;
            Write("Enter your guess: ");
           try
            {
                if (int.TryParse(ReadLine(), out guess))
                {
                    if (guess > 100 || guess < 0)
                    {
                        throw new ArgumentOutOfRangeException();
                    }
                    return guess;
                }
                else
                {
                    throw new ArgumentException();
                }
            }
            catch (ArgumentOutOfRangeException)
            {
                WriteLine("Guess must be between 1 and 100");
                guessing();
            }
            catch (ArgumentException)
            {
                WriteLine("Guess must be a whole number");
                guessing();
            }
            return 0;
        }
        /*
         * this method is where we calculate how many valid guesses there has been and if the current guess is
         * too high or too low of the mystery number.
         */
        public void guessing()
        {
            while (guesses <= 10 && guesses != 0)
            {
                Write("Enter your guess (1-100): ");
                guess = GetGuess();
                if (guess == number)
                {
                    WriteLine($"You got the number {number} in {guesses} guesses");
                    guesses = 11;
                }
                else if (guess > number)
                {
                    WriteLine("Too high. Try again");
                    WriteLine($"You have {10 - guesses} left");
                    guesses++;
                    if (guesses == 11)
                    {
                        WriteLine("You did not correctly guess your number of " + number);
                    }
                }
                else if (guess < number)
                {
                    WriteLine("Too low. Try again");
                    WriteLine($"You have {10 - guesses} left");
                    guesses++;
                    if (guesses == 11)
                    {
                        WriteLine("You did not correctly guess your number of " + number);
                    }
                }
            }

        }
    }
}
