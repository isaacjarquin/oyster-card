I have been asked to model a travelling proccess using an Oystercard, in order
to simulate the problem I have decided to split the problem into 3 main clases/models:
  1 - OysterCard, it represent our card and handles the balance and creation of new Journeys
  2 - Journey, It represents a single journey for a particular person, it will handles the stations the person is travelling from and to. Here we will register if the user has correctly swip in and out of each journey.
  3 - FareCalculator, Includes the logic to calculate the fare charged for all the journeys in a particular day.

I have add test to cover most cases in FareCalculator and OysterCard, you can find them in the spec folder.

In order to execute the program in the console, you need to execute the following comands:

- bundle install
- irb

Once inside irb you need to require main file travelling.rb, which has been added with the only purpose of simulating the
especific route proposed on the exercise:

require_relative './app/travelling.rb'

and then execute:
Travelling.new.start

This will run the exersice to simulate the case proposed in the pdf of this test exersice:

Tube Holborn to Earl’s Court - 328 bus
from Earl’s Court to Chelsea - Tube Earl’s
court to Hammersmith

