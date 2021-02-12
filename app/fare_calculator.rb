require 'pry'

class FareCalculator
  def initialize(daily_journies)
    @daily_journies = daily_journies
  end

  def calculate
    return 1.80 if bus_journey?
    return 3.20 if tube_travel_missing_swipe_out?
    return 2.00 if any_one_zone_outside_zone_one?
    return 2.25 if any_two_zones_excluding_zone_one?
    return 2.50 if single_journey_in_zone_one?

     3.20
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

  def any_one_zone_outside_zone_one?
    daily_journies.count === 1 &&
    journies_begin_outside_zone_one? &&
    journies_end_outside_zone_one?
  end

  def any_two_zones_excluding_zone_one?
    daily_journies.count === 2 &&
    journies_begin_outside_zone_one? &&
    journies_end_outside_zone_one?
  end

  def single_journey_in_zone_one?
    (daily_journies.count === 1) && (any_journey_begin_in_zone_one? || any_journey_end_in_zone_one?)
  end

  def transport_by_bus?
    daily_journies.all?{|journey| journey.transport === "bus" }
  end

  def transport_by_tube?
    daily_journies.all?{|journey| journey.transport === "tube" }
  end

  def journies_begin_outside_zone_one?
    daily_journies.all?{|journey| journey.zone_in != nil && !journey.zone_in.include?(1) }
  end

  def journies_end_outside_zone_one?
    daily_journies.all?{|journey| journey.zone_out != nil && !journey.zone_out.include?(1) }
  end

  def any_journey_begin_in_zone_one?
    daily_journies.any?{|journey| journey.zone_in != nil && journey.zone_in.include?(1) }
  end

  def any_journey_end_in_zone_one?
    daily_journies.any?{|journey| journey.zone_out != nil && journey.zone_out.include?(1) }
  end
end