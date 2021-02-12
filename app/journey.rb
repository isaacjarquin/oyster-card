require 'date'

class Journey
  attr_reader :date, :transport

  def initialize(transport)
    @transport = transport
    @date = Date.today
  end
end