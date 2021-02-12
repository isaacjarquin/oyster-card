require_relative './oyster_card.rb'
require_relative './fare_calculator.rb'


class Travelling
  def start
    journey1 = oyster_card.new_journey("tube")
    journey1.swipe_in("Holborn")
    journey1.swipe_out("Earl’s Court")

    journey2 = oyster_card.new_journey("bus")
    journey2.swipe_in("Earl’s Court")
    journey2.swipe_out("Chelsea")

    journey3 = oyster_card.new_journey("tube")
    journey3.swipe_in("Earl’s Court")
    journey3.swipe_out("Hammersmith")

    oyster_card.update_balance(daily_fare.calculate)
  end

  private

  def oyster_card
    @oyster_card ||= OysterCard.new(30.00)
  end

  def daily_fare
    FareCalculator.new(oyster_card.todays_journey)
  end
end