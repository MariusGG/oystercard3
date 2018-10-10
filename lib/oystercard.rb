class Oystercard
  attr_reader :balance

  MAX_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance £#{MAX_LIMIT} exceeded" if max?
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

private

def max?
  @balance >= MAX_LIMIT
end

end
