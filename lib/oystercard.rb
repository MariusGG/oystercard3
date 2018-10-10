class Oystercard
  attr_reader :balance

  MAX_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance £#{MAX_LIMIT} exceeded" if @balance >= MAX_LIMIT
    @balance += amount
  end

end
