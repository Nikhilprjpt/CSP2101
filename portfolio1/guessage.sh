#!/bin/bash

#guessAge game
#NIKHIL BIPINCHANDRA PRAJAPATI
#STUDENT ID: 10467336
#PORTFOLIO TASK 1

generate_random_age(){
    #min age = 20, max age = 70 so RANDOM%51 will give 0 to 50
    #then add 20 to get number between 20 to 70
    ((answer = RANDOM % 51 + 20))
}

#this code will ask the user to guess a random age
echo -e "Hello there! Guess an age between 20 and 70\n"

#this code will generate random age between 20 and 70 
generate_random_age
#loop over until you get correct answer
while ((ageGuess != answer)); do
    read -p "Enter age below to be guessed:" ageGuess
    if (( ageGuess > answer )); then
        echo "Too high, Guess again!"
    elif ((ageGuess < answer )); then
        echo "Too low, Guess again!"
    fi
done
echo -e "Look at that, you guessed it Correct!\n"