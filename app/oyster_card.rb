class OysterCard
  attr_accessor :balance

  def initialize(balance)
    @balance = balance
  end

  def update_balance(fare)
    @balance = balance - fare
  end
end