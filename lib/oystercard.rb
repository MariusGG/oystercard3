class Oystercard
  attr_reader :balance, :in_journey

  MAX_LIMIT = 90
  MIN_AMOUNT = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Maximum balance £#{MAX_LIMIT} exceeded" if max?
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
  def touch_in
    raise "Insufficient balance, minimum amount is #{MIN_AMOUNT}" if @balance < 1
    @in_journey = true

  end
  def touch_out
    @in_journey =false
  end
  def in_journey?
    @in_journey
  end

private

def max?
  @balance >= MAX_LIMIT
end

end
