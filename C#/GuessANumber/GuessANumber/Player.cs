using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GuessANumber
{
    internal class Player
    {
        //defines the properties for the player class
        public string Name { get; set; }
        public int Guesses = 10;
        //A contructor to allow us to pass in two properties
        public Player(string name, int guesses)
        {
            this.Name = name;
            this.Guesses = guesses;
        }
    }
    }