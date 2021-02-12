require 'date'

class Journey
  attr_reader :date

  def initialize(transport)
    @transport = transport
    @date = Date.today
  end

  private

  attr_reader :transport
end