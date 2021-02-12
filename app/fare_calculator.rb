require 'pry'

class FareCalculator
  def initialize(daily_journies)
    @daily_journies = daily_journies
  end

  def calculate
    return 1.80 if bus_journey?

     3.20
  end

  private

  attr_reader :daily_journies

  def bus_journey?
    transport_by_bus? && daily_journies.count === 1
  end

  def transport_by_bus?
    daily_journies.all?{|journey| journey.transport === "bus" }
  end
end