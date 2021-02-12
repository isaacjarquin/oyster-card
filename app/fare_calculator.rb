require 'pry'

class FareCalculator
  def initialize(daily_journies)
    @daily_journies = daily_journies
  end

  def calculate
    return 1.80 if bus_journey?
    return 3.20 if tube_travel_missing_swipe_out?

     1.20
  end

  private

  attr_reader :daily_journies

  def bus_journey?
    transport_by_bus? && daily_journies.count === 1
  end

  def tube_travel_missing_swipe_out?
    transport_by_tube? &&
    daily_journies.any?{|journey| journey.zone_out === nil }
  end

  def transport_by_bus?
    daily_journies.all?{|journey| journey.transport === "bus" }
  end

  def transport_by_tube?
    daily_journies.all?{|journey| journey.transport === "tube" }
  end
end