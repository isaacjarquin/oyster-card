require_relative './journey.rb'

class OysterCard
  attr_accessor :balance

  def initialize(balance)
    @balance = balance
    @journeis = []
  end

  def update_balance(fare)
    @balance = balance - fare
  end

  def new_journey(transport)
    Journey.new(transport).tap do |journey|
      journeis << journey
    end
  end

  def todays_journey
    @journeis.select{|journey| journey.date == Date.today }
  end

  private

  attr_accessor :journeis
end