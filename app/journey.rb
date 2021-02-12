require 'date'

class Journey
  def initialize(transport)
    @transport = transport
  end

  private

  attr_reader :transport
end