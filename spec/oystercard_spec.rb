require 'oystercard'
describe Oystercard do
context 'when initialized' do
  it 'has a balance of zero' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end
end
describe '#top_up' do
  it 'tops up the card' do
    random_number = rand
    subject.top_up(random_number)
    expect(subject.balance).to eq random_number
  end
end
context 'at maximum balance' do
  it 'can not be topped up' do
    limit = Oystercard::MAX_LIMIT
    subject.top_up(90)
    expect { subject.top_up(1) }.to raise_error("Maximum balance £#{limit} exceeded")
  end
end

describe '#deduct' do
  it 'deducts from my card' do
      random_number1 = rand
      random_number2 = rand
      subject.top_up(random_number1)
      expect {subject.deduct(random_number2)}.to change {subject.balance}.by -random_number2
    end
end

end
