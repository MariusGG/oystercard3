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

it { is_expected.to respond_to :touch_in }
it { is_expected.to respond_to :touch_out }

# describe '#touch_in'
describe '#in_journey?' do
it 'is true after touch_in' do
  subject.top_up(10)
  subject.touch_in
  expect(subject.in_journey?).to be true
end
it 'is false after touch_out' do
  subject.top_up(10)
  subject.touch_in
  subject.touch_out
  expect(subject.in_journey?).to be false
end
end

context "customer doesn't have enough funds" do
  it "raises an error on touch in" do
    min_amount = Oystercard::MIN_AMOUNT
    subject.top_up(rand)
    expect {subject.touch_in}.to raise_error("Insufficient balance, minimum amount is #{min_amount}")
  end
end
end
