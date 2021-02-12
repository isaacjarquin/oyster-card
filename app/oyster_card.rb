require_relative './journey.rb'

class OysterCard
  attr_accessor :balance

  def initialize(balance)
    @balance = balance
  end

  def update_balance(fare)
    @balance = balance - fare
  end

  def new_journey(transport)
    Journey.new(transport)
  end
end