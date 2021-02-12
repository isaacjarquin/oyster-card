require 'date'

class Journey
  attr_reader :date, :transport, :station_in, :zone_in, :zone_out

  ZONES = {
    "Holborn" => [1],
    "Earl’s Court" => [1,2],
    "Chelsea" => [1],
    "Wimbledon" => [3],
    "Hammersmith" => [2]
  }

  def initialize(transport)
    @transport = transport
    @date = Date.today
  end

  def swipe_in(station)
    @station_in = station
    @zone_in = ZONES.fetch(station)
  end
end