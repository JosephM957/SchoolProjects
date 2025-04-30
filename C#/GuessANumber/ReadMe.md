# Guess A Number
Create a guessing game. Allow the user to try to guess a number between 1 and 100. They only get 10
chances to guess the correct number. The program should display if the guess is too high, too low, or the
guess is the correct number.
1. Class 1
    a. This is the class with your main method
    b. This method will include a try catch
    c. Ask the user for their name
    d. Include an object to start your game
2. Player Class
    a. Include auto implemented properties for the player name and guesses left
    b. Only allow 10 guesses i. This should be a constant
    c. Include a constructor
    d. Include methods to decrement the guesses and check if the player has any remaining guesses
3. NumberGuessingGame Class
    a. This class has everything to play your game
    b. Include a title and directions for the game
    c. Include an object to get the player’s name
    d. Use a Random Generator to pick your number for the game
    e. Use a loop and try catch to get the user’s guess and to check if the user picks the correct
number or if the number is too high or too low
    f. Create a method to get and validate the player’s guess
        i. The input should be a whole number
            1. Hint: Use your out parameter and TryParse
        ii. Throw an exception
            1. Use the ArgumentException if the user inputs an invalid number
            2. Use an ArgumentOutOfRangeException if the number is not between 1 and 100
